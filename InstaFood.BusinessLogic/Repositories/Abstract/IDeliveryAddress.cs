using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories.Abstract
{
    public interface IDeliveryAddress:IRepository<DeliveryAddress>
    {
        Task Update(DeliveryAddress obj);
    }
}
