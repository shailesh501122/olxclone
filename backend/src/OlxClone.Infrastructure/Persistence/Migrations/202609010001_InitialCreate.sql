CREATE TABLE "Users" (
  "Id" uuid PRIMARY KEY,
  "Name" text NOT NULL,
  "Email" text NOT NULL UNIQUE,
  "PasswordHash" text NOT NULL,
  "Role" text NOT NULL,
  "IsBlocked" boolean NOT NULL DEFAULT false,
  "IsVerifiedSeller" boolean NOT NULL DEFAULT false,
  "Status" text NOT NULL,
  "CreatedAt" timestamptz NOT NULL,
  "UpdatedAt" timestamptz NOT NULL,
  "IsDeleted" boolean NOT NULL DEFAULT false
);

CREATE TABLE "Categories" (
  "Id" uuid PRIMARY KEY,
  "Name" text NOT NULL,
  "Icon" text NOT NULL,
  "Status" text NOT NULL,
  "CreatedAt" timestamptz NOT NULL,
  "UpdatedAt" timestamptz NOT NULL,
  "IsDeleted" boolean NOT NULL DEFAULT false
);

CREATE TABLE "Listings" (
  "Id" uuid PRIMARY KEY,
  "UserId" uuid NOT NULL REFERENCES "Users"("Id"),
  "CategoryId" uuid NOT NULL REFERENCES "Categories"("Id"),
  "Title" text NOT NULL,
  "Description" text NOT NULL,
  "Price" numeric(12,2) NOT NULL,
  "Location" text NOT NULL,
  "IsFeatured" boolean NOT NULL DEFAULT false,
  "Status" text NOT NULL,
  "CreatedAt" timestamptz NOT NULL,
  "UpdatedAt" timestamptz NOT NULL,
  "IsDeleted" boolean NOT NULL DEFAULT false
);

CREATE INDEX "IX_Listings_CategoryId_Location" ON "Listings"("CategoryId", "Location");
