# /etc/apt/sources.list >> https://hlzmel.fsmg.org.nz/kali kali-rolling/main
# echo "https://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y task-japanese task-japanese-desktop vim-gtk uim uim-anthy snapd thefuck
sudo apt install -y python3 python3-dev python3-pip python python-dev python-pip
sudo apt install -y perl
sudo apt install -y gcc gdb gdb-server clang
sudo apt install smbclient cifs-utils
git https://github.com/takubokudori/vimrcs ~
systemctl start snapd
systemctl enable snapd
systemctl start apparmor
systemctl enable apparmor
# echo "PATH=$PATH:/snap/bin" >> ~/.bashrc
# Install Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb -O /tmp/slack-desktop.deb # Download Slack
sudo dpkg -i slack-desktop.deb
apt --fix-broken install
sudo dpkg -i slack-desktop.deb
# vi
