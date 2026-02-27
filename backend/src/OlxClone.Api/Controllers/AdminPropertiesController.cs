using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/admin/properties")]
[Authorize(Roles = "Admin")]
public class AdminPropertiesController : ControllerBase
{
    [HttpGet]
    public IActionResult GetAll([FromQuery] string? city = null) => Ok(new { cityFilter = city, items = Array.Empty<object>() });

    [HttpPatch("{id:guid}/approve")]
    public IActionResult Approve(Guid id) => Ok(new { id, status = "Approved" });

    [HttpPatch("{id:guid}/reject")]
    public IActionResult Reject(Guid id) => Ok(new { id, status = "Rejected" });

    [HttpPatch("{id:guid}/feature")]
    public IActionResult Feature(Guid id) => Ok(new { id, status = "Featured" });

    [HttpDelete("{id:guid}")]
    public IActionResult Delete(Guid id) => Ok(new { id, deleted = true });

    [HttpGet("reports")]
    public IActionResult Reports() => Ok(Array.Empty<object>());

    [HttpGet("revenue")]
    public IActionResult Revenue() => Ok(new { propertyBoostRevenue = 0 });
}
