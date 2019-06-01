params ["_unit", "_position", "_vehicle", "_turret"];

private _hasAction = _vehicle getVariable ["orbis_gpws_hasAction", false];
if (_hasAction || !(_vehicle isKindOf "Plane")) exitWith {};

_vehicle addAction ["TCAS Mode C", "(_this select 0) setVariable ['orbisTCASmode', 2, true]", nil, 1.0121, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbisTCASmode', 0] != 2)", 100];
_vehicle addAction ["TCAS Stand By", "(_this select 0) setVariable ['orbisTCASmode', 1, true]", nil, 1.0122, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbisTCASmode', 0] != 1)", 100];
_vehicle addAction ["TCAS Off", "(_this select 0) setVariable ['orbisTCASmode', 0, true]", nil, 1.0123, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbisTCASmode', 0] != 0)", 100];
_vehicle addAction ["Turn off GPWS", "(_this select 0) setVariable ['orbis_gpws_GPWSmode', 'off', true]", nil, 1.0111, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'off')", 100];
_vehicle addAction ["Set to B747 GPWS", "(_this select 0) setVariable ['orbis_gpws_GPWSmode', 'b747', true]", nil, 1.01121, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'b747')", 100];
_vehicle addAction ["Set to Betty (F-16)", "(_this select 0) setVariable ['orbis_gpws_GPWSmode', 'f16', true]", nil, 1.01122, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'f16')", 100];
_vehicle addAction ["Set to Rita", "(_this select 0) setVariable ['orbis_gpws_GPWSmode', 'rita', true]", nil, 1.01123, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'rita')", 100];
_vehicle addAction ["Test GPWS (B747)", "[_this select 0] spawn orbis_gpws_fnc_b747GPWStest", nil, 1.01131, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'b747') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction ["Test GPWS (Betty)", "[_this select 0] spawn orbis_gpws_fnc_f16GPWStest", nil, 1.01132, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'f16') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction ["Test GPWS (Rita)", "[_this select 0] spawn orbis_gpws_fnc_ritaGPWStest", nil, 1.01133, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] isEqualTo 'rita') && (_target getVariable ['orbis_gpws_GPWStestReady', true])", 100];
_vehicle addAction ["Stop GPWS Test", "(_this select 0) setVariable ['orbis_gpws_GPWStestStop', true, true]", nil, 1.01134, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSmodeLocal', 'off'] != 'off') && !(_target getVariable ['orbis_gpws_GPWStestReady', true]) && !(_target getVariable ['orbis_gpws_GPWStestStop', false])", 100];
_vehicle addAction ["Lower Volume", "(_this select 0) setVariable ['orbis_gpws_GPWSvolumeLow', true, true]", nil, 1.01141, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && !(_target getVariable ['orbis_gpws_GPWSvolumeLow', false])", 100];
_vehicle addAction ["Increase Volume", "(_this select 0) setVariable ['orbis_gpws_GPWSvolumeLow', false, true]", nil, 1.01142, false, true, "", "([nil, _target, 1] call orbis_awesome_fnc_isCrew) && (_target getVariable ['orbis_gpws_GPWSenabled', false]) && (_target getVariable ['orbis_gpws_GPWSvolumeLow', false])", 100];
_vehicle setVariable ["orbis_gpws_hasAction", true, true];
