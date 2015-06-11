#ifndef RUN_CREST_FINDLEVEL_H__
#define RUN_CREST_FINDLEVEL_H__


#include <iostream>
#include <stdlib.h>
#include <bits/stdc++.h>
#include <vector>
#define iterator int

using namespace std;

typedef pair<int,int> int2;
vector<int2> branchLevel;
int numBranches;

void readLevels(){
	iterator i=0;

	FILE* f=fopen("../../test/level.txt","r");

	int2 temp;

	while(!feof(f)){
		fscanf(f,"%d %d",&temp.first,&temp.second);
		branchLevel.push_back(temp);
		i++;
	}

	numBranches=i-1;

	fclose(f);
}

int returnLevel(int branch_id,int start,int end){

	if(branchLevel[(start+end)/2].first==branch_id) return branchLevel[(start+end)/2].second;

	else if(branchLevel[(start+end)/2].first<branch_id){
		return returnLevel(branch_id,(start+end)/2,end);
	}

	else return returnLevel(branch_id,start,(start+end)/2); 

	return 0;
}

int findLevel(int branch_id){
	readLevels();
    return returnLevel(branch_id,0,numBranches);;
}

#endif