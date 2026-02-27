# Setup Instructions

## Prerequisites
- .NET SDK 8
- PostgreSQL 15+
- Flutter 3.24+
- Node.js 20+
- Docker (optional)

## Backend
```bash
cd backend
cp .env.example .env
cd src/OlxClone.Api
dotnet restore
dotnet ef database update --project ../OlxClone.Infrastructure --startup-project .
dotnet run
```

## Flutter App
```bash
cd flutter_app
flutter pub get
flutter run
```

## React Admin
```bash
cd react_admin
npm install
npm run dev
```

## Docker (Backend)
```bash
cd backend
docker build -t olxclone-api -f Dockerfile .
```


## Property Migration
Run `backend/src/OlxClone.Infrastructure/Persistence/Migrations/202609010002_AddProperties.sql` after initial migration to enable real-estate module schema.
