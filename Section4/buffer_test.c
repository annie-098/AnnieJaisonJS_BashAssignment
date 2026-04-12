#include <stdio.h>
#include <string.h>
int main() {
char buffer[16];
printf("Enter some text: ");
gets(buffer);  // Unsafe function (intentionally used)
printf("You entered: %s\n", buffer);
return 0;
}

/*
ANSWERS:
1. What happens with long input?
   If input exceeds 16 characters, it overflows the buffer and overwrites adjacent memory.

2. Why is this dangerous?
   It can cause crashes or allow attackers to execute malicious code (buffer overflow attack).

3. How would you fix it?
   Use safer functions like:
   fgets(buffer, sizeof(buffer), stdin);

   OR
   strncpy() instead of strcpy()
*/
