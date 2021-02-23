/*
ADV_aceCPR_fnc_canCPR - by Belbo

Determines if CPR is 
*/


params [
	["_target", objNull, [objNull]]
];

private _inRevive = _target call adv_aceCPR_fnc_inReviveState;
private _inCardiac = _target getVariable ["ace_medical_inCardiacArrest",false];

//rewritten to make the use cases easily distinguishable
//Dead (kept to keep same functionality as old code. was this intentional?)
if (!alive _target) exitWith { true };

//Alive and unconscious but not in cardiac (no cardiac reference as the states are mutually exclusive)
if (alive _target && _inRevive) exitWith { true };

//In cardiac 
if (_inCardiac) exitWith {
	private _startTime = _target getVariable ["adv_aceCPR_cardiacArrestStart", CBA_missionTime];
	private _cprMaxTime = missionNamespace getVariable ["adv_aceCPR_maxTime", 900];

	CBA_missionTime < _startTime + _cprMaxTime;
};

// if awake
false
//end rewrite

