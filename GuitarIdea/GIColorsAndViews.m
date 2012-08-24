//
//  GIColorsAndViews.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/16/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIColorsAndViews.h"

@implementation GIColorsAndViews

@synthesize rootCircle;
@synthesize minor2ndCircle;
@synthesize major2ndCircle;
@synthesize minor3rdCircle;
@synthesize major3rdCircle;
@synthesize perfect4thCircle;
@synthesize tritoneCircle;
@synthesize perfect5thCircle;
@synthesize minor6thCircle;
@synthesize major6thCircle;
@synthesize minor7thCircle;
@synthesize major7thCircle;

@synthesize major2ndColor;
@synthesize major3rdColor;
@synthesize major6thColor;
@synthesize major7thColor;
@synthesize minor2ndColor;
@synthesize minor3rdColor;
@synthesize minor6thColor;
@synthesize minor7thColor;
@synthesize rootColor = _rootColor;
@synthesize perfect4thColor;
@synthesize perfect5thColor;
@synthesize tritoneColor;



-(id)init{
    
    if (self = [super init]) {
        
        self.rootColor = [[UIColor alloc] initWithRed:1.0 green:0.2 blue:0.1 alpha:0.8];
        self.minor2ndColor = [[UIColor alloc] initWithRed:0.8 green:0.4 blue:0.05 alpha:0.8];
        self.major2ndColor = [[UIColor alloc] initWithRed:0.6 green:0.6 blue:0.05 alpha:0.8];
        
        
        
        
        
    }
    
    return self;
}

-(UIColor *)rootColor{
    
    _rootColor = self.rootColor = [[UIColor alloc] initWithRed:1.0 green:0.2 blue:0.1 alpha:0.8];
    return _rootColor;
    
}

@end
