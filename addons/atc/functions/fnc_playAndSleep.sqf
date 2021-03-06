#include "script_component.hpp"

params [["_vehicle", vehicle player], ["_sound", ""], ["_mode", 0]];

private _length = getNumber (configFile >> "CfgSounds" >> _sound >> "length");

if (_vehicle getVariable [QGVAR(stopATIS), false]) exitWith {};
if !([player, _vehicle, _mode] call EFUNC(main,isCrew)) exitWith {sleep _length};

[QEGVAR(main,playSoundVehicle), [_sound]] call CBA_fnc_localEvent;

sleep _length;
