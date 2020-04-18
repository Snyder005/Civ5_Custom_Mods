-- Insert SQL Rules Here 

DELETE FROM Unit_UniqueNames WHERE CivilizationType NOT IN (SELECT Type FROM Civilizations);
