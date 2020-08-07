#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "notetable.h"
const unsigned UPPERVOL = 9000;
const unsigned LOWERVOL = 1000;

double randomNote(unsigned uppernote,unsigned lowernote);
double randomDuration();
unsigned randomVolume();
int main(int argc, char* argv[])
{
	unsigned uppernote = atoi(argv[4]);
	unsigned lowernote = atoi(argv[3]);
	if (argc!=5) 
	{
		printf("Error: invalid argument count.\n");
		printf("Usage ./diatonic <instrument name> <notecount> <lowernote> <uppernote>\n");
		printf("Upper and lower note are modded into range 0-62.\n");
		return EXIT_FAILURE;
	}
    srand(time(NULL));
    unsigned notecount = atoi(argv[2]);
	char* iname = argv[1];

	double start = 0;
	double duration = randomDuration();
	for (unsigned i = 0; i < notecount; i++)
	{
		printf("%s %f %f %f %d\n",iname,start,duration,randomNote(uppernote,lowernote),randomVolume());
		start+=duration;
		duration = randomDuration();
	}
}
double randomNote(unsigned uppernote,unsigned lowernote)
{
	//return NOTETABLE[(rand() % (uppernote - lowernote + 1))+lowernote];
	int index = (rand() % (uppernote - lowernote + 1))+lowernote;
	//printf("index=%d\n",index);
	return NOTETABLE[index%63];
}
unsigned randomVolume()
{
    return (rand() % (UPPERVOL - LOWERVOL + 1)) + LOWERVOL;
}
double randomDuration()
{
	return ((double)rand()/(double)(RAND_MAX)) * + 1;
}
