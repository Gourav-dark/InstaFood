namespace InstaFood.Shared.Wrappers
{
    public class PagedResponse<T> : Response<T>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
        public string FirstPage { get; set; }
        public string LastPage { get; set; }
        public int TotalPages { get; set; }
        public int TotalRecords { get; set; }
        public string NextPage { get; set; }
        public string PreviousPage { get; set; }
        public string CurrentPage { get; set; }

        public PagedResponse(T data, int pageNumber, int pageSize)
        {
            this.PageNumber = pageNumber;
            this.PageSize = pageSize;
            this.Data = data;
            this.Message = null;
            this.Succeeded = true;
            this.Errors = null;
        }
        public string getCustomPageUri(int pageNumber)
        {
            return CurrentPage + "&PageNumber=" + pageNumber;
        }
    }
}
