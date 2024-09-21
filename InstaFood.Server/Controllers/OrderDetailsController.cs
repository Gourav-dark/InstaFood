using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.Wrappers;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderDetailsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public OrderDetailsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        [HttpGet("{Id}")]
        public async Task<IActionResult> GetByOrderId(string Id)
        {
            try
            {
                IEnumerable<OrderDetail> details = await _unitOfWork.orderDetail.GetAllAsync(x=>x.OrderId==Id);
                if (details.Count() > 0)
                {
                    foreach (OrderDetail detail in details) 
                    {
                        detail.Product=await _unitOfWork.product.GetAsync(x=>x.ProductId==detail.ProductId);
                    }
                    return Ok(new Response<IEnumerable<OrderDetail>>(details));
                }
                return NotFound(new Response<IEnumerable<OrderDetail>>()
                {
                    Succeeded=false,
                    Message="Order Id Not Found."
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
