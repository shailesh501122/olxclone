namespace OlxClone.Application.Contracts;

public record PropertyCreateRequest(
    Guid ListingId,
    string ListingType,
    string PropertyType,
    int BHK,
    int Bathrooms,
    string Furnishing,
    decimal BuiltUpArea,
    decimal CarpetArea,
    int TotalFloors,
    int FloorNumber,
    bool Parking,
    string Facing,
    int PropertyAge,
    decimal? Price,
    decimal? RentAmount,
    decimal? DepositAmount,
    decimal? MaintenanceCharges,
    bool IsNegotiable,
    string City);

public record PropertyUpdateRequest(Guid Id, PropertyCreateRequest Data);

public record PropertyListQuery(
    decimal? MinPrice,
    decimal? MaxPrice,
    int? BHK,
    string? PropertyType,
    string? City,
    string? ListingType,
    string? Furnishing,
    bool? Parking,
    int Page = 1,
    int PageSize = 20,
    string? SortBy = "MostRecent");

public record PropertyListItem(
    Guid Id,
    string ListingType,
    string PropertyType,
    int BHK,
    int Bathrooms,
    string Furnishing,
    decimal BuiltUpArea,
    string City,
    decimal DisplayPrice,
    bool IsNegotiable,
    bool IsFeatured,
    DateTime CreatedAt);
