#include <stdio.h>

int main(int argc,char* argvs[]){
    if(argc<=1){
        printf("no file\n");
        return 0;
    }else{
        char* fileName=argvs[1];
        printf("open file %s\n",fileName);
        FILE *file=fopen(fileName,"rb");
        if(file==NULL){
            printf("open file fail");
            return -1;
        }

        fseek(file,0,SEEK_END);
        long len=ftell(file);
        printf("file size=%ld\n",len);

        fclose(file);
        return 0;
    }

}
