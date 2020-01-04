#!/bin/bash

RemoteUserName="moibrahim"
RemoteHostName="192.168.178.87"
RemoteOperation="cd C:/Personal;
                 pwd;
				 ls -l"

ssh -o StrictHostKeyChecking=no ${RemoteUserName}@${RemoteHostName} ${RemoteOperation}
# or you can use this format				 
ssh -l ${RemoteUserName} ${RemoteHostName} ${RemoteOperation}

# If you don't want to wirte password each time you run the script,
# you can use the following command
# sshpass -p "yourpassword" ssh -o StrictHostKeyChecking=no pi@192.168.147.36 ${RemoteOperation}'
