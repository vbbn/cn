#include<bits/stdc++.h>
using namespace std;

void traceroute(char *a){
char cmd[100] = "traceroute ";
strcat(cmd, a);

system(cmd);
}

int main(){
char ip[100];

cout << "Enter ip or domain : ";
cin >> ip;

    traceroute(ip);
   
    return 0;
}
