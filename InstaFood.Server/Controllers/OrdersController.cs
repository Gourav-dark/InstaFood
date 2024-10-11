using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.Wrappers;
using InstaFood.Server.Filter;
using InstaFood.Server.Helper;
using InstaFood.Server.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OrdersController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUriService _uriService;
        public OrdersController(IUnitOfWork unitOfWork,IUriService uriService)
        {
            _unitOfWork = unitOfWork;
            _uriService = uriService;
        }
        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] PaginationFilter pageFilter, [FromQuery] string? filter = null, [FromQuery] string? id = null)
        {
            var route = Request.Path.Value;
            var validFilter = new PaginationFilter(pageFilter.PageNumber, pageFilter.PageSize);

            var allItems = (await _unitOfWork.order.GetAllAsync()).OrderByDescending(o => o.OrderDate).ThenByDescending(o => o.OrderTime);
            IEnumerable<Order> filteredItems;

            if (!string.IsNullOrEmpty(filter))
            {
                var OrderStatusId = (await _unitOfWork.orderStatus.GetAsync(x => x.Status.ToLower() == filter.ToLower())).OrderStatusId;
                filteredItems = allItems.Where(x => x.OrderStatusId == OrderStatusId);
            }
            else
            {
                filteredItems = allItems;
            }

            if (!string.IsNullOrEmpty(id))
            {
                filteredItems = filteredItems.Where(x => x.CustomerId == id);
            }

            var pagedData = filteredItems
                            .Skip((validFilter.PageNumber - 1) * validFilter.PageSize)
                            .Take(validFilter.PageSize)
                            .ToList();

            if (pagedData.Count > 0)
            {
                foreach (var item in pagedData)
                {
                    item.Customer = await _unitOfWork.user.GetAsync(x => x.UserId == item.CustomerId);
                    item.OrderStatus = await _unitOfWork.orderStatus.GetAsync(x => x.OrderStatusId == item.OrderStatusId);
                }
            }

            var totalRecords = filteredItems.Count();
            var pagedResponse = PaginationHelper.CreatePagedResponse<Order>(pagedData, validFilter, totalRecords, _uriService, route,filter,id);

            return Ok(pagedResponse);
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(string id)
        {

            Order order = await _unitOfWork.order.GetAsync(x => x.OrderId == id);
            if (order != null)
            {
                order.Customer = await _unitOfWork.user.GetAsync(x => x.UserId == order.CustomerId);
                order.OrderStatus = await _unitOfWork.orderStatus.GetAsync(x => x.OrderStatusId == order.OrderStatusId);
                return Ok(new Response<Order>(order));
            }
            return NotFound(
                new Response<Order>()
                {
                    Succeeded = false,
                    Message = "Id not Found."
                });
        }
        [HttpGet("placeOrder/{customerId}")]
        [Authorize(Roles ="Customer")]
        public async Task<IActionResult> PlaceOrder(string customerId)
        {
            try
            {
                var cartItems = await _unitOfWork.cartItem.GetAllAsync(x => x.CustomerId == customerId);
                float totalCost = 0;
                if (cartItems.Count() > 0)
                {
                    foreach(var cartItem in cartItems)
                    {
                        Product product=await _unitOfWork.product.GetAsync(x=>x.ProductId == cartItem.ProductId);
                        totalCost += cartItem.Quantity * product.UnitPrice;
                    }
                    Order newOrder=new Order() 
                    {
                        CustomerId = customerId,
                        TotalCost = totalCost,
                    };
                    await _unitOfWork.order.AddAsync(newOrder);
                    await _unitOfWork.Save();
                    foreach (var cartItem in cartItems) 
                    {
                        OrderDetail detail = new OrderDetail()
                        {
                            OrderId=newOrder.OrderId,
                            ProductId=cartItem.ProductId,
                            Quantity = cartItem.Quantity
                        };
                        await _unitOfWork.orderDetail.AddAsync(detail);
                    }
                    await _unitOfWork.cartItem.RemoveRangeAsync(cartItems);
                    await _unitOfWork.Save();
                    return Ok(new Response<Order>(newOrder));
                }
                return NotFound(
                    new Response<Order>()
                    {
                        Succeeded = false,
                        Message = "Cart is null."
                    });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpDelete("{id}")]
        [Authorize(Roles ="Admin")]
        public async Task<IActionResult> StatusUpdate(string id,[FromQuery]string type)
        {
            try
            {
                var existOrder = await _unitOfWork.order.GetAsync(x => x.OrderId == id);
                if (existOrder != null)
                {
                    await _unitOfWork.order.UpdateStatus(id, type);
                    await _unitOfWork.Save();
                    return Ok(new Response<Order>(existOrder)
                    {
                        Message = "Order status updated successfully."
                    });
                }
                return NotFound(
                    new Response<Order>()
                    {
                        Succeeded = false,
                        Message = "Id not Found."
                    });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpDelete("cancel")]
        [Authorize(Roles = "Customer")]
        public async Task<IActionResult> Cancel(string id)
        {
            try
            {
                var existOrder = await _unitOfWork.order.GetAsync(x => x.OrderId == id);
                if (existOrder != null)
                {
                    await _unitOfWork.order.UpdateStatus(id, "Cancelled");
                    await _unitOfWork.Save();
                    return Ok(new Response<Order>(existOrder)
                    {
                        Message = "Order Cancelled."
                    });
                }
                return NotFound(
                    new Response<Order>()
                    {
                        Succeeded = false,
                        Message = "Id not Found."
                    });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
