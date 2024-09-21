using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories.Abstract
{
    public interface ICartItem:IRepository<CartItem>
    {
        Task Update(CartItem cartItem);
    }
}
