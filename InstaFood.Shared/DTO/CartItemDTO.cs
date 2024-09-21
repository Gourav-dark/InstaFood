namespace InstaFood.Shared.DTO
{
    public class CartItemDTO
    {
        public string CustomerId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; } = 1;
    }
}
