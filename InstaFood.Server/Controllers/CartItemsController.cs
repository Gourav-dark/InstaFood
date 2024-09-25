using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using Microsoft.AspNetCore.Mvc;
using InstaFood.Server.Filter;
using InstaFood.Server.Helper;
using InstaFood.Server.Services;
using InstaFood.Shared.Wrappers;
using Microsoft.AspNetCore.Authorization;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartItemsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUriService _uriService;
        public CartItemsController(IUnitOfWork unitOfWork,IUriService uriService)
        {
            _unitOfWork = unitOfWork;
            _uriService = uriService;
        }
        [HttpGet]
        //[Authorize(Roles ="Customer")]
        public async Task<IActionResult> Get([FromQuery] PaginationFilter pageFilter, [FromQuery] string customerId = null)
        {
            var route = Request.Path.Value;
            var validFilter = new PaginationFilter(pageFilter.PageNumber, pageFilter.PageSize);

            var allItems = await _unitOfWork.cartItem.GetAllAsync();
            IEnumerable<CartItem> filteredItems;

            if (!string.IsNullOrEmpty(customerId))
            {
                filteredItems = allItems.Where(x => x.CustomerId == customerId);
            }
            else
            {
                filteredItems = allItems;
            }

            var pagedData = filteredItems
                            .Skip((validFilter.PageNumber - 1) * validFilter.PageSize)
                            .Take(validFilter.PageSize)
                            .ToList();
            if (pagedData.Count() > 0)
            {
                foreach (var item in pagedData)
                {
                    item.Product = await _unitOfWork.product.GetAsync(x => x.ProductId == item.ProductId);
                }
            }
            var totalRecords = filteredItems.Count();
            var pagedResponse = PaginationHelper.CreatePagedResponse<CartItem>(pagedData, validFilter, totalRecords, _uriService, route);

            return Ok(pagedResponse);
        }
        [HttpPost]
        public async Task<IActionResult> Post(CartItemDTO item)
        {
            CartItem existItem = await _unitOfWork.cartItem.GetAsync(x => x.ProductId == item.ProductId && x.CustomerId == item.CustomerId);
            if (existItem == null)
            {
                CartItem newItem = new CartItem()
                {
                    ProductId = item.ProductId,
                    CustomerId = item.CustomerId,
                    Quantity = item.Quantity
                };
                await _unitOfWork.cartItem.AddAsync(newItem);
                await _unitOfWork.Save();
                return Ok(new Response<CartItem>()
                {
                    Succeeded = true,
                    Message = "Item successfully Added in Cart."
                });
            }
            return NotFound(new Response<CartItem>()
            {
                Succeeded = false,
                Message = "Product Already in the Cart."
            });
        }
        [HttpPut]
        public async Task<IActionResult> Put(CartItemDTO item)
        {
            CartItem existItem = await _unitOfWork.cartItem.GetAsync(x => x.ProductId == item.ProductId && x.CustomerId == item.CustomerId);
            if (existItem != null && item.Quantity > 0)
            {
                existItem.Quantity = item.Quantity;
                await _unitOfWork.cartItem.Update(existItem);
                await _unitOfWork.Save();
                return Ok(new Response<CartItem>()
                {
                    Succeeded = true,
                    Message = "Updated successfully."
                });
            }
            return NotFound(new Response<CartItem>()
            {
                Succeeded = false,
                Message = "Item not found."
            });
        }
        [HttpDelete]
        public async Task<IActionResult> Delete([FromQuery]string customerId,[FromQuery]int productId)
        {
            CartItem existItem = await _unitOfWork.cartItem.GetAsync(x => x.ProductId == productId && x.CustomerId == customerId);
            if (existItem != null)
            {
                await _unitOfWork.cartItem.RemoveAsync(existItem);
                await _unitOfWork.Save();
                return Ok(new Response<CartItem>()
                {
                    Succeeded = true,
                    Message = "Item Removed from Cart."
                });
            }
            return NotFound(new Response<CartItem>()
            {
                Succeeded = false,
                Message = "Item not found."
            });
        }
        [HttpDelete("{customerId}")]
        public async Task<IActionResult> DeleteAll(string customerId)
        {
            IEnumerable<CartItem> existItems = await _unitOfWork.cartItem.GetAllAsync(x => x.CustomerId == customerId);
            if (existItems.Count()>0)
            {
                await _unitOfWork.cartItem.RemoveRangeAsync(existItems);
                await _unitOfWork.Save();
                return Ok(new Response<CartItem>()
                {
                    Succeeded = true,
                    Message = "All Item Removed from Cart."
                });
            }
            return NotFound(new Response<CartItem>()
            {
                Succeeded = false,
                Message = "Item not found."
            });
        }
    }
}
