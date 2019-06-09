#include "script_component.hpp"

params ["_unit", "_position", "_vehicle", "_turret"];

private _hasAction = _vehicle getVariable [QGVAR(hasAction), false];
if (_hasAction || !(_vehicle isKindOf "Plane")) exitWith {};

_vehicle addAction ["Turn off GPWS", QUOTE((_this select 0) setVariable [QGVAR(GPWSmode), off, true]), nil, 1.0111, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] != off)), 100];
_vehicle addAction ["Set to B747 GPWS", QUOTE((_this select 0) setVariable [QGVAR(GPWSmode), b747, true]), nil, 1.01121, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] != b747)), 100];
_vehicle addAction ["Set to Betty (F-16)", QUOTE((_this select 0) setVariable [QGVAR(GPWSmode), f16, true]), nil, 1.01122, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] != f16)), 100];
_vehicle addAction ["Set to Rita", QUOTE((_this select 0) setVariable [QGVAR(GPWSmode), rita, true]), nil, 1.01123, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] != rita)), 100];
_vehicle addAction ["Test GPWS (B747)", QUOTE([_this select 0] spawn FUNC(b747GPWStest)), nil, 1.01131, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] isEqualTo b747) && (_target getVariable [QGVAR(GPWStestReady), true])), 100];
_vehicle addAction ["Test GPWS (Betty)", QUOTE([_this select 0] spawn FUNC(f16GPWStest)), nil, 1.01132, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] isEqualTo f16) && (_target getVariable [QGVAR(GPWStestReady), true])), 100];
_vehicle addAction ["Test GPWS (Rita)", QUOTE([_this select 0] spawn FUNC(ritaGPWStest)), nil, 1.01133, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] isEqualTo rita) && (_target getVariable [QGVAR(GPWStestReady), true])), 100];
_vehicle addAction ["Stop GPWS Test", QUOTE((_this select 0) setVariable [QGVAR(GPWStestStop), true, true]), nil, 1.01134, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSmodeLocal), off] != off) && !(_target getVariable [QGVAR(GPWStestReady), true]) && !(_target getVariable [QGVAR(GPWStestStop), false])), 100];
_vehicle addAction ["Lower Volume", QUOTE((_this select 0) setVariable [QGVAR(GPWSvolumeLow), true, true]), nil, 1.01141, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && !(_target getVariable [QGVAR(GPWSvolumeLow), false])), 100];
_vehicle addAction ["Increase Volume", QUOTE((_this select 0) setVariable [QGVAR(GPWSvolumeLow), false, true]), nil, 1.01142, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(isGPWSenabled), false]) && (_target getVariable [QGVAR(GPWSvolumeLow), false])), 100];
// _vehicle addAction ["TCAS TA/RA", QUOTE((_this select 0) setVariable [QGVAR(tcasMode), 2, true]), nil, 1.0121, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(tcasMode), 0] != 2)), 100];
// _vehicle addAction ["TCAS TA", QUOTE((_this select 0) setVariable [QGVAR(tcasMode), 1, true]), nil, 1.0122, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(tcasMode), 0] != 1)), 100];
// _vehicle addAction ["TCAS Stand By", QUOTE((_this select 0) setVariable [QGVAR(tcasMode), 0, true]), nil, 1.0123, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(tcasMode), 0] != 0)), 100];
_vehicle addAction ["Transponder Mode C", QUOTE((_this select 0) setVariable [QGVAR(transponderMode), 2, true]), nil, 1.0131, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(transponderMode), 0] != 2)), 100];
_vehicle addAction ["Transponder Stand By", QUOTE((_this select 0) setVariable [QGVAR(transponderMode), 1, true]), nil, 1.0132, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(transponderMode), 0] != 1)), 100];
_vehicle addAction ["Transponder Off", QUOTE((_this select 0) setVariable [QGVAR(transponderMode), 0, true]), nil, 1.0133, false, true, "", QUOTE(([nil, _target, 1] call EFUNC(main,isCrew)) && (_target getVariable [QGVAR(transponderMode), 0] != 0)), 100];

_vehicle setVariable [QGVAR(hasAction), true, true];