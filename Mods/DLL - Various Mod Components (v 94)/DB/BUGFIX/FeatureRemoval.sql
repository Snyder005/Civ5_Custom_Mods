ALTER TABLE BuildFeatures
  ADD ObsoleteTech TEXT DEFAULT NULL REFERENCES Technologies(Type);
ALTER TABLE BuildFeatures
  ADD RemoveOnly INTEGER DEFAULT 0;
  
UPDATE BuildFeatures
  SET RemoveOnly=1
  WHERE BuildType
    IN ('BUILD_REMOVE_JUNGLE', 'BUILD_REMOVE_FOREST',
        'BUILD_REMOVE_MARSH', 'BUILD_SCRUB_FALLOUT');
		
INSERT INTO CustomModDbUpdates(Name, Value) VALUES('BUGFIX_FEATURE_REMOVAL', 1);
