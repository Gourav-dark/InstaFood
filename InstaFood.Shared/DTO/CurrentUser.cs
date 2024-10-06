namespace InstaFood.Shared.DTO
{
    public class CurrentUser
    {
        public bool IsAuthenticated { get; set; }
        public string? UserId { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Role { get; set; }
    }
}
