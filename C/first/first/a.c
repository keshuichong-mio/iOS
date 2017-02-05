//
//  a.c
//  first
//
//  Created by lic on 17/2/5.
//  Copyright © 2017年 lic. All rights reserved.
//

#include "a.h"


int twoNumberSums(int a, int b)
{
    return a*b;
}

int compare(int a, int b)
{
    return a>b?a:b;
}

void printChar(void)
{
    printf("please input string: \n");

    char a,b,c;
    scanf("%c%c%c",&a,&b,&c);
    
    printf("result is %c,%c,%c\n",a,b,c);
}

void printSizeOfType(void)
{
    printf("size of int : %ld\n",sizeof(int));
    printf("size of unsigned int : %ld\n",sizeof(unsigned int));
    printf("size of short : %ld\n",sizeof(short));
    printf("size of long : %ld\n",sizeof(long));
    printf("size of long long : %ld\n",sizeof(long long));
    printf("size of unsigned long : %ld\n",sizeof(unsigned long));
    printf("size of char : %ld\n",sizeof(char));
    printf("size of float : %ld\n",sizeof(float));
    printf("size of double : %ld\n",sizeof(double));
    printf("size of long double : %ld\n",sizeof(long double));
}

void sumsOfsequence(void)
{
    int a;
    printf("please input a number to n:");
    scanf("%d",&a);
    
    int sum=0;
    for (int i=1; i<=a; i++) {
        int temp = 0;
        for (int j=1; j<=i; j++) {
            temp+=j;
        }
        sum += temp;
    }
    
    printf("the sum of the sequence<%d> is : %d\n",a,sum);
}

void multiplication(void)
{
    for (int i=0; i<=9; i++) {
        
        for (int j=0; j<=9; j++) {
            
            if (i==0) {
                if (j==0) {
                    printf("\t\t");
                }else printf("%2d\t\t",j);
            }else if (j==0) {
                printf("%2d\t\t",i);
            }else printf("%2d\t\t",i*j);
        }
        printf("\n");
        
    }
}

void multiplication1(void)
{
//    int x,y;
//    
//    x=9,y=5;
//    for (int i=1; i<=9; i++) {
//        gotoxy(x,y);
//        printf("%2d",i);
//        
//        x+=3;
//    }
}

void oneDimensionalStatistics(void)
{
    int num;
    while(1)
    {
        printf("How many students are in your class: ");
        scanf("%d",&num);
        if (num<=0||num>100) {
            printf("Please input the correct number\n");
            continue;
        }else break;
    }
    
    int studentNumber[num],math[num],chinese[num],english[num];
    printf("Please input a StudentsId and three Scores:\n");
    for (int i=0; i<num; i++) {
        printf("student %d> ",i+1);
        scanf("%d%d%d%d",&studentNumber[i],&math[i],&chinese[i],&english[i]);
    }
    
    printf("-------------------------------------------------------------------------------------------------------\n");
    for (int i=0; i<num; i++) {
        float avg = (math[i]+chinese[i]+english[i])/3;
        printf("%d\t%d\t%d\t%d\t%.2f",studentNumber[i],math[i],chinese[i],english[i],avg);
        printf("\n");
    }
    printf("-------------------------------------------------------------------------------------------------------\n");
}
