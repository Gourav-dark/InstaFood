using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Data;
using InstaFood.DataAccess.Models;

namespace InstaFood.BusinessLogic.Repositories
{
    public class UserRepository : Repository<User>, IUser
    {
        private readonly ApplicationDbContext _db;
        public UserRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
    }
}
