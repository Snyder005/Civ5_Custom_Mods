ALTER TABLE UnitPromotions
  ADD AuraRangeChange INTEGER DEFAULT 0;
  
ALTER TABLE UnitPromotions
  ADD AuraEffectChange INTEGER DEFAULT 0;
  
INSERT OR REPLACE INTO Defines(Name, Value)
  VALUES('GREAT_GENERAL_MAX_RANGE', 2);

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('PROMOTIONS_AURA_CHANGE', 1);
