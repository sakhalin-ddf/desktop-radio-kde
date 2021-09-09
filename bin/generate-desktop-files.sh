#! /bin/bash

__FILE__=`readlink -e ${BASH_SOURCE[0]}`
__DIR__=$(dirname $(dirname ${__FILE__}))

cat <<EOT > ~/.local/share/applications/radio-play.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Radio play
Icon=${__DIR__}/icons/play.svg
Exec="${__DIR__}/bin/select.js" %f
Comment=Select and play radio station
Categories=AudioVideo;X-Radio;
Terminal=false
EOT

cat <<EOT > ~/.local/share/applications/radio-stop.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Radio stop
Icon=${__DIR__}/icons/stop.svg
Exec="${__DIR__}/bin/stop.sh" %f
Comment=Stop playing radio
Categories=AudioVideo;X-Radio;
Terminal=false
EOT

cp ~/.local/share/applications/radio-*.desktop ~/.gnome/apps/
