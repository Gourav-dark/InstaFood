using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;
using System.Net.Http;
using System.Net.Http.Json;

namespace InstaFood.Shared.Services
{
    public class CartService : ICartService
    {
        private readonly HttpClient _httpClient;
        public CartService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<Response<CartItem>> addCartItem(CartItemDTO obj)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync<CartItemDTO>($"/api/cartitems",obj);
                var result = await response.Content.ReadFromJsonAsync<Response<CartItem>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Response<CartItem>> deleteAllCartItem(string CustomerId)
        {
            throw new NotImplementedException();
        }

        public async Task<Response<CartItem>> deleteCartItem(string CustomerId, int productId)
        {
            throw new NotImplementedException();
        }

        public async Task<PagedResponse<IEnumerable<CartItem>>> getCartItem(int pageSize, int pageNumber, string customerId)
        {
            try
            {
                var response = await _httpClient.GetAsync($"/api/cartitems?pageSize={pageSize}&pageNumber={pageNumber}&id={customerId}");
                var result = await response.Content.ReadFromJsonAsync<PagedResponse<IEnumerable<CartItem>>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Response<CartItem>> updateCartItem(CartItemDTO obj)
        {
            try
            {
                var response = await _httpClient.PutAsJsonAsync<CartItemDTO>($"/api/cartitems", obj);
                var result = await response.Content.ReadFromJsonAsync<Response<CartItem>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
