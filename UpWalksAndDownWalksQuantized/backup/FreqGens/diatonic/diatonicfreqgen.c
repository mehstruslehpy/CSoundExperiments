//Note: this program outputs AT LEAST the notecount but could spit out more
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "notetable.h"
typedef char BOOL;
const unsigned UPPERVOL = 7000;
const unsigned LOWERVOL = 4000;
void printWrapper(unsigned,unsigned,char*,double,double);
double randomNote(unsigned uppernote,unsigned lowernote);
double randomDuration();
unsigned randomVolume();
void upWalk(unsigned*,char*,double*,double*,unsigned,unsigned);
void downWalk(unsigned*,char*,double*,double*,unsigned,unsigned);
int main(int argc, char* argv[])
{
	unsigned uppernote = atoi(argv[4]);
	unsigned lowernote = atoi(argv[3]);
	if (argc!=5) 
	{
		printf("Error: invalid argument count.\n");
		printf("Usage ./diatonic <instrument name> <minnotecount> <lowernote> <uppernote>\n");
		printf("Upper and lower note are modded into range 0-62.\n");
		return EXIT_FAILURE;
	}
    srand(time(NULL));
    unsigned notecount = atoi(argv[2]);
	char* iname = argv[1];
	BOOL randbool = 0;

	double start = 0;
	double duration = randomDuration();
	for (unsigned i = 0; i < notecount; i++)
	{
		//printf("%s %f %f %f %d\n",iname,start,duration,randomNote(uppernote,lowernote),randomVolume());
		randbool = rand() & 1;
		if (randbool) upWalk(&i,iname,&start,&duration,uppernote,lowernote);
		else downWalk(&i,iname,&start,&duration,uppernote,lowernote);
;
		//start+=duration;
		//duration = randomDuration();
	}
}
void upWalk(unsigned* i,char* iname,double* start,double* duration,unsigned uppernote,unsigned lowernote)
{
	BOOL skip = 0;	
	const unsigned maxrun = 8;
	const unsigned minrun = 4;
	const unsigned maxrunnote = uppernote;
	const unsigned minrunnote = lowernote;
	unsigned runcount = (rand() % (maxrun - minrun + 1))+minrun;

	const unsigned runstartnote = (rand() % (maxrunnote-minrunnote+1))+minrunnote;
	for (unsigned j = 0; j<runcount;j++,i++)
	{
		skip = rand() & 1;
		if (!skip)
		{
			printWrapper(j,j+runstartnote,iname,*start,*duration);
			*start+=*duration;
			*duration = randomDuration();
		}
	}
}
void printWrapper(unsigned j,unsigned printnote,char* iname,double start,double duration)
{
	unsigned static notes = 1;
	unsigned int chordrepeat = 5; //new chord every 4 notes
	printf("%s %f %f %f %d\n",iname,start,duration,NOTETABLE[printnote%63],randomVolume());
	//print chords every so often
	if (notes==chordrepeat)
	{
		printnote-=8;//drop an octave
		printf("%s %f %f %f %d\n","i2",start,1.5,NOTETABLE[printnote%63],randomVolume()); //root
		printf("%s %f %f %f %d\n","i2",start,1.5,NOTETABLE[(2+printnote)%63],randomVolume()); //third
		printf("%s %f %f %f %d\n","i2",start,1.5,NOTETABLE[(4+printnote)%63],randomVolume()); //fifth
		notes=1;
	}
	notes++;
}
void downWalk(unsigned* i,char* iname,double* start,double* duration,unsigned uppernote,unsigned lowernote)
{
	BOOL skip = 0;	
	const unsigned maxrun = 8;
	const unsigned minrun = 4;
	const unsigned maxrunnote = uppernote;
	const unsigned minrunnote = lowernote;
	unsigned runcount = (rand() % (maxrun - minrun + 1))+minrun;

	const unsigned runstartnote = (rand() % (maxrunnote-minrunnote+1))+minrunnote;
	for (unsigned j = 0; j<runcount;j++,i++)
	{
		skip = rand() & 1;
		if (!skip)
		{
			printWrapper(j,runstartnote-j,iname,*start,*duration);
			*start+=*duration;
			*duration = randomDuration();
		}
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
