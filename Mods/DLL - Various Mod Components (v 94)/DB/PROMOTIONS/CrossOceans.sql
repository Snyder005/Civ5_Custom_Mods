ALTER TABLE UnitPromotions
  ADD CanCrossOceans INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('PROMOTIONS_CROSS_OCEANS', 1);
