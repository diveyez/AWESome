private _className = _this select 0;

orbis_cockpit_landingSpeed = orbis_awesome_kphToKnot * getNumber (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'landingSpeed');
orbis_cockpit_lastChecklist = orbis_cockpit_currentChecklist;
orbis_cockpit_currentChecklist = _className;
230 cutRsc [_className, "PLAIN"];