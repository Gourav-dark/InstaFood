using InstaFood.DataAccess.Models;
using InstaFood.Shared.Wrappers;
using System.Net.Http;
using System.Net.Http.Json;

namespace InstaFood.Shared.Services
{
    public class OrderService : IOrderService
    {
        private readonly HttpClient _httpClient;
        public OrderService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<Response<Order>> Cancel(string id)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<Order>> getById(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<PagedResponse<IEnumerable<Order>>> getOrderByPage(string? pageUrl)
        {
            try
            {
                var response = await _httpClient.GetAsync(pageUrl);
                var result = await response.Content.ReadFromJsonAsync<PagedResponse<IEnumerable<Order>>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<PagedResponse<IEnumerable<Order>>> getOrders(int PageSize, int PageNumber, string? filter = null, string? customerId = null)
        {
            try
            {
                string requestUri = $"/api/Products?pageSize={PageSize}&pageNumber={PageNumber}";

                if (!string.IsNullOrEmpty(filter))
                {
                    requestUri += $"&filter={filter}";
                }

                if (!string.IsNullOrEmpty(customerId))
                {
                    requestUri += $"&id={customerId}";
                }

                HttpResponseMessage response = await _httpClient.GetAsync(requestUri);
                var result = await response.Content.ReadFromJsonAsync<PagedResponse<IEnumerable<Order>>>();
                return result;
            }
            catch (Exception ex)
            {
                // Log the exception (ex) if necessary
                return null;
            }
        }

        public async Task<Response<Order>> PlaceOrder(string customerId)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<Order>> Update(string orderId, string status)
        {
            throw new NotImplementedException();
        }
    }
}
