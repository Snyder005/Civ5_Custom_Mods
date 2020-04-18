ALTER TABLE Traits
  ADD ObsoleteBelief TEXT DEFAULT NULL REFERENCES Beliefs(Type);

ALTER TABLE Traits
  ADD PrereqBelief TEXT DEFAULT NULL REFERENCES Beliefs(Type);

ALTER TABLE Traits
  ADD ObsoletePolicy TEXT DEFAULT NULL REFERENCES Policies(Type);

ALTER TABLE Traits
  ADD PrereqPolicy TEXT DEFAULT NULL REFERENCES Policies(Type);

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('TRAITS_OTHER_PREREQS', 1);
