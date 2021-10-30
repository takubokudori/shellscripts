# Install Hyper-V fcopy daemon
apt install -y linux-tools-$(uname -r) linux-cloud-tools-$(uname -r)
systemctl start hv-fcopy-daemon
systemctl status hv-fcopy-daemon

