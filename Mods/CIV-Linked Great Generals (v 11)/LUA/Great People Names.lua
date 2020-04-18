-- Great People Names
-- Author: lshipp (LeeS)
-- DateCreated: 6/21/2014 11:25:53 AM
-- Last Update: 7/24/2014 9:43 PM
-- Links Great People names to an appropriate civilization
-- Uses names for inactive civilizations as a fallback list that all civs can use as needed
-- Where an active Civ in a game has no Great People Names assigned to it, the Civ uses the fallback lists

--------------------------------------------------------------------------------------------------------------------------------------------------
--include commands for other lua files that are required
--------------------------------------------------------------------------------------------------------------------------------------------------

include("TableSaverLoader016.lua")

--------------------------------------------------------------------------------------------------------------------------------------------------
-- ADAPTATION COMMANDS FOR USE IN OTHER MODS
-- TABLE to specifiy the Great People types to be used is "tValidGreatPeopleUnitTypes"
-- VARIABLE to assign table save/load to a specific mod is "TempTableName"
-- NO OTHER changes in this lua file are required and should not generally be made.

-- add or remove units in the tValidGreatPeopleUnitTypes table to alter which Great People the main function executes for
-- only unit designations for Great People can be included in this table
-- currently UNIT_ARTIST , UNIT_WRITER , and UNIT_MUSICIAN don't work properly because of issues with bringing-along the correct great work
--    with the unique unit name
-- All other great people work with this system: UNIT_GREAT_GENERAL, UNIT_GREAT_ADMIRAL, UNIT_MERCHANT, UNIT_ENGINEER, UNIT_SCIENTIST, and UNIT_PROPHET

-- VARIABLE TO ASSIGN TABLE SAVE/LOAD TO A SPECIFIC MOD IS TempTableName
-- you need to change from "GGMUGA2" to something unique for your mod
--------------------------------------------------------------------------------------------------------------------------------------------------

tValidGreatPeopleUnitTypes = {"UNIT_GREAT_GENERAL", "UNIT_GREAT_ADMIRAL"}

TempTableName = "GGMUGA2"

--------------------------------------------------------------------------------------------------------------------------------------------------
--flag variables for processing control. DO NOT CHANGE. GENERALLY, NO CHANGES SHOULD BE MADE BELOW THIS COMMENT LINE.
--------------------------------------------------------------------------------------------------------------------------------------------------

gLoadFromSave = 0	--do not change from 0

ValidUnitIDsTable = {}
for k,v in pairs(tValidGreatPeopleUnitTypes) do
	ValidUnitIDsTable[GameInfoTypes[v]] = v
end

--------------------------------------------------------------------------------------------------------------------------------------------------
--print messages to the lua log when the lua loads properly. DO NOT CHANGE
--------------------------------------------------------------------------------------------------------------------------------------------------

print("The Civilization Appropriate Great People lua loaded properly for " .. TempTableName .. " data")

-----------------------------------------------------------------------------------------------------------------------------------------------------
--set up the table saver loader master table tree. DO NOT CHANGE.
-----------------------------------------------------------------------------------------------------------------------------------------------------

gGreatPeopleMasterTable = { ActiveCivPlayers = {}, ActiveUnitTypes = {} }

-----------------------------------------------------------------------------------------------------------------------------------------------------
--table saver/loader saving functions. DO NOT CHNAGE
-----------------------------------------------------------------------------------------------------------------------------------------------------

tableRoot = gGreatPeopleMasterTable
tableName = TempTableName

include("LRS_GreatPeople_TSL_Addon.lua")

-------------------------------------------------------------------------------------------------
--TableSaverLoader Hookups
-------------------------------------------------------------------------------------------------

function OnModLoaded() --called from end of last mod file to load
	local bNewGame = not TableLoad(tableRoot, tableName)
	if bNewGame then
		print("New Game")
		else print("Loaded from Saved Game")
		gLoadFromSave = 1	--LRS added this line
	end
	TableSave(tableRoot, tableName)
end


-----------------------------------------------------------------------------------------------------
--fills in the table gActiveCivPlayerNames with all the active player civilization names. DO NOT CHANGE
-----------------------------------------------------------------------------------------------------

function MajorPlayersListLRS()
	if gLoadFromSave == 1 then
		print("Active Civs Table Was loaded from saved game")
	end
	if gLoadFromSave == 0 then
		print("Active Civs Table Was created for a new game")
		for i = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local iSlot = PreGame.GetSlotStatus(i)
			if iSlot == SlotStatus.SS_TAKEN or iSlot == SlotStatus.SS_COMPUTER then
				if not Players[i]:IsMinorCiv() and not Players[i]:IsBarbarian() then
					gGreatPeopleMasterTable.ActiveCivPlayers[i] = GameInfo.Civilizations[Players[i]:GetCivilizationType()].Type
				else
					if not Players[i]:IsBarbarian() then
						gGreatPeopleMasterTable.ActiveCivPlayers[i] = GameInfo.MinorCivilizations[Players[i]:GetMinorCivType()].Type
					end
				end
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------
--fills in the tables for all the 'fall-back' great people names. DO NOT CHANGE
-----------------------------------------------------------------------------------------------------

function FallBackTablesInitializeLRS()
	if gLoadFromSave == 1 then
		print("Fallback Tables Were loaded from saved game")
	end
	if gLoadFromSave == 0 then
		print("Creating Fallback Tables -- Stand By")
		for row in GameInfo.Unit_UniqueNames() do
			local UnitTypeDescription = row.UnitType
			local iUnitIdNumber = GameInfoTypes[row.UnitType]
			if ValidUnitIDsTable[iUnitIdNumber] then
				if not gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber] then
					gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber] = { Fallback = {}, Generic = {} }
				end
				local sCivilizationType = row.CivilizationType
				local sUniqueName = row.UniqueName
				if ((sCivilizationType == "null") or (sCivilizationType == "NULL") or (sCivilizationType == nil) or (sCivilizationType == -1)) then
					table.insert(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber]["Generic"], sUniqueName)
				else
					local bNameIsFallback, tMatches = true, {}
					for k,v in pairs(gGreatPeopleMasterTable.ActiveCivPlayers) do
						if v == sCivilizationType then
							bNameIsFallback = false
							tMatches[k] = true
						end
					end
					if bNameIsFallback then
						table.insert(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber]["Fallback"], sUniqueName)
					else
						for iPlayer,Boolean in pairs(tMatches) do
							if not gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber][iPlayer] then
								gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber][iPlayer] = {sUniqueName}
							else
								table.insert(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitIdNumber][iPlayer], sUniqueName)
							end
						end
					end
				end
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------
--Function To Select a Civ-Linked Great Person Name. DO NOT CHANGE
-----------------------------------------------------------------------------------------------------

function GetTableKeyNumber(tTable, playerID)
	if tTable[playerID] then
		local iLength = #tTable[playerID]
		if iLength > 1 then
			return (math.random(iLength)), "ID"
		elseif iLength > 0 then
			return 1, "ID"
		end
	end
	local iLength = #tTable["Generic"]
	if iLength > 1 then
		return (math.random(iLength)), "Generic"
	elseif iLength > 0 then
		return 1, "Generic"
	end
	local iLength = #tTable["Fallback"]
	if iLength > 1 then
		return (math.random(iLength)), "Fallback"
	elseif iLength > 0 then
		return 1, "Fallback"
	end
	return -1, "NONE"
end

function GreatPeopleNames(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if((pPlayer == nil) or pPlayer:IsBarbarian() or
		(pUnit == nil) or
		pUnit:IsDead()) then
		return
	end
	local iUnitType = pUnit:GetUnitType()
	if ValidUnitIDsTable[iUnitType] then
		local sUnitName = "NONE"
		local iUnitKeyNumber, sMethod = GetTableKeyNumber(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType], playerID)
		if sMethod ~= "NONE" then
			if sMethod == "ID" then
				sUnitName = gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType][playerID][iUnitKeyNumber]
				table.remove(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType][playerID], iUnitKeyNumber)
			elseif sMethod == "Generic" then
				sUnitName = gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType]["Generic"][iUnitKeyNumber]
				table.remove(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType]["Generic"], iUnitKeyNumber)
			else
				sUnitName = gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType]["Fallback"][iUnitKeyNumber]
				table.remove(gGreatPeopleMasterTable.ActiveUnitTypes[iUnitType]["Fallback"], iUnitKeyNumber)
			end
			--print("Name was pulled from the " .. sMethod .. " List, key number " .. iUnitKeyNumber .. ": " .. sUnitName)
			pUnit:SetName(sUnitName)
			Events.UnitNameChanged( pUnit:GetOwner(), pUnit:GetID() );
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------
--game initialization and table saver/loader loading functions. DO NOT CHANGE
-----------------------------------------------------------------------------------------------------------------------------------------------------

--borrowed and adapted from Darkscythe
function GreatPeopleGameInit()
	MajorPlayersListLRS()
	FallBackTablesInitializeLRS()
	LuaEvents.SerialEventUnitCreatedGood.Add(GreatPeopleNames);
end
Events.LoadScreenClose.Add(GreatPeopleGameInit)

-----------------------------------------------------------------------------------------------------
--TableSaverLoader needed command. DO NOT CHANGE
-----------------------------------------------------------------------------------------------------

OnModLoaded()

-----------------------------------------------------------------------------------------------------
--End of File Print Confirmation
-----------------------------------------------------------------------------------------------------

print("Great People Names loaded to the end")




