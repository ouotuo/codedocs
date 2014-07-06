#include<pthread.h>
#include<stdio.h>
#include<stdlib.h>
#include<time.h>

void thread(void)
{
    struct timespec delay;
    delay.tv_sec=2;
    delay.tv_nsec=0;
    int i=0;
    while(1){
        printf("This is a pthread,%d\n",i);
        i++;
        //pthread_delay_np(&delay);
        sleep(3);
    }
}

int main(void)
{
    pthread_t id;
    int i,ret;
    ret=pthread_create(&id,NULL,(void*)thread,NULL);
    if(ret!=0){
        printf("Create pthread error\n");
        exit(1);
    }
    for(i=0;i<3;i++)
        printf("This is the main process\n");
    pthread_join(id,NULL);
    return(0);
}
