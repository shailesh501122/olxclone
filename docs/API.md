# API Endpoint Documentation

## Auth
- `POST /api/auth/register`
- `POST /api/auth/login`
- `POST /api/auth/refresh`
- `POST /api/auth/forgot-password`
- `POST /api/auth/verify-otp`
- `POST /api/auth/google` (Google login with `idToken`)

## Listings
- `GET /api/listings`
- `GET /api/listings/{id}`
- `POST /api/listings`
- `PUT /api/listings/{id}`
- `DELETE /api/listings/{id}`

## Property Module
- `POST /api/property/create`
- `GET /api/property/list`
- `GET /api/property/{id}`
- `PUT /api/property/update`
- `DELETE /api/property/delete?id={id}`

### Property list filters (query)
- `minPrice`
- `maxPrice`
- `bhk`
- `propertyType`
- `city`
- `listingType` (`Sale` / `Rent`)
- `furnishing`
- `parking`
- `page`
- `pageSize`
- `sortBy` (`PriceLowToHigh`, `PriceHighToLow`, `MostRecent`)

## Chat + SignalR
- `GET /api/chats`
- `GET /api/chats/{chatId}/messages`
- `POST /api/chats/{chatId}/messages`
- SignalR Hub: `/hubs/chat`

## Admin
- `GET /api/admin/dashboard`
- `GET /api/admin/users`
- `GET /api/admin/reports`
- `GET /api/admin/payments`
- `GET /api/admin/properties?city={city}`
- `PATCH /api/admin/properties/{id}/approve`
- `PATCH /api/admin/properties/{id}/reject`
- `PATCH /api/admin/properties/{id}/feature`
- `DELETE /api/admin/properties/{id}`
- `GET /api/admin/properties/reports`
- `GET /api/admin/properties/revenue`

## Payments (Featured/Urgent/Boost/Top Search)
- `POST /api/payments/create-order`
- `POST /api/payments/verify`
