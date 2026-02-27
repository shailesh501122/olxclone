# indiawish Monorepo

Production-oriented indiawish marketplace baseline with:
- Flutter marketplace + real-estate module
- .NET 8 Web API (clean architecture style)
- PostgreSQL migrations
- React admin dashboard (including property moderation)
- SignalR chat + JWT + Google login endpoint

## Modules
- `backend/`: API, services, migrations, SignalR
- `flutter_app/`: indiawish-style home, property list/detail/post form, chat/auth screens
- `react_admin/`: dashboard, users, listings, properties moderation, reports/payments
- `docs/`: setup, API endpoints, ERD

## Property Module Highlights
- Property posting form with pricing, media, location and description fields
- Property listing cards in two-column indiawish-style layout
- Property detail screen with carousel, spec grid, map preview, chat/call actions
- Property filters: budget, BHK, furnishing, type, posted-within, sort
- Admin controls: approve/reject/feature/delete, city filter, boost revenue visibility

See [`docs/SETUP.md`](docs/SETUP.md).
