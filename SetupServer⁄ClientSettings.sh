#!/bin/bash

#moving into mods dir as bunch of mods setup incoming
cd mods

#adding new mods (checks if server.properties DOESN'T exist (blame old jank being repurposed))
if [[ ! -e ../server.properties ]]; then
    rm defaultserverlist* defaultworldgenerator* journeymap*fairplay*
    # JM unlimited (28/06/25)
    wget https://cdn.modrinth.com/data/lfHFW1mp/versions/MO9cf9Ur/journeymap-1.7.10-5.2.10-unlimited.jar
    # FpsReducer (09/06/23)
    wget https://cdn.modrinth.com/data/iZ10HXDj/versions/KkQ36LBj/FpsReducer-mc1.7.10-1.10.3.jar
else
    rm JourneyMapServer*
    sed -i 's/eula=false/eula=true/' ../eula.txt
    sed -i 's/spawn-protection=1/spawn-protection=0' ../server.properties
fi
sed -i 's/BloodMoonChance=0.01/BloodMoonChance=0' ./config/RandomThings.cfg
# Shared Prospecting (10/05/25)
wget https://github.com/Lyfts/SharedProspecting/releases/download/2.0.3/sharedprospecting-2.0.3.jar
# DEconfig menu (23/04/24)
wget https://github.com/Drathonix/DEConfig-Integration/releases/download/1.0.1/deconfigintegration-1.0.1.jar


#configs
#tiny bit of cleanup x3
cd ../config
rm defaultserverlist.json defaultworldgenerator.cfg

#actual config changes >w<
#disables the corner tank overlay
sed -i '/tanks {/,+2s/B:"Enable Overlay"=true/B:"Enable Overlay"=false/' adventurebackpack.cfg
#sed -i does an inplace replacement, s/ is substitute

#set the book settings to normal and set theme
sed -i 's/B:"Lock tray"=false/B:"Lock tray"=true/;s/B:"View mode"=false/B:"View mode"=true/;s/S:Theme=betterquesting:light/S:Theme=midnight:dark/' betterquesting.cfg

#disable egg and coin warp effect :skull:
sed -i 's/B:allowCoinEffect=true/B:allowCoinEffect=false/;s/B:allowLayEggsEffect=true/B:allowLayEggsEffect=false/' WarpTheory.cfg
if [[ ! -e ../server.properties ]]; then
#import FpsReducer settings and our IGIxml (could upload these to github actually :asthink:)
mkdir FpsReducer
wget -O FpsReducer/FpsReducer.cfg https://raw.githubusercontent.com/Rika-TH/GTNHPersonalSetupScript/refs/heads/main/FpsReducer.cfg
wget -O InGameInfoXML/InGameInfo.xml https://raw.githubusercontent.com/Rika-TH/GTNHPersonalSetupScript/refs/heads/main/InGameInfo.xml
fi

#time to lmao all over NEI x3
#change keybinds
sed -i 's/showenchant=23/showenchant=0/;s/hide=24/hide=0/;s/hide_bookmarks=48/hide_bookmarks=0/;s/recipe=19/recipe=25/;s/search=33/search=0/;s/usage=22/usage=38/;s/xu_ping=20/xu_ping=34/;s/find_block=21/find_block=36/' NEI/client.cfg

#disable itemzoom
sed -i '/itemzoom/,+2s/enabled=true/enabled=false/' NEI/client.cfg
#WOO we learnt it, it matches "itemzoom" then for the next two lines(???) it will try the next parts!
#!!! so ,is range so ,+2 means it adds 2 lines to its range which was just a match for "itemzoom"!!!


cd ../serverutilities
#time for some serverutils setup (client notification stuff seems to be missing from latest? so idk bout that)
sed -i 's/B:delete_custom_name_backups=true/B:delete_custom_name_backups=false/;s/B:nick=false/B:nick=true/;s/B:chunk_claiming=false/B:chunk_claiming=true/;s/S:enable_explosions=TRUE/S:enable_explosions=DEFAULT/;s/B:only_backup_claimed_chunks=false/B:only_backup_claimed_chunks=true/' serverutilities.cfg

#and enabling ranks =w=
sed -i '/Enables Ranks/,+1s/enabled=false/enabled=true/' serverutilities.cfg

#adding on offline chunkloading!
sed -i '$a\\' ./server/ranks.txt
sed -i '/\[admin\]/,/^$/s/^$/serverutilities.chunkloader.load_offline: true/' ./server/ranks.txt
#holy fucking shit we did it!!!!
#$a is eof???? it needs a symbol after and for some reason a second \ then makes it make a new line
#then we're making a range of [admin] to ^$ (newline endofline) substituting ^$ for our thingy!!!!

#extra ideas
#thaum research mode, machina/salisarcanis? (idk if we can do another 24hr research session again)
#Archaicfix disable spawnchunks, might be useful at some point?
#reset/redo journeymap settings 2.8

