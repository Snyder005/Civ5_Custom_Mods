ALTER TABLE Improvements
  ADD NoFollowup INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('GLOBAL_NO_FOLLOWUP', 1);
