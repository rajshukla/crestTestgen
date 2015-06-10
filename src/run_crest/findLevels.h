#ifndef RUN_CREST_FINDLEVELS_H__
#define RUN_CREST_FINDLEVELS_H__


#include <stdio.h>
#define iterator int

int** branchLevel;
int numBranches;

void readLevels(){
	iterator i=0;

	FILE* f=fopen("../../test/level.txt","r");

	branchLevel=(int **)malloc(1*sizeof(int *));

	while(!feof(f)){
		if(i!=0) branchLevel=(int **)realloc(branchLevel,i+1);
		branchLevel[i]=(int *)malloc(2*sizeof(int));
		fscanf(f,"%d %d",&branchLevel[i][0],&branchLevel[i][1]);
		i++;
	}

	numBranches=i-1;

	fclose(f);
}

int returnLevel(int branch_id,int start,int end){

	if(branchLevel[(start+end)/2][0]==branch_id) return branchLevel[(start+end)/2][1];

	else if(branchLevel[(start+end)/2][0]<branch_id){
		return returnLevel(branch_id,(start+end)/2,end);
	}

	else return returnLevel(branch_id,start,(start+end)/2); 

	return 0;
}

int findLevel(int branch_id){
	readLevels();

	int level=returnLevel(branch_id,0,numBranches);
	
	iterator i;
    for (i = 0; i < numBranches; ++i) {
        free(branchLevel[i]);
    }
    free(branchLevel);

    return level;
}

#endif