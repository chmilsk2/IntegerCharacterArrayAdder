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

	char characterIntegerArrayOne[] = {'9', '0', '4', '8', '5', '9', '0', '4', '3', '8', '5', '0', '4', '3', '9', '5'};
	char characterIntegerArrayTwo[] = {'8','4', '3', '5', '7','9','4' ,'3', '7', '5', '4', '3', '9', '8', '5', '7', '4', '3', '9', '8', '5', '7', '4', '3'};
	
	int characterIntegerArrayOneCount = sizeof(characterIntegerArrayOne)/sizeof(char);
	int characterIntegerArrayTwoCount = sizeof(characterIntegerArrayTwo)/sizeof(char);
	
	int numberOfCharacterArrays = 2;
	
	CharacterArray characterArrayOne = {.count = characterIntegerArrayOneCount, .array = characterIntegerArrayOne};
	CharacterArray characterArrayTwo = {.count = characterIntegerArrayTwoCount, .array = characterIntegerArrayTwo};
	
	CharacterArray characterSumArray = addIntegersRepresentedAsCharacterArrays(numberOfCharacterArrays, characterArrayOne, characterArrayTwo);
	
	printCharacterArray(characterArrayOne);
	printCharacterArray(characterArrayTwo);
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
