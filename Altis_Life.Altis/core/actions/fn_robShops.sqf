/*
file: fn_robShops.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint "Du kannst diese Tankstelle nicht überfallen." };

if(_robber distance _shop > 5) exitWith { hint "Bleib in der nähe!" };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "Die Tankstelle wird bereits überfallen!" };

if (vehicle player != _robber) exitWith { hint "Raus aus dem Fahrzeug!" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Unbewaffnet? Mach dich vom Acker!" };
if (_kassa == 0) exitWith { hint "Kein Geld." };

_rip = true;
_kassa = 4000 + round(random 6000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 50) then { hint "Der Kassierer hat den stummen Alarm betätigt, die Polizei ist unterwegs!"; [[1,format["ALARM! - Gasstation: %1 is being robbed!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };

_cops = (west countSide playableUnits);
//if(_cops < 2) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "There isnt enough Police to rob gas station!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Überfall im Gange, bleib in der Nähe(10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
[[_shop],"life_fnc_robStationSound",nil,true] spawn life_fnc_MP; 
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (%1%2)...",round(_cP * 120),"%"];
_Pos = position player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "!Achtung! Überfall !Achtung!";
				                "Marker200" setMarkerType "mil_warning";			
if(_cP >= 1.2) exitWith {_shop say3D "";};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint "Du hast dich zu weit entfernt, der Kassierer hat die Kasse verschlossen..."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Du hast $%1 erbeutet, Mach dich schnell aus dem Staub!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;
sleep 5;
titleText["Dein Verbrechen wird nicht ohne Konsequenzen bleiben...","PLAIN",0.5];
_rip = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
//WANTEDEntfernt[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

["Karma_Prof",100,0] call life_fnc_addKarma;
};
sleep 300;
_action = _shop addAction["Tankstellenüberfall",life_fnc_robShops];	
_shop switchMove "";