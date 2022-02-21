#include "Sample.h"
#include "soma.h"
#include "menos.h"
#include <iostream>

int Sample::add(int a, int b) {
    printf("mado scientisto!\n");

    // return a+b;
    return soma(a,b);
}

int Sample::minus(int a, int b) {
    printf("entrei em menos classe\n");
    int r = menos(a, b);
    return r;
}

int Sample::mul(int a, int b) {
    return a*b;
}
