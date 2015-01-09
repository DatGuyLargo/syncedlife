#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Karma H�ndler"];

_ret = [];
_karma = [] call life_fnc_getKarma;

if(_karma > 0) then
{

	switch (_filter) do
	{
		//Uniforms
		case 0:
		{
			
			if(_karma >= 500) then
			{
				_ret pushBack ["rds_uniform_worker1",nil,350];
				_ret pushBack ["rds_uniform_worker2",nil,350];
				_ret pushBack ["rds_uniform_worker3",nil,350];
				_ret pushBack ["rds_uniform_worker4",nil,350];
				
				if(_karma >= 1500) then
				{
				
				_ret pushBack ["U_C_Poor_1",nil,400];
				_ret pushBack ["U_C_WorkerCoveralls",nil,400];
					if(_karma >= 3000) then
					{
					_ret pushBack ["rds_uniform_Profiteer1",nil,1000];
					_ret pushBack ["rds_uniform_Profiteer2",nil,1000];
					_ret pushBack ["rds_uniform_Profiteer3",nil,1000];
					_ret pushBack ["rds_uniform_Profiteer4",nil,1000];
					};
				};
			};
			
		};
		
		//Hats
		case 1:
		{
			if(_karma >= 500) then
			{
				_ret pushBack ["rds_Profiteer_cap1","Cap",200];
				_ret pushBack ["rds_Profiteer_cap2","Cap",200];
				_ret pushBack ["rds_Profiteer_cap3","Cap",200];
				_ret pushBack ["rds_Profiteer_cap4","Cap",200];
				
				if(_karma >= 1500) then
				{
				_ret pushBack ["rds_Villager_cap1","M�tze",200];
				_ret pushBack ["rds_villager_cap2","M�tze",200];
				_ret pushBack ["rds_villager_cap3","M�tze",200];
				_ret pushBack ["rds_villager_cap4","M�tze",200];
				
					if(_karma >= 3000) then
					{
					
					};
				};
			};
		};
		
		//Glasses
		case 2:
		{
			if(_karma >= 500) then
			{
			
				
				if(_karma >= 1500) then
				{
				
				
					if(_karma >= 3000) then
					{
					_return pushBack ["NVGoggles_mas_h",nil,1000];
					};
				};
			};
		};
		
		//Vest
		case 3:
		{
			if(_karma <= 500) then
			{
				_ret pushBack ["kae_TK_Belt_ChestHolster",nil,500];
				
				
				if(_karma <= 1500) then
				{
					
				
					if(_karma <= 3000) then
					{
					
					};
				};
			};
		};
		
		//Backpacks
		case 4:
		{
			if(_karma <= 500) then
			{
				
				
				if(_karma <= 1500) then
				{
				
				
					if(_karma <= 3000) then
					{
					
					};
				};
			};
		};
	};





}
else
{

	switch (_filter) do
	{
		//Uniforms
		case 0:
		{
			
			if(_karma <= -500) then
			{
				_ret pushBack ["rds_uniform_woodlander1",nil,350];
				_ret pushBack ["rds_uniform_woodlander2",nil,350];
				_ret pushBack ["rds_uniform_woodlander3",nil,350];
				_ret pushBack ["rds_uniform_woodlander4",nil,350];
				
				if(_karma <= -1500) then
				{
				
				
				
				
				_ret pushBack ["U_BG_Guerrilla_6_1",nil,500];
				
					if(_karma <= -3000) then
					{
					
					
					
					};
				};
			};
			
		};
		
		//Hats
		case 1:
		{
			if(_karma <= -500) then
			{
				_ret pushBack ["H_Shemag_olive","Cap",200];
				
				
				if(_karma <= -1500) then
				{
				
				
					if(_karma <= -3000) then
					{
					_ret pushBack ["kio_skl_msk_grn","Sch�del Maske Gr�n",1500];
					_ret pushBack ["kio_skl_msk_red","Sch�del Maske Rot",1500];
					_ret pushBack ["kio_skl_msk","Sch�del Maske Wei�",1500];
					};
				};
			};
		};
		
		//Glasses
		case 2:
		{
			if(_karma <= -500) then
			{
			
				
				if(_karma <= -1500) then
				{
				
				
					if(_karma <= -3000) then
					{
					
					};
				};
			};
		};
		
		//Vest
		case 3:
		{
			if(_karma <= -500) then
			{
				_ret pushBack ["kae_TK_Belt_ChestHolster",nil,500];
				
				
				if(_karma <= -1500) then
				{
					_ret pushBack ["kae_TK_ChestRig_T",nil,1000];
				
					if(_karma <= -3000) then
					{
					
					};
				};
			};
		};
		
		//Backpacks
		case 4:
		{
			if(_karma <= -500) then
			{
				
				
				if(_karma <= -1500) then
				{
				
				
					if(_karma <= -3000) then
					{
					
					};
				};
			};
		};
	};





};

_ret;