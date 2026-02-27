# API Endpoint Documentation

## Auth
- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `POST /api/auth/forgot-password`
- `POST /api/auth/verify-otp`
- `POST /api/auth/google`

## Listings
- `GET /api/listings`
- `GET /api/listings/{id}`
- `POST /api/listings`
- `PUT /api/listings/{id}`
- `DELETE /api/listings/{id}`
- `PATCH /api/listings/{id}/feature`
- `PATCH /api/listings/{id}/approve`

## Categories
- `GET /api/categories`

## Favorites
- `GET /api/favorites`
- `POST /api/favorites/{listingId}`
- `DELETE /api/favorites/{listingId}`

## Chat + SignalR
- `GET /api/chats`
- `GET /api/chats/{chatId}/messages`
- `POST /api/chats/{chatId}/messages`
- SignalR Hub: `/hubs/chat`

## Admin
- `GET /api/admin/dashboard`
- `GET /api/admin/users`
- `PATCH /api/admin/users/{id}/block`
- `PATCH /api/admin/users/{id}/verify`
- `GET /api/admin/reports`
- `GET /api/admin/payments`

## Payments
- `POST /api/payments/create-order`
- `POST /api/payments/verify`
