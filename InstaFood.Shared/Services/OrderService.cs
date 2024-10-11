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
            try
            {
                var response = await _httpClient.GetAsync($"/api/Orders/cancel?Id={id}");
                var result = await response.Content.ReadFromJsonAsync<Response<Order>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Response<Order>> getById(string id)
        {
            try
            {
                var response = await _httpClient.GetAsync($"/api/Orders/{id}");
                var result = await response.Content.ReadFromJsonAsync<Response<Order>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }

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
                string requestUri = $"/api/Orders?pageSize={PageSize}&pageNumber={PageNumber}";

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
            try
            {
                var response = await _httpClient.GetAsync($"/api/Orders/placeOrder/{customerId}");
                var result = await response.Content.ReadFromJsonAsync<Response<Order>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }

        }
        public async Task<Response<Order>> Update(string orderId, string status)
        {
            try
            {
                var response = await _httpClient.DeleteAsync($"/api/Orders/{orderId}?type={status}");
                var result = await response.Content.ReadFromJsonAsync<Response<Order>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }

        }
        public async Task<Response<OrderStatus>> getAllStatus()
        {
            try
            {
                var response = await _httpClient.GetAsync($"/api/OrderStatus");
                var result = await response.Content.ReadFromJsonAsync<Response<OrderStatus>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Response<IEnumerable<OrderDetail>>> getOrderDetailByOrderId(string orderId)
        {
            try
            {
                var response = await _httpClient.GetAsync($"/api/OrderDetails/{orderId}");
                var result= await response.Content.ReadFromJsonAsync<Response<IEnumerable<OrderDetail>>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
