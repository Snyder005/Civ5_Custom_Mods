INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_PORTUGAL_GALLEON'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_SPANISH_GALLEON');

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_PORTUGAL_GALLEON'), ('ART_DEF_UNIT_MEMBER_PORTUGAL_GALLEON'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_SPANISH_GALLEON');

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_PORTUGAL_GALLEON'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON');

INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_PORTUGAL_GALLEON'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON');

INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_PORTUGAL_GALLEON'), Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON');

	INSERT OR REPLACE INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
VALUES		('ART_DEF_UNIT_PORTUGAL_GALLEON', 	'Unit', 	'IconGalleonSV.dds');


--------------------------------	
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class,	 PrereqTech, RangedCombat, Range, Special, Combat, Cost, ObsoleteTech, GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 					  Civilopedia, 								Strategy, 		 									Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,						 PortraitIndex, 	IconAtlas,			 MoveRate)
SELECT	'UNIT_PORTUGAL_GALLEON',	Class,	  PrereqTech, RangedCombat, Range, Special, Combat, Cost, ObsoleteTech, GoodyHutUpgradeUnitClass, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_SPANISHGALLEON', 'TXT_KEY_UNIT_SPANISHGALLEON_TEXT',	'TXT_KEY_UNIT_SPANISHGALLEON_STRATEGY',  	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_MOD_GALLEON',	0,					'UNITS_GALLEON_FLAG_ATLAS',					  0, 				'ICON_SPANISHGALLEON',	 MoveRate
FROM Units WHERE Type = 'UNIT_FRIGATE';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PORTUGAL_GALLEON', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------		
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_PORTUGAL_GALLEON', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRIGATE';

--------------------------------	
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_PORTUGAL_GALLEON',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FRIGATE';	
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_PORTUGAL_GALLEON',	FlavorType, Flavor
FROM Unit_Flavors  WHERE UnitType = 'UNIT_FRIGATE';	
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_PORTUGAL_GALLEON', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------	
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_PORTUGAL_GALLEON', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRIGATE';	

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_PORTUGAL_GALLEON', 'PROMOTION_PGALLEON');

INSERT OR REPLACE INTO UnitPromotions 
			(Type, 						Description, 					Help, 									Sound, 			 	LostWithUpgrade, CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_PGALLEON',	'TXT_KEY_PROMOTION_PGALLEON',	'TXT_KEY_PROMOTION_PGALLEON_HELP',	'AS2D_IF_LEVELUP', 			0,				1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PGALLEON');

INSERT OR REPLACE INTO UnitPromotions_Terrains
		(PromotionType,		TerrainType,	Attack,		Defense)
VALUES	('PROMOTION_PGALLEON', 'TERRAIN_COAST', 20, 20);

--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_PORTUGAL',	'UNITCLASS_FRIGATE',	'UNIT_PORTUGAL_GALLEON');