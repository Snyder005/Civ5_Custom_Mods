ALTER TABLE Units
  ADD SendCanMoveIntoEvent INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('EVENTS_CAN_MOVE_INTO', 1);
