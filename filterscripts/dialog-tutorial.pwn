#define FILTERSCRIPT
#include <a_samp>
#include <zcmd>

//DIALOG_STYLE_MSGBOX - /rules
//DIALOG_STYLE_LIST - /weapons
//DIALOG_STYLE_INPUT - /skin

#define RULES_DIALOG 1001
#define WEAPONS_DIALOG 1002
#define SKIN_DIALOG 1003

stock IsNumeric(const string[])//Credits: Mike
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if (string[i] > '9' || string[i] < '0') return 0;
	}
    return 1;
}

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == WEAPONS_DIALOG)
	{
	    if(response)
	    {
	        if(listitem == 0)//Deagle
	        {
			 	GivePlayerWeapon(playerid, 24, 9999);
	        }
	        else if(listitem == 1)//Combat Shotgun
	        {
			 	GivePlayerWeapon(playerid, 27, 9999);
	        }
	        else if(listitem == 2)//M4
	        {
			 	GivePlayerWeapon(playerid, 31, 9999);
	        }
	    }
	    return 1;
	}
	else if(dialogid == SKIN_DIALOG)
	{
	    if(response)
	    {
	        if(!IsNumeric(inputtext) || !strlen(inputtext)) return SendClientMessage(playerid, -1, "SERVER: The skin id must be a number.");
			if(strval(inputtext) < 0 || strval(inputtext) > 299 || strval(inputtext) == 74) return SendClientMessage(playerid, -1, "SERVER: Invalid skin id.");
			
			return SetPlayerSkin(playerid, strval(inputtext));
	    }
	}
	return 1;
}

CMD:rules(playerid, params[])
{
	ShowPlayerDialog(playerid, RULES_DIALOG, DIALOG_STYLE_MSGBOX, "{FFFFFF}Rules Dialog", "{FFFFFF}Rule #1: Do NOT hack or cheat!\nRule #2: Do NOT spam, flood or advertise!\nRule #3: Do NOT troll or inslult anybody!", "Close", "");
	return 1;
}

CMD:weapons(playerid, params[])
{
	ShowPlayerDialog(playerid, WEAPONS_DIALOG, DIALOG_STYLE_LIST, "{FFFFFF}Choose a Weapon", "{FFFFFF}Deagle\nCombat Shotgun\nM4", "Select", "Close");
	return 1;
}

CMD:skin(playerid, params[])
{
	ShowPlayerDialog(playerid, SKIN_DIALOG, DIALOG_STYLE_INPUT, "{FFFFFF}Change Skin", "{FFFFFF}Please enter a skin id below to change your skin:", "Enter", "Close");
	return 1;
}

