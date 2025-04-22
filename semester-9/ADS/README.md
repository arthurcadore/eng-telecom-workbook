## Add commands to sudoers

```bash
# Add the user 'cadore' to the sudoers file
# This allows the user to run specific commands without a password
# Open the sudoers file with nano editor

nano /etc/sudoers

cadore ALL=(ALL) NOPASSWD: /usr/local/bin/imunes, /usr/local/bin/vlink, /usr/local/bin/himage

# Save and exit the file
# In nano, press Ctrl + X, then Y to confirm changes, and Enter to save
```
