#include<bits/stdc++.h>
using namespace std;

void ping(char *a){
char cmd[100] = "ping ";
strcat(cmd, a);

system(cmd);
}

int main(){
char ip[100];

cout << "Enter ip or domain : ";
cin >> ip;

    ping(ip);
   
    return 0;
}
