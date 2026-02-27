using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;

namespace OlxClone.Api.Hubs;

[Authorize]
public class ChatHub : Hub
{
    public async Task SendMessage(Guid chatId, string message)
    {
        await Clients.Group(chatId.ToString()).SendAsync("ReceiveMessage", Context.UserIdentifier, message, DateTime.UtcNow);
    }

    public async Task JoinChat(Guid chatId) => await Groups.AddToGroupAsync(Context.ConnectionId, chatId.ToString());
}
