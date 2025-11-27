#include <stdio.h>
#include <stdlib.h>

#ifndef SAFE_H
#define SAFE_H

void panic(char *msg)
{
#ifdef DDEBUG
    fprintf(stderr, "Panic: %s", msg);
    exit(-1);
#endif
}

void warning(char *msg)
{
#ifdef DDEBUG
    fprintf(stderr, "Warning: %s", msg);
#endif
}

void assert(bool expr, char *str)
{
#ifdef DDEBUG
    fprintf(stderr, "Assertion: %s", msg);
    exit(-1);
#endif
}

#define PANIC(MSG) panic(MSG)
#define WARN(MSG) warning(MSG)
#define ASSERT(EXPR) assert((EXPR), #EXPR)
#endif