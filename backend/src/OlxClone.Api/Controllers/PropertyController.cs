using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OlxClone.Application.Contracts;
using OlxClone.Application.Services;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/property")]
public class PropertyController(IPropertyService propertyService) : ControllerBase
{
    [Authorize]
    [HttpPost("create")]
    public async Task<IActionResult> Create([FromBody] PropertyCreateRequest request, CancellationToken cancellationToken)
    {
        var id = await propertyService.CreateAsync(request, cancellationToken);
        return Ok(new { id, message = "Property listing created" });
    }

    [HttpGet("list")]
    public async Task<IActionResult> List([FromQuery] PropertyListQuery query, CancellationToken cancellationToken)
        => Ok(await propertyService.ListAsync(query, cancellationToken));

    [HttpGet("{id:guid}")]
    public async Task<IActionResult> Get(Guid id, CancellationToken cancellationToken)
    {
        var property = await propertyService.GetByIdAsync(id, cancellationToken);
        return property is null ? NotFound() : Ok(property);
    }

    [Authorize]
    [HttpPut("update")]
    public async Task<IActionResult> Update([FromBody] PropertyUpdateRequest request, CancellationToken cancellationToken)
        => await propertyService.UpdateAsync(request.Id, request.Data, cancellationToken) ? Ok(new { message = "Updated" }) : NotFound();

    [Authorize]
    [HttpDelete("delete")]
    public async Task<IActionResult> Delete([FromQuery] Guid id, CancellationToken cancellationToken)
        => await propertyService.DeleteAsync(id, cancellationToken) ? Ok(new { message = "Deleted" }) : NotFound();
}
