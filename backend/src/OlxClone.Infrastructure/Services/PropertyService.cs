using Microsoft.EntityFrameworkCore;
using OlxClone.Application.Contracts;
using OlxClone.Application.Services;
using OlxClone.Domain.Entities;
using OlxClone.Infrastructure.Persistence;

namespace OlxClone.Infrastructure.Services;

public class PropertyService(AppDbContext dbContext) : IPropertyService
{
    public async Task<Guid> CreateAsync(PropertyCreateRequest request, CancellationToken cancellationToken = default)
    {
        var property = Map(request);
        dbContext.Properties.Add(property);
        await dbContext.SaveChangesAsync(cancellationToken);
        return property.Id;
    }

    public async Task<IReadOnlyList<PropertyListItem>> ListAsync(PropertyListQuery query, CancellationToken cancellationToken = default)
    {
        var source = dbContext.Properties.AsNoTracking().Where(p => !p.IsDeleted);

        if (query.MinPrice.HasValue) source = source.Where(p => (p.Price ?? p.RentAmount ?? 0) >= query.MinPrice.Value);
        if (query.MaxPrice.HasValue) source = source.Where(p => (p.Price ?? p.RentAmount ?? 0) <= query.MaxPrice.Value);
        if (query.BHK.HasValue) source = source.Where(p => p.BHK == query.BHK.Value);
        if (!string.IsNullOrWhiteSpace(query.PropertyType)) source = source.Where(p => p.PropertyType == query.PropertyType);
        if (!string.IsNullOrWhiteSpace(query.City)) source = source.Where(p => p.City == query.City);
        if (!string.IsNullOrWhiteSpace(query.ListingType)) source = source.Where(p => p.ListingType == query.ListingType);
        if (!string.IsNullOrWhiteSpace(query.Furnishing)) source = source.Where(p => p.Furnishing == query.Furnishing);
        if (query.Parking.HasValue) source = source.Where(p => p.Parking == query.Parking.Value);

        source = query.SortBy switch
        {
            "PriceLowToHigh" => source.OrderBy(p => p.Price ?? p.RentAmount ?? 0),
            "PriceHighToLow" => source.OrderByDescending(p => p.Price ?? p.RentAmount ?? 0),
            _ => source.OrderByDescending(p => p.CreatedAt)
        };

        return await source
            .Skip((query.Page - 1) * query.PageSize)
            .Take(query.PageSize)
            .Select(p => new PropertyListItem(
                p.Id, p.ListingType, p.PropertyType, p.BHK, p.Bathrooms, p.Furnishing,
                p.BuiltUpArea, p.City, p.Price ?? p.RentAmount ?? 0, p.IsNegotiable, p.Status == "Featured", p.CreatedAt))
            .ToListAsync(cancellationToken);
    }

    public async Task<PropertyListItem?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
        => await dbContext.Properties.AsNoTracking()
            .Where(p => p.Id == id && !p.IsDeleted)
            .Select(p => new PropertyListItem(
                p.Id, p.ListingType, p.PropertyType, p.BHK, p.Bathrooms, p.Furnishing,
                p.BuiltUpArea, p.City, p.Price ?? p.RentAmount ?? 0, p.IsNegotiable, p.Status == "Featured", p.CreatedAt))
            .FirstOrDefaultAsync(cancellationToken);

    public async Task<bool> UpdateAsync(Guid id, PropertyCreateRequest request, CancellationToken cancellationToken = default)
    {
        var property = await dbContext.Properties.FirstOrDefaultAsync(p => p.Id == id && !p.IsDeleted, cancellationToken);
        if (property is null) return false;
        Apply(property, request);
        property.UpdatedAt = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var property = await dbContext.Properties.FirstOrDefaultAsync(p => p.Id == id && !p.IsDeleted, cancellationToken);
        if (property is null) return false;
        property.IsDeleted = true;
        property.UpdatedAt = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    private static Property Map(PropertyCreateRequest request)
    {
        var property = new Property();
        Apply(property, request);
        return property;
    }

    private static void Apply(Property property, PropertyCreateRequest request)
    {
        property.ListingId = request.ListingId;
        property.ListingType = request.ListingType;
        property.PropertyType = request.PropertyType;
        property.BHK = request.BHK;
        property.Bathrooms = request.Bathrooms;
        property.Furnishing = request.Furnishing;
        property.BuiltUpArea = request.BuiltUpArea;
        property.CarpetArea = request.CarpetArea;
        property.TotalFloors = request.TotalFloors;
        property.FloorNumber = request.FloorNumber;
        property.Parking = request.Parking;
        property.Facing = request.Facing;
        property.PropertyAge = request.PropertyAge;
        property.Price = request.Price;
        property.RentAmount = request.RentAmount;
        property.DepositAmount = request.DepositAmount;
        property.MaintenanceCharges = request.MaintenanceCharges;
        property.IsNegotiable = request.IsNegotiable;
        property.City = request.City;
    }
}
