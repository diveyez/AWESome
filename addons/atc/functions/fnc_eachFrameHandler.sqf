#include "script_component.hpp"

private _timeOld = missionNamespace getVariable [QGVAR(timeOld), -1];
private _frameOld = missionNamespace getVariable [QGVAR(frameOld), -1];

if (!(alive player) || (_timeOld < 0) || (_frameOld < 0)) exitWith {
	missionNamespace setVariable [QGVAR(timeOld), time];
	missionNamespace setVariable [QGVAR(frameOld), diag_frameNo];
};

private _planes = (entities "Plane") select {alive _x};
private _helies = (entities "Helicopter") select {alive _x};
private _SAMlaunchers = [];
{
	_planes pushBackUnique _x;
} forEach (missionNameSpace getVariable [QGVAR(additionalPlanes), []]);
{
	_helies pushBackUnique _x;
} forEach (missionNameSpace getVariable [QGVAR(additionalHelies), []]);
{
	_SAMlaunchers pushBackUnique _x;
} forEach (missionNameSpace getVariable [QGVAR(additionalSAMs), []]);

// add Eventhandlers
{
	_x setVariable [QGVAR(eventWeaponFire), _x addEventHandler ["Fired", {_this spawn FUNC(eventWeaponFire)}]];
} forEach ((_planes + _helies + _SAMlaunchers) select {_x getVariable [QGVAR(eventWeaponFire), -1] < 0});

// call radar functions
private _isUsingRadar = player getVariable [QGVAR(isUsingRadar), false];
private _radarParam = player getVariable [QGVAR(radarParam), []];

if (_isUsingRadar) then {
	_radarParam call FUNC(atcRadarLoop);
};

[] call FUNC(periodicCheck);

missionNamespace setVariable [QGVAR(timeOld), time];
missionNamespace setVariable [QGVAR(frameOld), diag_frameNo];
