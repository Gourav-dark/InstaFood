using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using InstaFood.Server.Filter;
using InstaFood.Server.Helper;
using Microsoft.EntityFrameworkCore;
using InstaFood.Server.Services;
using InstaFood.Shared.Wrappers;
using Microsoft.IdentityModel.Tokens;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUriService _uriService;
        public ProductsController(IUnitOfWork unitOfWork, IUriService uriService)
        {
            _unitOfWork = unitOfWork;
            _uriService = uriService;
        }
        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] PaginationFilter pageFilter, [FromQuery] string filter=null)
        {
            var route = Request.Path.Value;
            var validFilter = new PaginationFilter(pageFilter.PageNumber, pageFilter.PageSize);

            var allProducts = (await _unitOfWork.product.GetAllAsync()).OrderBy(x => x.ProductName);
            IEnumerable<Product> filteredProducts;

            if (string.IsNullOrEmpty(filter))
            {
                filteredProducts = allProducts;
            }
            else
            {
                filteredProducts = allProducts.Where(x => x.ProductName.ToLower().Contains(filter.ToLower()));
            }

            var pagedData = filteredProducts
                            .Skip((validFilter.PageNumber - 1) * validFilter.PageSize)
                            .Take(validFilter.PageSize)
                            .ToList();

            var totalRecords = filteredProducts.Count();
            var pagedResponse = PaginationHelper.CreatePagedResponse<Product>(pagedData, validFilter, totalRecords, _uriService, route);

            return Ok(pagedResponse);
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {

            Product product = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
            if (product != null) 
            {
                return Ok(new Response<Product>(product));
            }
            return NotFound(
                new Response<Product>() 
                { 
                    Succeeded=false,
                    Message="Id not Found."
                });

        }
        [HttpPost]
        public async Task<IActionResult> Post(ProductDTO obj)
        {
            try
            {
                Product newProduct = new Product()
                {
                    ProductName = obj.ProductName,
                    ProductDescription = obj.ProductDescription,
                    UnitPrice = obj.UnitPrice,
                    ProductPicture=obj.ImageUrl
                };
                await _unitOfWork.product.AddAsync(newProduct);
                await _unitOfWork.Save();
                return Ok(
                    new Response<Product>()
                    {
                        Succeeded = true,
                        Message = "Product Added successfully"
                    });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, ProductDTO obj)
        {
            Product existProduct = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
            if (existProduct != null)
            {
                existProduct.ProductName = obj.ProductName;
                existProduct.ProductDescription = obj.ProductDescription;
                existProduct.UnitPrice = obj.UnitPrice;
                await _unitOfWork.product.Update(existProduct);
                await _unitOfWork.Save();
                return Ok(
                    new Response<Product>()
                    {
                        Succeeded = true,
                        Message = "Updated successfully."
                    });
            }
            return NotFound(
               new Response<Product>()
               {
                   Succeeded = false,
                   Message = "Id not Found."
               });
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            Product existProduct = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
            if (existProduct != null)
            {
                await _unitOfWork.product.RemoveAsync(existProduct);
                await _unitOfWork.Save();
                return Ok(
                    new Response<Product>()
                    {
                        Succeeded = true,
                        Message = "Product is Removed."
                    });
            }
            return NotFound(
                new Response<Product>()
                {
                    Succeeded = false,
                    Message = "Id not Found."
                });
        }
        [HttpDelete("isAvailable/{id}")]
        public async Task<IActionResult> isAvailable(int id)
        {
            Product existProduct = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
            if (existProduct != null)
            {
                existProduct.IsAvailable=!existProduct.IsAvailable;
                await _unitOfWork.product.Update(existProduct);
                await _unitOfWork.Save();
                return Ok(
                   new Response<Product>()
                   {
                       Succeeded = true,
                       Message = "Product Availblity is Updated."
                   });
            }
            return NotFound(
                new Response<Product>()
                {
                    Succeeded = false,
                    Message = "Id not Found."
                });
        }
        //[HttpPut("image/{id}")]
        //public async Task<IActionResult> ImageUplaod(int id,[FromForm]IFormFile file)
        //{
        //    try
        //    {
        //        Product existProduct = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
        //        if (file != null && file.Length > 0 && existProduct!=null) 
        //        {
        //            string fileName = "product_" + id.ToString() + Path.GetExtension(file.FileName);
        //            string productPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "product", fileName);
        //            if (System.IO.File.Exists(productPath))
        //            {
        //                System.IO.File.Delete(productPath);
        //            }
        //            using (var stream = new FileStream(productPath, FileMode.Create))
        //            {
        //                file.CopyTo(stream);
        //            }
        //            existProduct.ProductName = fileName;
        //            await _unitOfWork.product.Update(existProduct);
        //            await _unitOfWork.Save();
        //            return Ok(new { message = "Image Uploaded successfully." });
        //        }
        //        return NotFound();
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }

        //}
    }
}
