/*
 * =====================================================================================
 *
 *       Filename:  scanf_arrary.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016/12/27 星期二  0:25:31
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
int main()
{
	printf("this is scanf() function test....\ninput a stirng: ");
	char str[50] = "";
	scanf("%s",str);
	if(NULL != str){
		printf("%s\n",str);
	}
	bzero(&str,sizeof(str));
	printf("this is gets() function test....\n");
	if(NULL != gets(str)){
		printf("%s\n",str);
	}
	bzero(&str,sizeof(str));
	printf("this is fgets() function test....\n");
	if (NULL != fgets(str,sizeof(str),stdin)){
		printf("%s",str);
	}
	return 0;
}
