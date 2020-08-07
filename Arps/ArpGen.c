#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "notetable.h"
typedef unsigned char BOOL;
const BOOL TRUE = 1;
const BOOL FALSE = 0;
void generateArps(unsigned measurestopattern,
					unsigned repeatpatterns,
					unsigned beatspermeasure,
					unsigned rhythmdivisions,
					unsigned highestnote,
					unsigned lowestnote);
void buildMeasure(unsigned* measure,unsigned rootnote,BOOL sus2,BOOL sus4,BOOL seventh,unsigned notespermeasure); //maybe add traversal options later
void printNote(unsigned index,unsigned rhythmdivisions);
void fullMeasureBass(unsigned index,double beatspermeasure);
int main(int argc, char* argv[])
{
	if (argc != 7)
	{
		printf("USAGE: ./ArpGen.o <measurestopattern> <repeatpattern> <beatspermeasure> <rhythmdivisions> <highestnote> <lowestnote>\n");
		return EXIT_FAILURE;
	}
	srand(time(NULL));
	unsigned measurestopattern = atoi(argv[1]); //measures per pattern
	unsigned repeatpatterns = atoi(argv[2]); //amount of times to repeat pattern
	unsigned beatspermeasure = atoi(argv[3]); //beats per each measure
	unsigned rhythmdivisions = atoi(argv[4]); //divisions per beat
	int highestnote = atoi(argv[5]); //highest note number
	int lowestnote = atoi(argv[6]); //lowest note number
	if (highestnote-lowestnote<0)
	{
		printf("ERROR: Invalid note range\n");
		return EXIT_FAILURE;
	}
	printf(";measures=%d,repeats=%d,beatspermeasure=%d,rhythmdivisions=%d,highnote=%d,lownote=%d\n",
		measurestopattern,
		repeatpatterns,
		beatspermeasure,
		rhythmdivisions,
		highestnote,
		lowestnote);

	generateArps(measurestopattern,repeatpatterns,beatspermeasure,rhythmdivisions,highestnote,lowestnote);
	return EXIT_SUCCESS;
}
void generateArps(unsigned measurestopattern, unsigned repeatpatterns, unsigned beatspermeasure, unsigned rhythmdivisions, unsigned highestnote, unsigned lowestnote)
{
	//allocate enough space to hold one measure in the correct divisions
	unsigned notespermeasure = rhythmdivisions*beatspermeasure;
	//double timing = 1.0 / rhythmdivisions; // notes are played as offsets
	//double clock = 0;
	//BOOL* measure = calloc(notespermeasure,sizeof(BOOL));
	unsigned** pattern = NULL;

	//alloc each measure
	pattern = calloc(measurestopattern,sizeof(unsigned*));
	//alloc each note in the measure
	for (unsigned i = 0; i < measurestopattern;i++) 
		pattern[i] = calloc(notespermeasure,sizeof(unsigned));

	//generate the pattern
	for (unsigned i = 0; i < measurestopattern;i++)
	{
		unsigned rootnote = (rand() % (highestnote-lowestnote+1))+lowestnote;
		buildMeasure(pattern[i],rootnote,rand()&1,rand()&1,rand()&1,notespermeasure); 
	}
	
	//output the pattern
	for (unsigned k = 0; k < repeatpatterns; k++)
	{
		printf(";pattern\n");
		for (unsigned i = 0; i < measurestopattern;i++)
		{
			printf(";measure\n");
			fullMeasureBass(pattern[i][0],beatspermeasure);
			for (unsigned j = 0; j < notespermeasure; j++)
				printNote(pattern[i][j],rhythmdivisions);
		}
	}
	
	//free each chunk of notes
	for (unsigned i = 0; i < measurestopattern;i++) 
		free(pattern[i]);
	//free each measure
	free(pattern);
}
void printNote(unsigned index,unsigned rhythmdivisions)
{
	static double time = 0;
	//printf("DEBUG: note= %f\n",NOTETABLE[index]);
	//;instrument start duration frequency volume
	printf("i1 %f %f %f 6000.0\n",time,(double)(1.0/rhythmdivisions),NOTETABLE[index]);
	time += (double)(1.0/rhythmdivisions); 
}
void fullMeasureBass(unsigned index,double beatspermeasure)
{
	static double time = 0;
	printf("i2 %f %f %f 6000.0\n",time,beatspermeasure,NOTETABLE[index]);
	printf("i2 %f %f %f 6000.0\n",time,beatspermeasure,NOTETABLE[index-7]);
	//printf("i2 %f %f %f 6000.0\n",time,beatspermeasure,NOTETABLE[index-15]);
	time+=beatspermeasure;
}
void buildMeasure(unsigned* measure,unsigned rootnote,BOOL sus2,BOOL sus4,BOOL seventh,unsigned notespermeasure)
{
	unsigned setsize=4;
	unsigned noteset[4]={rootnote,rootnote+2,rootnote+4,rootnote+7};
	for (unsigned i = 0; i < notespermeasure; i++) measure[i] = noteset[i%setsize];
}
/*
void buildMeasure(unsigned* measure,unsigned rootnote,BOOL sus2,BOOL sus4,BOOL seventh,unsigned notespermeasure)
{
	//four note pattern version
	unsigned curnote = 0;
	//unsigned* noteset = calloc(setsize,sizeof(unsigned));
	unsigned setsize=4;
	unsigned noteset[setsize];
	//printf(";sus2=%c,sus4=%c,seventh=%c\n",(sus2)?('T'):('F'),(sus4)?('T'):('F'),(seventh)?('T'):('F'));
	
	noteset[curnote] = rootnote;

	curnote++;
	if (sus2) 
	{
		noteset[curnote] = rootnote+1; //2nd
	}
	else
	{
		noteset[curnote] = rootnote+2; //3rd
	}

	curnote++;
	if (sus4) 
	{
		noteset[curnote] = rootnote+3; //4th
	}
	else
	{
		noteset[curnote] = rootnote+4; //5th
	}

	curnote++;
	if (seventh) 
	{
		noteset[curnote] = rootnote+6;//7th
	}
	else
	{
		noteset[curnote] = rootnote+7;//octave
	}

	//loop through noteset pattern
	for (unsigned i = 0; i < notespermeasure; i++) measure[i] = noteset[i%setsize];
}
*/
/*
void buildMeasure(unsigned* measure,unsigned rootnote,BOOL sus2,BOOL sus4,BOOL seventh,unsigned notespermeasure)
{
	unsigned curnote = 0;
	unsigned setsize = 3;
	if (sus2) setsize++;
	if (sus4) setsize++;
	if (seventh) setsize++;
	unsigned* noteset = calloc(setsize,sizeof(unsigned));
	//printf(";sus2=%c,sus4=%c,seventh=%c\n",(sus2)?('T'):('F'),(sus4)?('T'):('F'),(seventh)?('T'):('F'));
	
	noteset[curnote] = rootnote;

	curnote++;
	if (sus2) 
	{
		noteset[curnote] = rootnote+1; //2nd
		curnote++;
		noteset[curnote] = rootnote+2; //3rd
	}
	else
	{
		noteset[curnote] = rootnote+2; //3rd
	}

	curnote++;
	if (sus4) 
	{
		noteset[curnote] = rootnote+3; //4nd
		curnote++;
		noteset[curnote] = rootnote+4; //5rd
	}
	else
	{
		noteset[curnote] = rootnote+4; //5rd
	}
	
	if (seventh) 
	{
		curnote++;
		noteset[curnote] = rootnote+6;
	}

	//loop through noteset pattern
	for (unsigned i = 0; i < notespermeasure; i++) measure[i] = noteset[i%setsize];
}
*/
