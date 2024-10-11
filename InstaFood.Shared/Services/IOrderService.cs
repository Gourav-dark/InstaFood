using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

namespace InstaFood.Shared.Services
{
    public interface IOrderService
    {
        Task<PagedResponse<IEnumerable<Order>>> getOrders(int PageSize, int PageNumber, string? filter = null,string? customerId=null);
        Task<PagedResponse<IEnumerable<Order>>> getOrderByPage(string? pageUrl);
        Task<Response<Order>> getById(string id);
        Task<Response<Order>> PlaceOrder(string customerId);
        Task<Response<Order>> Update(string orderId,string status);
        Task<Response<Order>> Cancel(string id);

        //Order Status 
        Task<Response<OrderStatus>> getAllStatus();
        Task<Response<IEnumerable<OrderDetail>>> getOrderDetailByOrderId(string orderId);
    }
}
