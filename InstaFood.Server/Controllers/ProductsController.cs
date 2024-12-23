﻿using InstaFood.BusinessLogic.Repositories.Abstract;
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
    [Authorize]
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
            var pagedResponse = PaginationHelper.CreatePagedResponse<Product>(pagedData, validFilter, totalRecords, _uriService, route,filter);

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
        [Authorize(Roles ="Admin")]
        public async Task<IActionResult> Post(ProductDTO obj)
        {
            try
            {
                Product newProduct = new Product()
                {
                    ProductName = obj.ProductName,
                    ProductDescription = obj.ProductDescription,
                    UnitPrice = obj.UnitPrice,
                    ProductPicture=obj.ImageUrl,
                    NonVeg=obj.NonVeg,
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
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Put(int id, ProductDTO obj)
        {
            Product existProduct = await _unitOfWork.product.GetAsync(x => x.ProductId == id);
            if (existProduct != null)
            {
                existProduct.ProductName = obj.ProductName;
                existProduct.ProductDescription = obj.ProductDescription;
                existProduct.UnitPrice = obj.UnitPrice;
                existProduct.NonVeg = obj.NonVeg;
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
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
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
    }
}
