namespace OlxClone.Domain.Entities;

public class Property : BaseEntity
{
    public Guid ListingId { get; set; }
    public string ListingType { get; set; } = "Sale";
    public string PropertyType { get; set; } = string.Empty;
    public int BHK { get; set; }
    public int Bathrooms { get; set; }
    public string Furnishing { get; set; } = string.Empty;
    public decimal BuiltUpArea { get; set; }
    public decimal CarpetArea { get; set; }
    public int TotalFloors { get; set; }
    public int FloorNumber { get; set; }
    public bool Parking { get; set; }
    public string Facing { get; set; } = string.Empty;
    public int PropertyAge { get; set; }
    public decimal? Price { get; set; }
    public decimal? RentAmount { get; set; }
    public decimal? DepositAmount { get; set; }
    public decimal? MaintenanceCharges { get; set; }
    public bool IsNegotiable { get; set; }
    public string City { get; set; } = string.Empty;
}
