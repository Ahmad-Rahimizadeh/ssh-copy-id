# ssh-copy-id
automate copy ssh public key to multiple remote servers


using this script help you to copy your ssh key to multiple remote servers with just one command.

first install sshpass using below command:
```
  apt install sshpass -y
```

then generate your ssh-key with ssh-key command.
after that you should create two files. create loke below:
```
  hosts =====> write down remote servers ip addresses
  password.txt =====> write down your remote servers ssh password
```
```
  chmod +x ssh-copy-id.sh
  ./ssh-copy-id.sh <user you want to copy ssh id for> </path-to-your-hosts-file> </path-to-your-password-file>
```  
for example:
```
  ./ssh-copy-id root /root/hosts /root/password.txt
```  
