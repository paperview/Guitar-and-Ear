//
//  GIChordLibrary.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIChordLibrary.h"
#import "GIScaleConstants.h"

@implementation GIChordLibrary

@synthesize aMajor;
@synthesize aMinor;

@synthesize majorTriad;
@synthesize minorTriad;
@synthesize augmentedMajorTriad;
@synthesize augmentedMinorTriad;
@synthesize diminishedTriad;
@synthesize majorSeventh;
@synthesize minorSeventh;
@synthesize halfDiminishedSeventh;

- (id)init {

if (self = [super init]) {

    self.majorTriad = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], nil];

    self.minorTriad = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], nil];
    
    self.diminishedTriad = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:tritoneIntervalFromRoot], nil];

    self.augmentedMajorTriad = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
    
    self.augmentedMajorTriad = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:tritoneIntervalFromRoot], nil];
    
    self.majorSeventh = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:major7thIntervalFromRoot], nil];
    
    self.minorSeventh = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], nil];
    
    self.halfDiminishedSeventh = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:tritoneIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], nil];
    

}

return self;

}


@end
