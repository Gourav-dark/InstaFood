using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class ProductRepository : Repository<Product>, IProduct
    {
        private readonly ApplicationDbContext _db;
        public ProductRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        public async Task Update(Product obj)
        {
            _db.Products.Update(obj);
        }
    }
}
