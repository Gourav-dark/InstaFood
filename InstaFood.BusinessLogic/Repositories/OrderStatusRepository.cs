using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class OrderStatusRepository:Repository<OrderStatus>,IOrderStatus
    {
        private readonly ApplicationDbContext _db;
        public OrderStatusRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
    }
}
