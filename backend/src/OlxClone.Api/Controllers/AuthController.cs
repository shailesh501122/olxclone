using Microsoft.AspNetCore.Mvc;
using OlxClone.Api.Contracts;

namespace OlxClone.Api.Controllers;

[ApiController]
[Route("api/auth")]
public class AuthController : ControllerBase
{
    [HttpPost("register")]
    public IActionResult Register() => Ok(new { message = "User registered" });

    [HttpPost("login")]
    public IActionResult Login() => Ok(new { accessToken = "jwt-token", refreshToken = "refresh-token", expiresIn = 900 });

    [HttpPost("refresh")]
    public IActionResult Refresh() => Ok(new { accessToken = "new-jwt-token" });

    [HttpPost("google")]
    public IActionResult GoogleLogin([FromBody] GoogleLoginRequest request) => Ok(new { accessToken = "google-jwt-token", provider = "Google", received = !string.IsNullOrWhiteSpace(request.IdToken) });

    [HttpPost("verify-otp")]
    public IActionResult VerifyOtp() => Ok(new { verified = true });

    [HttpPost("forgot-password")]
    public IActionResult ForgotPassword() => Ok(new { message = "Reset link sent" });
}
