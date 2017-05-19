/*
	fn_getTimerStr.sqf

	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/
private["_request","_time","_hours","_minutes","_img","_text", "_rightTime"];

_request = [];
_rightTime = (((correcto select 0) - startHour) - startMinute/60) * 60;
_time = (round(_rightTime-(serverTime)/60));

_hours = (floor(_time/60));
_minutes = (_time - (_hours * 60));

_img = [ExAd_SB_ICON_TIMER] call ExAd_fnc_formatSBImage;
_text = format["%1:%2", _hours,(if(_minutes < 10 )then{format["0%1",_minutes]}else{_minutes})];
_request pushBack [_img,_text];

if(ExAd_SB_COMPONENTS_ACTIVE_COLORS)then{
	if(_hours > 0)then{
		_request pushBack ([0,1,_hours] call ExAd_fnc_getSBColor)
	}else{
		_request pushBack ([0,60,_minutes] call ExAd_fnc_getSBColor)
	};
};

_request call ExAd_fnc_formatSBOutput
