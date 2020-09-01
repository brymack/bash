#!/bin/bash
#Add user and prompt for key
#!/bin/bash
#Add user and prompt for key

echo "Adding a user..."
echo "Username?"
read username

echo "SSH key?"
read sshkey

sshkeypath=/home/$username/.ssh/authorized_keys
echo "$sshkeypath"
adduser $username --disabled-password
mkdir /home/$username/.ssh
chmod 700 /home/$username/.ssh
touch "$sshkeypath"
chmod 600 "$sshkeypath"
echo "$sshkey" > "$sshkeypath"
chown $username:$username "$sshkeypath"
chown $username:$username /home/$username/.ssh
usermod -aG sudo $username
