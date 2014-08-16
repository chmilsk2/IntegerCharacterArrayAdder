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

	char characterIntegerArrayOne[] = {'1', '0'};
	char characterIntegerArrayTwo[] = {'1', '0'};
	
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
