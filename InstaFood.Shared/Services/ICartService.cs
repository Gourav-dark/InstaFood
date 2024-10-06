using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

namespace InstaFood.Shared.Services
{
    public interface ICartService
    {
        Task<PagedResponse<IEnumerable<CartItem>>> getCartItem(int pageSize,int pageNumber,string customerId);
        Task<Response<CartItem>> addCartItem(CartItemDTO obj);
        Task<Response<CartItem>> updateCartItem(CartItemDTO obj);
        Task<Response<CartItem>> deleteCartItem(string CustomerId,int productId);
        Task<Response<CartItem>> deleteAllCartItem(string CustomerId);
    }
}
