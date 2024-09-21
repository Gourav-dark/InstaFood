using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class CartItemRepository : Repository<CartItem>, ICartItem
    {
        private readonly ApplicationDbContext _db;
        public CartItemRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public async Task Update(CartItem obj)
        {
            _db.CartItems.Update(obj);
        }
    }
}
