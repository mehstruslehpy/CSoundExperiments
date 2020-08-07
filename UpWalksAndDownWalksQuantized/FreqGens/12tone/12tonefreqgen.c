/*
12 tone freq gen: prints a sequence of 12 tones in csound score format.
usage ./12tone <instrument name> <notecount>
*/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
const unsigned UPPERNOTE = 88;
const unsigned LOWERNOTE = 1;
const unsigned UPPERVOL = 9000;
const unsigned LOWERVOL = 1000;

double pianoNoteToFreq(unsigned);
unsigned randomNote();
double randomDuration();
unsigned randomVolume();
int main(int argc, char* argv[])
{
	if (argc!=3) 
	{
		printf("Error: invalid argument count.\n");
		printf("Usage ./12tone <instrument name> <notecount>\n");
		return EXIT_FAILURE;
	}
    //start rng
    srand(time(NULL));
    //unsigned num = (rand() % (upper - lower + 1)) + lower;
    //printf("%d \n", pianoNoteToFreq(num));
    unsigned notecount = atoi(argv[2]);
	char* iname = argv[1];
    //printf("Debug:arguments given:%d \n",argc);
    //printf("Debug:instrument name:%s \n",iname);
    //printf("Debug:note count:%d \n",notecount);
	double start = 0;
	double duration = randomDuration();
	for (unsigned i = 0; i < notecount; i++)
	{
		printf("%s %f %f %f %d\n",iname,start,duration,pianoNoteToFreq(randomNote()),randomVolume());
		start+=duration;
		duration = randomDuration();
	}
}
double pianoNoteToFreq(unsigned pianonote)
{
    return pow(2.0,(pianonote-49.0)/12.0)*440.0;
}
unsigned randomNote()
{
    return (rand() % (UPPERNOTE - LOWERNOTE+ 1)) + LOWERNOTE;
}
unsigned randomVolume()
{
    return (rand() % (UPPERVOL - LOWERVOL + 1)) + LOWERVOL;
}
double randomDuration()
{
	return ((double)rand()/(double)(RAND_MAX)) * +1;
}
