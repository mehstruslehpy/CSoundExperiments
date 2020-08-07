#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
typedef unsigned char BOOL;
const BOOL TRUE = 1;
const BOOL FALSE = 0;
void generateInstrument(char instrnum,unsigned divisions,unsigned beatspermeasure,unsigned measurestoplay);
void buildUnitMeasure(BOOL* measure,unsigned notespermeasure);
void printNote(char instrnum,double start);
void printArr(BOOL* measure,unsigned notespermeasure);
int main(int argc, char* argv[])
{
	if (argc != 6)
	{
		//printf("ARGC=%d\n",argc);
		printf("USAGE: ./BeatGen <measures> <beatspermeasure> <kick-div> <hat-div> <snare-div>\n");
		return EXIT_FAILURE;
	}
	srand(time(NULL));
	unsigned measurestoplay = atoi(argv[1]);
	unsigned beatspermeasure = atoi(argv[2]);
	unsigned kickdivisions = atoi(argv[3]);
	unsigned hatdivisions = atoi(argv[4]);
	unsigned snaredivisions = atoi(argv[5]);
	printf(";kick pattern:\n");
	printf("instrument start duration amp p5 cutoff res\n");
	generateInstrument('2',kickdivisions,beatspermeasure,measurestoplay);
	printf("\n\n;hat pattern:\n");
	generateInstrument('1',hatdivisions,beatspermeasure,measurestoplay);
	printf("\n\n;snare pattern:\n");
	generateInstrument('3',snaredivisions,beatspermeasure,measurestoplay);
	return EXIT_SUCCESS;
}
void generateInstrument(char instrnum,unsigned divisions,unsigned beatspermeasure,unsigned measurestoplay)
{
	//allocate enough space to hold one measure in the correct divisions
	unsigned notespermeasure = divisions*beatspermeasure;
	double timing = 1.0 / divisions; // notes are played as offsets
	double clock = 0;
	BOOL* measure = calloc(notespermeasure,sizeof(BOOL));
	//printf("DEBUG:Instrument Num:%c\n",instrnum);
	//printf("DEBUG:Notes Per Measure:%d\n",notespermeasure);
	//printf("DEBUG:Beats Per Measure:%d\n",beatspermeasure);
	//printf("DEBUG:Divisions:%d\n",divisions);
	buildUnitMeasure(measure,notespermeasure);
	printf(";");
	printArr(measure,notespermeasure);
	for (double i = 0;i!=measurestoplay;i++)
	{
		unsigned index = 0;
		printf(";measure %f\n",i+1);
		for (double j = 0;j!=notespermeasure+1;j++)
		{
			index = j;
			//printf(";start=%f,i=%f,j=%f,timing=%f\n",timing * (double)j + (double)i,i,j,timing);
			if (measure[index]==TRUE) printNote(instrnum,clock);
			clock+=timing;
		}
	}
	//clean up allocated memory
	free(measure);
}
void printNote(char instrnum,double start)
{
	double amplitude = 0;
	double p5 = 0;
	unsigned cutoff = 0;
	double res = 0;
	switch (instrnum)
	{
	case '1': 
	{
		amplitude = 0.5; 
		p5 = 0.5;
		cutoff = 5000;
		res = 1.5;
		break;
	}
	case '2': 
	{
		amplitude = 10; 
		p5 = 20;
		cutoff = 100;
		res = 2.5;
		break;
	}
	case '3': 
	{
		amplitude = 0.5; 
		p5 = 0.5;
		cutoff = 2000;
		res = 2.0;
		break;
	}
	}
	//printf("DEBUG: start = %f",start);
	//instrument start duration amp p5 cutoff res
	printf("i%c %f 0.5 %f %f %d %f\n",instrnum,start,amplitude,p5,cutoff,res);
}
void buildUnitMeasure(BOOL* measure,unsigned notespermeasure)
{
	for (unsigned i = 0 ; i != notespermeasure;i++)
	{
		//generate random true or false
		if (rand()&1) measure[i]=TRUE;
		else measure[i]=FALSE;
	}
	//DEBUGPRINTARR(measure,notespermeasure);
}
void printArr(BOOL* measure,unsigned notespermeasure)
{
	for (unsigned i = 0 ; i != notespermeasure;i++)
	{
		if (measure[i]==TRUE) printf("T ");
		else printf("F ");
	}
	printf("\n");
}
