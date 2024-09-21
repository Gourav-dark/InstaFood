using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class DeliveryAddressRepository : Repository<DeliveryAddress>, IDeliveryAddress
    {
        private readonly ApplicationDbContext _db;
        public DeliveryAddressRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public async Task Update(DeliveryAddress obj)
        {
            _db.DeliveryAddresses.Update(obj);
        }
    }
}
