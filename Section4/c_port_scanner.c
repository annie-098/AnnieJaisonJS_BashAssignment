





#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
int scan_port(int port){
int sock;
struct sockaddr_in target;
sock=socket(AF_INET,SOCK_STREAM,0);
if(sock<0){
return 0;
}
target.sin_family=AF_INET;
target.sin_port=htons(port);
target.sin_addr.s_addr=inet_addr("127.0.0.1");
if(connect(sock,(struct sockaddr *)&target,sizeof(target))==0){
close(sock);
return 1;
}
close(sock);
return 0;
}
int main(){
int ports[]={22,80,443,3306};
int i;
printf("Scanning localhost (127.0.0.1)\n\n");
for(i=0;i<4;i++){
if(scan_port(ports[i])){
printf("Port %d: OPEN\n",ports[i]);
}else{
printf("Port %d: CLOSED\n",ports[i]);
}
}
return 0;
}
