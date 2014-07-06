#include <time.h>

struct timespec t1;
int main(){
    t1.tv_sec=4;
    struct timespec time;
    time.tv_sec=3;
    time.tv_nsec=0;
    return 0;
}
