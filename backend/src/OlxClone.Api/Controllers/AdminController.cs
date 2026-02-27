using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/admin")]
[Authorize(Roles = "Admin")]
public class AdminController : ControllerBase
{
    [HttpGet("dashboard")]
    public IActionResult Dashboard() => Ok(new { users = 1200, listings = 5300, activeAds = 4200, propertyAds = 980, reports = 14, revenue = 134000, propertyBoostRevenue = 28000 });

    [HttpGet("users")]
    public IActionResult Users() => Ok(Array.Empty<object>());

    [HttpGet("reports")]
    public IActionResult Reports() => Ok(Array.Empty<object>());

    [HttpGet("payments")]
    public IActionResult Payments() => Ok(Array.Empty<object>());
}
