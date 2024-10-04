using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using InstaFood.Shared.Wrappers;
using Microsoft.AspNetCore.Authorization;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class DeliveryAddressesController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public DeliveryAddressesController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        [HttpGet("{customerId}")]
        public async Task<IActionResult> GetByCustomerId(string customerId)
        {
            try
            {
                var obj = await _unitOfWork.deliveryAddress.GetAsync(x => x.CustomerId == customerId);
                if (obj != null)
                {
                    return Ok(new Response<DeliveryAddress>(obj));
                }
                return NotFound(new Response<DeliveryAddress>()
                {
                    Succeeded=false,
                    Message="Customer Id not Found"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        public async Task<IActionResult> Post(DeliveryAddressDTO obj)
        {
            try
            {
                DeliveryAddress newObj=new DeliveryAddress()
                {
                    CustomerId = obj.CustomerId,
                    Phone=obj.Phone,
                    Street=obj.Street,
                    City=obj.City,
                    PostalCode=obj.PostalCode,
                    State=obj.State,
                    LandMark=obj.LandMark,
                };
                await _unitOfWork.deliveryAddress.AddAsync(newObj);
                await _unitOfWork.Save();
                return Ok(new Response<DeliveryAddress>()
                {
                    Succeeded = true,
                    Message = "Address Added Successfully."
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut]
        public async Task<IActionResult> Put(DeliveryAddressDTO obj)
        {
            try
            {
                var exist=await _unitOfWork.deliveryAddress.GetAsync(x=>x.CustomerId == obj.CustomerId);
                if (exist != null)
                {
                    exist.Phone = obj.Phone;
                    exist.Street = obj.Street;
                    exist.City = obj.City;
                    exist.PostalCode = obj.PostalCode;
                    exist.State = obj.State;
                    exist.LandMark = obj.LandMark;

                    await _unitOfWork.deliveryAddress.Update(exist);
                    await _unitOfWork.Save();
                    return Ok(new Response<DeliveryAddress>()
                    {
                        Succeeded = true,
                        Message = "Address Updated Successfully."
                    });
                }
                return NotFound(new Response<DeliveryAddress>()
                {
                    Succeeded = false,
                    Message = "Customer Id not Found"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
