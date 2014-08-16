//
//  IntegerCharacterArrayAdder.c
//  IntegerCharArray
//
//  Created by Troy Chmieleski on 8/15/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "IntegerCharacterArrayAdder.h"
#include "IntegerConverter.h"

typedef enum {
	false = 0,
	true = 1
} bool;

int min(int first, int second) {
	int min = (first < second) ? first : second;
	
	return min;
}

int max(int first, int second) {
	int max = (first > second) ? first : second;
	
	return max;
}

void clearIntegerArray(int integerArray[], int count) {
	for (int i = 0; i < count; i++) {
		integerArray[i] = 0;
	}
}

int numberOfPrefixZerosInIntegerArray(int integerArray[], int integerArrayCount) {
	int numberOfPrefixZeros = 0;
	
	for (int i = 0; i < integerArrayCount; i++) {
		int integer = integerArray[i];
		
		if (integer == 0) {
			numberOfPrefixZeros++;
		}
		
		else {
			break;
		}
	}
	
	return numberOfPrefixZeros;
}

int * stripZerosFromBeginningOfIntegerArray(int integerArray[], int integerArrayCount, int *strippedIntegerArrayCount) {
	int numberOfPrefixZeros = numberOfPrefixZerosInIntegerArray(integerArray, integerArrayCount);
	*strippedIntegerArrayCount = integerArrayCount - numberOfPrefixZeros;
	
	if (numberOfPrefixZeros == 0) {
		return integerArray;
	}
	
	int *strippedIntegerArray = (int *)malloc(sizeof(int) * (*strippedIntegerArrayCount));
	
	for (int i = numberOfPrefixZeros, strippedIntegerArrayIndex = 0; i < integerArrayCount; i++, strippedIntegerArrayIndex++) {
		strippedIntegerArray[strippedIntegerArrayIndex] = integerArray[i];
	}
	
	return strippedIntegerArray;
}

char * characterArrayFromIntegerArray(int integerArray[], int count) {
	char *characterArray = (char *)malloc(sizeof(char) * count);
	
	for (int i = 0; i < count; i++) {
		int integer = integerArray[i];
		char character = intToChar(integer);
		characterArray[i] = character;
	}
	
	return characterArray;
}

CharacterArray addTwoIntegersRepresentedAsCharacterArrays(CharacterArray characterArrayOne, CharacterArray characterArrayTwo) {
	CharacterArray characterSumArray;
	
	char *arrayOne = characterArrayOne.array;
	char *arrayTwo = characterArrayTwo.array;
	
	int characterArrayOneCount = characterArrayOne.count;
	int characterArrayTwoCount = characterArrayTwo.count;
	
	int maxSumArrayCount = max(characterArrayOneCount, characterArrayTwoCount) + 1;
	int sumIntegerArray[maxSumArrayCount];
	clearIntegerArray(sumIntegerArray, maxSumArrayCount);
	
	int carry = 0;
	
	for (int i = maxSumArrayCount, characterArrayOneIndex = characterArrayOneCount - 1, characterArrayTwoIndex = characterArrayTwoCount - 1, sumArrayIndex = maxSumArrayCount - 1; i > 0; i--, characterArrayOneIndex--, characterArrayTwoIndex--, sumArrayIndex--) {
		
		int integerOne = 0;
		int integerTwo = 0;
		
		if (characterArrayOneIndex >= 0) {
			char characterOne = arrayOne[characterArrayOneIndex];
			integerOne = (characterArrayOneIndex >= 0) ? charToInt(characterOne) : 0;
		}
		
		if (characterArrayTwoIndex >= 0) {
			char characterTwo = arrayTwo[characterArrayTwoIndex];
			integerTwo = charToInt(characterTwo);
		}

		int integerSum = integerOne + integerTwo + carry;
		
		int potentialPlaceSum = integerSum - 10;
		carry = potentialPlaceSum >= 0 ? 1 : 0;
		int placeSum = (carry == 1) ? potentialPlaceSum : integerSum;

		sumIntegerArray[sumArrayIndex] += placeSum;
	}
	
	int strippedSumArrayCount;
	int *strippedSumArray = stripZerosFromBeginningOfIntegerArray(sumIntegerArray, maxSumArrayCount, &strippedSumArrayCount);
	char *sumArray = characterArrayFromIntegerArray(strippedSumArray, strippedSumArrayCount);
	
	characterSumArray.count = strippedSumArrayCount;
	characterSumArray.array = sumArray;
	
	return characterSumArray;
}

void populateNewCharacterArraysWithSumOfFirstTwoCharacterArrays(CharacterArray newCharacterArrays[], int newCount, CharacterArray characterArrays[], int count, CharacterArray sumOfFirstTwoCharacterArrays) {
	newCharacterArrays[0] = sumOfFirstTwoCharacterArrays;
	
	for (int i = 1; i < newCount; i++) {
		newCharacterArrays[i] = characterArrays[i + 1];
	}
}

CharacterArray addIntegersRepresentedAsCharacterArrays(int count, CharacterArray *characterArrays) {
	CharacterArray characterSumArray = characterArrays[0];
	
	if (count <= 1) {
		return characterSumArray;
	}
	
	CharacterArray characterArrayOne = characterArrays[0];
	CharacterArray characterArrayTwo = characterArrays[1];
	CharacterArray sumOfTwoIntegerCharacterArrays = addTwoIntegersRepresentedAsCharacterArrays(characterArrayOne, characterArrayTwo);
	
	int newCount = count - 1;
	CharacterArray newCharacterArrays[newCount];
	populateNewCharacterArraysWithSumOfFirstTwoCharacterArrays(newCharacterArrays, newCount, characterArrays, count, sumOfTwoIntegerCharacterArrays);
	characterSumArray = addIntegersRepresentedAsCharacterArrays(newCount, newCharacterArrays);
	
	return characterSumArray;
}

CharacterArray addIntegersRepresentedAsListOfCharacterArrays(int count, CharacterArray characterArrayOne, ...) {
	CharacterArray characterArrays[count];
	characterArrays[0] = characterArrayOne;
	
	va_list variableArgumentList;
	
	va_start(variableArgumentList, characterArrayOne);
	
	for (int i = 1; i < count; i++) {
		CharacterArray characterArray = va_arg(variableArgumentList, CharacterArray);
		characterArrays[i] = characterArray;
	}
	
	va_end(variableArgumentList);
	
	CharacterArray sumCharacterArray = addIntegersRepresentedAsCharacterArrays(count, characterArrays);
	
	return sumCharacterArray;
}