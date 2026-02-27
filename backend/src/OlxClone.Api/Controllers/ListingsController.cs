using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/listings")]
public class ListingsController : ControllerBase
{
    [HttpGet]
    public IActionResult GetAll() => Ok(Array.Empty<object>());

    [HttpGet("{id:guid}")]
    public IActionResult GetById(Guid id) => Ok(new { id });

    [Authorize]
    [HttpPost]
    public IActionResult Create() => Ok(new { message = "Listing created" });

    [Authorize]
    [HttpPut("{id:guid}")]
    public IActionResult Update(Guid id) => Ok(new { id, message = "Listing updated" });

    [Authorize]
    [HttpDelete("{id:guid}")]
    public IActionResult Delete(Guid id) => Ok(new { id, deleted = true });
}
