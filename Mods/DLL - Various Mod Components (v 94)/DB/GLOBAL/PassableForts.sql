ALTER TABLE Improvements
  ADD MakesPassable INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('GLOBAL_PASSABLE_FORTS', 1);

UPDATE Units SET MinAreaSize=3 WHERE Type='UNIT_CARGO_SHIP';
