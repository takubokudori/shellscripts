git clone https://github.com/videolan/vlc
cd vlc
apt install -y build-essentials
apt install -y ffmpeg lua5.1-dev libavcodec-dev libavformat-dev libswscale-dev liba52-dev
apt install -y libxcb-xkb-dev libalsa-ocaml-dev libqt5svg5-dev
./bootstrap
./configure --enable-debug
make