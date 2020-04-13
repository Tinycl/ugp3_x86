/***********************************************************************\
|                                                                       |
| Node.cc                                                               |
|                                                                       |
| This file is part of MicroGP v3 (ugp3)                                |
| http://ugp3.sourceforge.net/                                          |
|                                                                       |
| Copyright (c) 2002-2016 Giovanni Squillero                            |
|                                                                       |
|-----------------------------------------------------------------------|
|                                                                       |
| This program is free software; you can redistribute it and/or modify  |
| it under the terms of the GNU General Public License as published by  |
| the Free Software Foundation, either version 3 of the License, or (at |
| your option) any later version.                                       |
|                                                                       |
| This program is distributed in the hope that it will be useful, but   |
| WITHOUT ANY WARRANTY; without even the implied warranty of            |
| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU      |
| General Public License for more details                               |
|                                                                       |
|***********************************************************************'
| $Revision: 643 $
| $Date: 2015-02-23 14:49:36 +0100 (Mon, 23 Feb 2015) $
\***********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdlib.h>
#include <setjmp.h>
#include <signal.h>
#include <sys/time.h>
#include <time.h>

/* PROTO */
unsigned long int evolved_function(void);

/* FILE VARs */
static jmp_buf wakeup_place;
static struct itimerval new;
static void timeout(int);

/* data */

struct c_struct_m8int
{
    char a;
} __attribute__((aligned(1)));

struct c_struct_m16int
{
    short a;
} __attribute__((aligned(2)));


struct c_struct_m32int
{
    int a;
} __attribute__((aligned(4)));
struct c_struct_m32fp
{
    float a;
} __attribute__((aligned(4)));

struct c_struct_m64int
{
    int a;
    int b;
} __attribute__((aligned(8)));
struct c_struct_m64fp
{
    float a;
    float b;
} __attribute__((aligned(8)));

struct c_struct_m80int
{
    int a;
    int b;
    short c;
} __attribute__((aligned(8)));

struct c_struct_m128int
{
    int a;
    int b;
    int c;
    int d;
} __attribute__((aligned(16)));
struct c_struct_m128fp
{
    float a;
    float b;
    float c;
    float d;
} __attribute__((aligned(16)));

struct c_struct_m256int
{
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
} __attribute__((aligned(32)));
struct c_struct_m256fp
{
    float a;
    float b;
    float c;
    float d;
    float e;
    float f;
    float g;
    float h;
} __attribute__((aligned(32)));


// 
struct c_struct_m8int m8int_c1 = {0x5a};
unsigned char gap1[2*1024*1024] = {0xcc};
struct c_struct_m16int m16int_c1 = {0x5a5a};
unsigned char gap2[2*1024*1024] = {0xcc};
struct c_struct_m32int m32int_c1 = {0x5a5a5a5a};
unsigned char gap3[2*1024*1024] = {0xcc};
struct c_struct_m32fp m32fp_c1 = {12345.54321};
unsigned char gap4[2*1024*1024] = {0xcc};
struct c_struct_m64int m64int_c1 = {0x5a5a5a5a, 0xa5a5a5a5};
unsigned char gap5[2*1024*1024] = {0xcc};
struct c_struct_m64fp m64fp_c1 = {12345.76543, 0.0000001};
unsigned char gap6[2*1024*1024] = {0xcc};
struct c_struct_m80int m80int_c1 = {0xa5a5a5a5,0x5a5a5a5a,0xffff};
unsigned char gap7[2*1024*1024] = {0xcc};
struct c_struct_m128int m128int_c1 = {0x5a5a5a5a, 0xa5a5a5a5,0xffffffff,0x00000000};
unsigned char gap8[2*1024*1024] = {0xcc};
struct c_struct_m128fp m128fp_c1 = {12345.76543, 0.0000001, 9999.1111, 9999.0};
unsigned char gap9[2*1024*1024] = {0xcc};
struct c_struct_m256int m256int_c1 = {0x5a5a5a5a, 0xa5a5a5a5,0xffffffff,0x00000000,0x5a5a5a5a, 0xa5a5a5a5,0xffffffff,0x00000000};
unsigned char gap10[2*1024*1024] = {0xcc};
struct c_struct_m256fp m256fp_c1 = {12345.76543, 0.0000001, 9999.1111, 9999.0,12345.76543, 0.0000001, 9999.1111, 9999.0};

int main(int argc, char *argv[])
{
    unsigned long int val;
    unsigned long int m;
    int fitness;
    clock_t start, end;
    /* Set up watchdog */
    signal(SIGVTALRM, timeout);
    new.it_interval.tv_sec = 0; //interval timer
    new.it_interval.tv_usec = 0;
    new.it_value.tv_sec = 2; //s timer out
    new.it_value.tv_usec = 0; //ms
    setitimer(ITIMER_VIRTUAL, &new, NULL);

    if(setjmp(wakeup_place)) {
	/* if the evolved_function hung, the longjmp will bring back us here */
	    printf("evolved_function: hung\n");
        exit(0);
    } else 
	{
	/* "normal" flow */
		//start = clock();
		val = evolved_function();
		//end = clock();
		//printf("run clock is %ld\n", end-start);
		printf("evolved_function: success\n"); 	
	
    }

    return 0;
}

static void timeout(int foo)
{
    longjmp(wakeup_place, 1);
}
