#include <stdio.h>
int main() {
//create integer variable
int port = 80;
//create pointer to port
int *ptr = &port;
//to print using variable
printf("Port value using variable: %d\n", port);
//to print using pointer
printf("Port value using pointer: %d\n", *ptr);
//Change value using pointer
*ptr = 443;
//print new value
printf("Updated port value: %d\n", port);
return 0;
}
