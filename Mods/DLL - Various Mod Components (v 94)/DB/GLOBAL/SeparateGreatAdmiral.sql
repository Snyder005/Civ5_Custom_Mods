ALTER TABLE Units
  ADD CanRepairFleet INTEGER DEFAULT 0;
ALTER TABLE Units
  ADD CanChangePort INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('GLOBAL_SEPARATE_GREAT_ADMIRAL', 1);
