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
	
	int characterIntegerArrayOneCount = sizeof(characterIntegerArrayOne)/sizeof(char);
	int characterIntegerArrayTwoCount = sizeof(characterIntegerArrayTwo)/sizeof(char);
	int characterIntegerArrayThreeCount = sizeof(characterIntegerArrayThree)/sizeof(char);
	
	int numberOfCharacterArrays = 3;
	
	CharacterArray characterArrayOne = {.count = characterIntegerArrayOneCount, .array = characterIntegerArrayOne};
	CharacterArray characterArrayTwo = {.count = characterIntegerArrayTwoCount, .array = characterIntegerArrayTwo};
	CharacterArray characterArrayThree = {.count = characterIntegerArrayThreeCount, .array = characterIntegerArrayThree};
	
	CharacterArray characterSumArray = addIntegersRepresentedAsCharacterArrays(numberOfCharacterArrays, characterArrayOne, characterArrayTwo, characterArrayThree);
	
	printCharacterArray(characterArrayOne);
	printCharacterArray(characterArrayTwo);
	printCharacterArray(characterArrayThree);
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
