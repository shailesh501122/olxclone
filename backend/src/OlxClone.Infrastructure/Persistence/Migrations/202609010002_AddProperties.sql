CREATE TABLE "Properties" (
  "Id" uuid PRIMARY KEY,
  "ListingId" uuid NOT NULL REFERENCES "Listings"("Id"),
  "ListingType" text NOT NULL,
  "PropertyType" text NOT NULL,
  "BHK" integer NOT NULL,
  "Bathrooms" integer NOT NULL,
  "Furnishing" text NOT NULL,
  "BuiltUpArea" numeric(10,2) NOT NULL,
  "CarpetArea" numeric(10,2) NOT NULL,
  "TotalFloors" integer NOT NULL,
  "FloorNumber" integer NOT NULL,
  "Parking" boolean NOT NULL,
  "Facing" text NOT NULL,
  "PropertyAge" integer NOT NULL,
  "Price" numeric(12,2),
  "RentAmount" numeric(12,2),
  "DepositAmount" numeric(12,2),
  "MaintenanceCharges" numeric(12,2),
  "IsNegotiable" boolean NOT NULL DEFAULT false,
  "City" text NOT NULL,
  "Status" text NOT NULL,
  "CreatedAt" timestamptz NOT NULL,
  "UpdatedAt" timestamptz NOT NULL,
  "IsDeleted" boolean NOT NULL DEFAULT false
);

CREATE INDEX "IX_Properties_ListingType" ON "Properties"("ListingType");
CREATE INDEX "IX_Properties_City" ON "Properties"("City");
CREATE INDEX "IX_Properties_Price" ON "Properties"("Price");
CREATE INDEX "IX_Properties_BHK" ON "Properties"("BHK");
