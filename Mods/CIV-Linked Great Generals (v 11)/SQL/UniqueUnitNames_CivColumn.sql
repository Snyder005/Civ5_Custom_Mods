-- Insert SQL Rules Here 

ALTER TABLE Unit_UniqueNames ADD CivilizationType text REFERENCES Civilizations(Type) default null;