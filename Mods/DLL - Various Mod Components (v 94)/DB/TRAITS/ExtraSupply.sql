ALTER TABLE Traits
  ADD ExtraSupply INTEGER DEFAULT 0;

ALTER TABLE Traits
  ADD ExtraSupplyPerCity INTEGER DEFAULT 0;

ALTER TABLE Traits
  ADD ExtraSupplyPerPopulation INTEGER DEFAULT 0;

INSERT INTO CustomModDbUpdates(Name, Value) VALUES('TRAITS_EXTRA_SUPPLY', 1);
