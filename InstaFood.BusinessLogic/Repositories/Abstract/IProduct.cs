using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories.Abstract
{
    public interface IProduct:IRepository<Product>
    {
        Task Update(Product obj);
    }
}
