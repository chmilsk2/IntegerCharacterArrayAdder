//
//  IntegerCharacterArrayAdder.h
//  IntegerCharArray
//
//  Created by Troy Chmieleski on 8/15/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

typedef struct {
	char *array;
	int count;
} CharacterArray;

/**
 *	Given integers represented as a char arrays, add them and return a new char array
 *
 *  @param count number of character arrays
 *  @param characterArray, ... variable argument list of integers represented as char arrays
 *
 *  @return new char array containing the sum
 */
CharacterArray addIntegersRepresentedAsListOfCharacterArrays(int count, CharacterArray characterArrayOne, ...);