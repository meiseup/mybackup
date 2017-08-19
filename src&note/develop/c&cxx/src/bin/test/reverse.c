/*
 * =====================================================================================
 *
 *       Filename:  reverse.c
 *
 *    Description:		
 *
 *        Version:  1.0
 *        Created:  2016/12/27 星期二  1:03:59
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdio.h>
#include <string.h>
#ifndef COUNTER_SIZE
#define COUNTER_SIZE 9
#endif
void dispaly_board();

char board[COUNTER_SIZE][COUNTER_SIZE] = {0};
char counter_computer = '@';
char couter_player = 'O';

int main()
{
	dispaly_board();
	return 0;
}

void dispaly_board()
{
	int i,j;
	for(i=0;i<COUNTER_SIZE;i++){
		for(j=0;j<COUNTER_SIZE;j++){
			board[i][j] = ' ';
		}
	}
	char c_lable = 'A';
	printf("\n");
	for(i=0;i<COUNTER_SIZE;i++){
		printf(" %c",i+c_lable);
	}
	printf("\n");
	for(i = 0;i<COUNTER_SIZE;i++){
		printf(" +");
		for(j = 0;j<COUNTER_SIZE;j++){
			printf("-+");
		}
		printf("\n%2d|",i+1);
	}
}
