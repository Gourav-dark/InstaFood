using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories.Abstract
{
    public interface IOrder:IRepository<Order>
    {
        Task UpdateStatus(string id,string orderStatus);
    }
}
