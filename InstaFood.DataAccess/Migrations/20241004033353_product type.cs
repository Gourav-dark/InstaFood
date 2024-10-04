using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace InstaFood.DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class producttype : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "NonVeg",
                table: "Products",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NonVeg",
                table: "Products");
        }
    }
}
