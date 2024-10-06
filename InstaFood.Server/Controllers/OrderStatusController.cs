using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.Wrappers;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OrderStatusController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public OrderStatusController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var status = await _unitOfWork.orderStatus.GetAllAsync();
                if (status.Count() > 0)
                {
                    return Ok(new Response<IEnumerable<OrderStatus>>(status));
                }
                return NotFound(
                    new Response<OrderStatus>()
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
        [HttpGet("{id}")]
        public async Task<IActionResult> get(int id)
        {
            try
            {
                var status = await _unitOfWork.orderStatus.GetAsync(x=>x.OrderStatusId==id);
                if (status != null)
                {
                    return Ok(status.Status.ToString());
                }
                return Ok("Not Found");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
