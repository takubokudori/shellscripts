# /etc/apt/sources.list >> https://hlzmel.fsmg.org.nz/kali kali-rolling/main
# echo "https://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y task-japanese task-japanese-desktop
sudo apt install vim-gtk uim uim-anthy snapd tree
sudo apt install -y python3 python3-dev python3-pip python python-dev python-pip
sudo apt install -y perl
sudo apt install -y gcc gdb gdb-server clang build-essentials
sudo apt install smbclient cifs-utils
sudo apt install thefuck
# echo "eval $(thefuck --alias)" >> ~/.bashrc
# echo "eval $(thefuck --alias FUCK)" >> ~/.bashrc
git https://github.com/takubokudori/vimrcs ~
sudo systemctl start snapd
sudo systemctl enable snapd
sudo systemctl start apparmor
sudo systemctl enable apparmor
# echo "PATH=$PATH:/snap/bin" >> ~/.bashrc
# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb -O /tmp/slack-desktop.deb # Download Slack
sudo dpkg -i /tmp/slack-desktop.deb
sudo apt --fix-broken install
sudo dpkg -i /tmp/slack-desktop.deb
# vi
