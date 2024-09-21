using InstaFood.Server.Filter;

namespace InstaFood.Server.Services
{
    public interface IUriService
    {
        public Uri GetPageUri(PaginationFilter filter, string route);
    }
}
