# TODO: implement this properly as apart of the setup script

ansible_exists() {
    command -v "$1" >/dev/null 2>&1
}

if ! ansible_exists ansible; then
    echo "Ansible is not detected. Please install it to proceed."
    exit 1
fi

if ! ansible_exists ansible-galaxy; then
    echo "Ansible Galaxy is not detected. Please install it to proceed."
    exit 1
fi

# install ansible roles
ansible-galaxy role install geerlingguy.security geerlingguy.firewall geerlingguy.docker geerlingguy.pip community.docker

# install ansible collections
ansible-galaxy collection install community.general
