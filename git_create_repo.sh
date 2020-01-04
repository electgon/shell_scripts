#!/bin/bash
Repo_Path="./Test/"
Repo_Name="RepoB"

RemoteRepoName="RepoC"
RemoteUserName="moibrahim"
RemoteHostName="192.168.178.87"
RemoteOperationPath="C:/Personal/git_tut/workspace_04"
RemoteOperation="cd $RemoteOperationPath;
                 pwd;
				 git init --bare $RemoteRepoName"


ssh -o StrictHostKeyChecking=no ${RemoteUserName}@${RemoteHostName} ${RemoteOperation}


echo "Repo Name will be $Repo_Name"
git init $Repo_Path$Repo_Name

cd $Repo_Path$Repo_Name

cat > hello.c << "EOF"
#include <stdio.h>

int main(void){

    printf("Hello World \n");
	return 0;
} 
EOF

git add hello.c
git commit -m "initial commit"
git tag -a v0.0 -m "starting version"
git remote add origin ${RemoteUserName}@${RemoteHostName}:${RemoteOperationPath}/${RemoteRepoName}
git push origin master --tag --receive-pack=C:/mingw64/bin/git-receive-pack