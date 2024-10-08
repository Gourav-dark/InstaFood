using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;
using System.Net.Http.Json;

namespace InstaFood.Shared.Services
{
    public class ProductService : IProductService
    {
        private readonly HttpClient _httpClient;
        public ProductService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<Response<Product>> Add(ProductDTO obj)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<Product>> DeleteById(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<Product>> getById(int id)
        {
            try
            {
                var response = await _httpClient.GetAsync($"/api/Products/{id}");
                var result = await response.Content.ReadFromJsonAsync<Response<Product>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<PagedResponse<IEnumerable<Product>>> getProducts(int pageSize, int pageNumber, string? filter)
        {
            try
            {
                string requestUri = $"/api/Products?pageSize={pageSize}&pageNumber={pageNumber}";

                if (!string.IsNullOrEmpty(filter))
                {
                    requestUri += $"&filter={filter}";
                }
                HttpResponseMessage response = await _httpClient.GetAsync(requestUri);
                var result = await response.Content.ReadFromJsonAsync<PagedResponse<IEnumerable<Product>>>();
                return result;
            }
            catch (Exception ex)
            {
                // Log the exception (ex) if necessary
                return null;
            }
        }

        public async Task<PagedResponse<IEnumerable<Product>>> getProductsByPage(string pageUrl)
        {
            try
            {
                var response = await _httpClient.GetAsync(pageUrl);
                var result = await response.Content.ReadFromJsonAsync<PagedResponse<IEnumerable<Product>>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Response<Product>> isAvailable(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<Product>> Update(ProductDTO obj)
        {
            throw new NotImplementedException();
        }
    }
}
