ALTER TABLE UnitPromotions
  ADD CanCrossMountains INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('PROMOTIONS_CROSS_MOUNTAINS', 1);
