//
//  IntegerConverter.c
//  IntegerCharArray
//
//  Created by Troy Chmieleski on 8/15/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#include <stdio.h>

char intToChar(int integer) {
	char character = (char)((int)'0' + integer);
	
	return character;
}

int charToInt(char character) {
	int integer = (int)character - (int)'0';
	
	return integer;
}