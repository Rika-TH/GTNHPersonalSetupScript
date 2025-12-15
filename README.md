# A personal script for setting up our GTNH server and player instances
**This script has external dependencies on two other github repos and modrinth for extra addon mods these are:**

(Github)\
[SharedProspecting](https://github.com/Lyfts/SharedProspecting/), shares ore prospecting data between all players of a team\
[DEConfig-Integration](https://github.com/Drathonix/DEConfig-Integration/), adds keybinding and integrations into the Draconic Evolution config menu allowing potentially more tidy key binds and configurability

(Modrinth)\
[Journeymap unlimited](https://modrinth.com/mod/journeymap/versions?g=1.7.10), unrestricted JM version\
[FpsReducer](https://modrinth.com/mod/fps-reducer/versions?g=1.7.10), save power (and reduce heat) if AFK

## Full change list

Wherever needed, removes defaultserverlist, defaultworldgenerator, journeymap fairplay, and journeymap server\
Adds journeymap unlimited, FPS Reducer, Shared Prospecting, and DEConfig menu\
Sets EULA\
Turns off spawn protection\
Turns off blood moons\
Disables the corner tank overlay from adventure backpacks\
Sets quest book to enable lock tray, view mode, and changes theme to midnight\
Imports (the uploaded here) altered FPS reducer config, and IGIXML (changing some AFK settings, disabling the fps counter that's always active by default??? and our custom IGI with two addons (both surrounded with new lines for anyone else who may want to yoink))\
Changes NEI keybinds to our used (Colemak) keybinds\
Disables itemzoom from NEI\
Sets up chunk claiming, loading, the required ranks feature for these, and adds offline chunkloading perm to admin rank

Also disables laying eggs and coins from warp ::3

## Extra migration info (pmuch just self notes)

For server migration (for personal/friends use) the only real things we've seen that should probably be copied are:\
The /World/ (or whatever you called it directory) naturally\
Whitelist.json (if you don't want to rewhitelist yourself)\
ops.json (if you don't want to reop yourself)\
/visualprospecting/ (iirc this is needed atleast??? iirc this will make ore veins the same if you were to for example restore a backup with removing generated chunks or similar? it's been a while)

and for client\
/saves/NEI/ (actual saves are optional based on how you use SP)\
/visualprospecting/\
/schematics/, /resourcepacks/, /shaderpacks/, /config/shaders.properties, and /screenshots/ are all up to your own usage / preference of copying these\
localconfig.cfg (should assuming copied in before first boot from what we recall in testing setup *most* config stuff, only client side changes from what we recall so can't do everything sadly?)\
BotaniaVars.dat (mostly optional tbh)\
options.txt (main settings, keybinds etc)\
optionsnf.txt (notfine advanced graphics settings)\
servers.dat (assumedly this is just your saved servers so not that important honestly)

Regardless more details along with very useful information on changes you may want to make can always be found [here on the official wiki!](https://wiki.gtnewhorizons.com/wiki/Installing_and_Migrating#Method_#2:_Migrating)\
(screenshot of some of the extras from it)<img width="1028" height="310" alt="image" src="https://github.com/user-attachments/assets/18ab3f7f-4346-496e-84d5-d79471b399e2" />






this uh might need changing or updating, I'm not 100% and ofc things *do* change over time\
just wanted to upload our script and add our own big set of notes to it etc to remember it as we usually (somehow) struggle with the wiki page, think the localconfig.cfg used to not even be on the wiki? don't recall exactly how it worked either as iirc we manually tested it, oh well
