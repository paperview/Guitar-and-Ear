//
//  GIScaleSelector.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIScaleSelector.h"

@implementation GIScaleSelector

@synthesize ionianScale;
@synthesize dorianScale;
@synthesize phrygianScale;
@synthesize lydianScale;
@synthesize mixolydianScale;
@synthesize aeolianScale;
@synthesize locrianScale;
@synthesize majMajModalArray;
@synthesize majMinModalArray;
@synthesize minMinModalArray;

-(id)init{
    
    
    if (self = [super init]) {
        
        self.ionianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:major7thIntervalFromRoot], [NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:major6thIntervalFromRoot], nil];
        
        self.dorianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], [NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:major6thIntervalFromRoot], nil];
        
        self.phrygianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], [NSNumber numberWithInt:minor2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
        
        self.lydianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:major7thIntervalFromRoot], [NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:tritoneIntervalFromRoot], [NSNumber numberWithInt:major6thIntervalFromRoot], nil];
        
        self.mixolydianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], [NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:major6thIntervalFromRoot], nil];
        
        self.aeolianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:perfect5thIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], [NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
        
        self.locrianScale = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor3rdIntervalFromRoot], [NSNumber numberWithInt:tritoneIntervalFromRoot], [NSNumber numberWithInt:minor7thIntervalFromRoot], [NSNumber numberWithInt:minor2ndIntervalFromRoot], [NSNumber numberWithInt:perfect4thIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
        
        self.minMinModalArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:minor2ndIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
        self.majMajModalArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:major6thIntervalFromRoot], nil];
        self.majMinModalArray = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:major2ndIntervalFromRoot], [NSNumber numberWithInt:minor6thIntervalFromRoot], nil];
        
    }
    return self;
}


@end
