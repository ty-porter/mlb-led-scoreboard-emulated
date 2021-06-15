#!/bin/bash
python -m pip install -r requirements.txt
echo "If you didn't see any errors above, everything should be installed!"
if [ -n "$1" ]; then
    echo -e "\nSkipping config.json file creation"
    echo -e "\nSkipping emulator_config.json file creation"
else
    echo -e "\nYou'll need a config.json file to customize your settings. If you are updating"
    echo "from an older version and you were required to run this install script again or"
    echo "this is a fresh install, it's recommended we make a fresh one right now."
    echo "This will create a brand new 'config.json' file with default values so edit this"
    echo -e "file with your own settings.\n"
    read -p "Would you like to do this now? [Y/n] " answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        rm config.json
        cp config.json.example config.json
        echo -e "\nYou should now have a fresh config.json file you can customize with your own settings.\n"
    else
        echo -e "\nIf you do not have a config.json, you can manually copy the config.json.example to config.json to customize settings.\n"
    fi
    echo -e "\nYou'll need an emulator_config.json file to customize your emulator settings. If you are updating"
    echo "from an older version and you were required to run this install script again or"
    echo "this is a fresh install, it's recommended we make a fresh one right now."
    echo "This will create a brand new 'emulator_config.json' file with default values so edit this"
    echo -e "file with your own settings.\n"
    read -p "Would you like to do this now? [Y/n] " answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        rm emulator_config.json
        cp emulator_config.json.example emulator_config.json
        echo -e "\nYou should now have a fresh emulator_config.json file you can customize with your own settings.\n"
    else
        echo -e "\nIf you do not have a emulator_config.json, you can manually copy the emulator_config.json.example to emulator_config.json to customize settings.\n"
    fi
fi
echo "Installation complete!"
