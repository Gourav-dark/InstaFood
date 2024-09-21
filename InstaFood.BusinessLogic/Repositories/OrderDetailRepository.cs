using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class OrderDetailRepository : Repository<OrderDetail>, IOrderDetail
    {
        private readonly ApplicationDbContext _db;
        public OrderDetailRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
    }
}
