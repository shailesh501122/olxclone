using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/payments")]
[Authorize]
public class PaymentsController : ControllerBase
{
    [HttpPost("create-order")]
    public IActionResult CreateOrder() => Ok(new { provider = "Razorpay", orderId = Guid.NewGuid() });

    [HttpPost("verify")]
    public IActionResult Verify() => Ok(new { verified = true });
}
