//
//  ViewController.m
//  IntegerCharArray
//
//  Created by Troy Chmieleski on 8/15/14.
//  Copyright (c) 2014 Troy Chmieleski. All rights reserved.
//

#import "ViewController.h"
#import "IntegerConverter.h"
#import "CharacterIntegerArrayAdder.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	char characterIntegerArrayOne[] = {'9', '8', '7'};
	char characterIntegerArrayTwo[] = {'1', '3'};
	char characterIntegerArrayThree[] = {'1', '0'};
	char characterIntegerArrayFour[] = {'5'};
	
	int characterIntegerArrayOneCount = sizeof(characterIntegerArrayOne)/sizeof(char);
	int characterIntegerArrayTwoCount = sizeof(characterIntegerArrayTwo)/sizeof(char);
	int characterIntegerArrayThreeCount = sizeof(characterIntegerArrayThree)/sizeof(char);
	int characterIntegerArrayFourCount = sizeof(characterIntegerArrayFour)/sizeof(char);
	
	int numberOfCharacterArrays = 4;
	
	CharacterArray characterArrayOne = {.count = characterIntegerArrayOneCount, .array = characterIntegerArrayOne};
	CharacterArray characterArrayTwo = {.count = characterIntegerArrayTwoCount, .array = characterIntegerArrayTwo};
	CharacterArray characterArrayThree = {.count = characterIntegerArrayThreeCount, .array = characterIntegerArrayThree};
	CharacterArray characterArrayFour = {.count = characterIntegerArrayFourCount, .array = characterIntegerArrayFour};
	
	CharacterArray characterSumArray = addIntegersRepresentedAsCharacterArrays(numberOfCharacterArrays, characterArrayOne, characterArrayTwo, characterArrayThree, characterArrayFour);
	
	printCharacterArray(characterArrayOne);
	printCharacterArray(characterArrayTwo);
	printCharacterArray(characterArrayThree);
	printCharacterArray(characterArrayFour);
	printCharacterArray(characterSumArray);
}

void printCharacterArray(CharacterArray characterArray) {
	int count = characterArray.count;
	char *array = characterArray.array;
	
	for (int i = 0; i < count; i++) {
		printf("%c", array[i]);
		
		if (i != count - 1) {
			printf(", ");
		}
	}
	
	printf("\n");
}

@end
