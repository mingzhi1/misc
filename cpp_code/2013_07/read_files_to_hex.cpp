#include <stdio.h>
#include <string.h>
#include <stdint.h>

unsigned char buffer[1025];

void output(unsigned char *str,int size,FILE *file)
{
	char out_buffer[1024*8] = {'\0'};
	for( int i= 0; i<size; i+=2 )
    {
        sprintf(out_buffer+7*(i/2),"0x%02x%02x ",buffer[i],buffer[i+1]);
    }
	fputs(out_buffer, file);
}

int main(int argc,char *argv[])
{
	if (argc < 1)
	{
		printf("error param\ntool1  file1 [file2] .. [files]");
		return -1;
	}

	FILE * in_file,* out_file;
	char temp[20];

	for(int i = 2; i < argc; i++)
	{
		in_file = fopen (argv[i] , "rb");
		sprintf(temp, "%s.txt", argv[i]);
		out_file = fopen (temp , "wb");

		if (in_file == NULL)
		{
			printf("%s is not Exist!\n",argv[i]);
			return -1;
		}
		fseek(in_file, 0, SEEK_END);
		uint64_t filesize = ftell (in_file);
		fseek(in_file, 0, SEEK_SET); 

		uint64_t readed = 0,size;

		while( readed < filesize )
		{
			memset( buffer,'\0',sizeof(buffer));
			size = fread(buffer, sizeof(char), 1024, in_file);
			readed += size;
			output(buffer,size,out_file);
		}
		fclose(in_file);
		fclose(out_file);
	}
	return 0;
}