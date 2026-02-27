using OlxClone.Application.Contracts;

namespace OlxClone.Application.Services;

public interface IPropertyService
{
    Task<Guid> CreateAsync(PropertyCreateRequest request, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<PropertyListItem>> ListAsync(PropertyListQuery query, CancellationToken cancellationToken = default);
    Task<PropertyListItem?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<bool> UpdateAsync(Guid id, PropertyCreateRequest request, CancellationToken cancellationToken = default);
    Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);
}
