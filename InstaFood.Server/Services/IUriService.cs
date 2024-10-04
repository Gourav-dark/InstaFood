using InstaFood.Server.Filter;

namespace InstaFood.Server.Services
{
    public interface IUriService
    {
        public string GetPageUri(PaginationFilter pageFilter, string route, string? filter=null,string? id=null);
        public string GetPageUri(int pageSize,string route,string? filter=null,string? id=null);
    }
}

