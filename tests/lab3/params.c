#include <stdio.h>

// legal!!
int f(int f) {
        int x = f;
        return x;
}

// illegal!!
int g(int x) {
        int g = 2;
        return g * g(x - 1);
}


int main() {
        printf("hello unix!\n");
        printf("%d\n", f(3));
        return 0;

}