using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

namespace InstaFood.Shared.Services
{
    public interface IProductService
    {
        //Task<PagedResponse<IEnumerable<Product>>> getProducts(int? PageNumber = null,int? PageSize=null);
        //Task<PagedResponse<IEnumerable<Product>>> getProductsByName(string filter);
        Task<PagedResponse<IEnumerable<Product>>> getProducts(int PageSize, int PageNumber, string? filter=null);
        Task<PagedResponse<IEnumerable<Product>>> getProductsByPage(string? pageUrl);

        Task<Response<Product>> getById(int id);
        Task<Response<Product>> Add(ProductDTO obj);
        Task<Response<Product>> Update(ProductDTO obj);
        Task<Response<Product>> DeleteById(int id);
        Task<Response<Product>> isAvailable(int id);
    }
}
