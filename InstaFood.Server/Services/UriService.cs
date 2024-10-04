using InstaFood.Server.Filter;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using Microsoft.AspNetCore.WebUtilities;

namespace InstaFood.Server.Services
{
    public class UriService : IUriService
    {
        public string GetPageUri(PaginationFilter pageFilter, string route, string? filter, string? id)
        {
            string uri = route + "?pageNumber=" + pageFilter.PageNumber.ToString() + "&pageSize=" + pageFilter.PageSize.ToString();

            if (!string.IsNullOrEmpty(filter) && !string.IsNullOrEmpty(id))
            {
                return uri + "&filter=" + filter + "&id=" + id;
            }
            else if (!string.IsNullOrEmpty(filter))
            {
                return uri + "&filter=" + filter;
            }
            else if (!string.IsNullOrEmpty(id))
            {
                return uri + "&id=" + id;
            }

            return uri;
        }

        public string GetPageUri(int pageSize, string route, string? filter = null, string? id = null)
        {
            string uri = route + "?pageSize=" + pageSize.ToString();

            if (!string.IsNullOrEmpty(filter) && !string.IsNullOrEmpty(id))
            {
                return uri + "&filter=" + filter + "&id=" + id;
            }
            else if (!string.IsNullOrEmpty(filter))
            {
                return uri + "&filter=" + filter;
            }
            else if (!string.IsNullOrEmpty(id))
            {
                return uri + "&id=" + id;
            }

            return uri;
        }
    }
}
