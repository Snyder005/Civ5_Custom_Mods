ALTER TABLE UnitPromotions
  ADD CanCrossIce INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('PROMOTIONS_CROSS_ICE', 1);
