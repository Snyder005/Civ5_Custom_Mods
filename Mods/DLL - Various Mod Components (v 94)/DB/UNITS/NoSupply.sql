ALTER TABLE Units
  ADD NoSupply INTEGER DEFAULT 0;
  
ALTER TABLE UnitPromotions
  ADD NoSupply INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('UNITS_NO_SUPPLY', 1);
