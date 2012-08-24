//
//  GIFretBoardGraphics.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/18/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GIFretBoardGraphics.h"

@implementation GIFretBoardGraphics

@synthesize lowEstring;
@synthesize aString;
@synthesize dString;
@synthesize gString;
@synthesize bString;
@synthesize higheString;

@synthesize testCircle;

@synthesize E3LowEDot;
@synthesize F3LowEDot;
@synthesize FSharp3LowEDot;
@synthesize G3LowEDot;
@synthesize GSharp3LowEDot;
@synthesize A3LowEDot;
@synthesize ASharp3LowEDot;
@synthesize B3LowEDot;
@synthesize C4LowEDot;
@synthesize CSharp4LowEDot;
@synthesize D4LowEDot;
@synthesize DSharp4LowEDot;
@synthesize E4LowEDot;

@synthesize setOfENoteCGPoints;

@synthesize fadeOut;
@synthesize popIn;

@synthesize inAndOut;
@synthesize eInAndOut;

@synthesize blocker;


//@synthesize dictionaryOfLowE;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        
        self.lowEstring = [CALayer layer];
        self.lowEstring.frame = CGRectMake(0, 425, 855, 5);
        self.lowEstring.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.lowEstring.shadowOffset = CGSizeMake(0, 2);
        self.lowEstring.shadowRadius = 1.5;
        self.lowEstring.shadowColor = [UIColor blackColor].CGColor;
        self.lowEstring.shadowOpacity = 0.7;
        
        self.aString = [CALayer layer];
        self.aString.frame = CGRectMake(0, 380, 855, 5);
        self.aString.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.aString.shadowOffset = CGSizeMake(0, 2);
        self.aString.shadowRadius = 1.5;
        self.aString.shadowColor = [UIColor blackColor].CGColor;
        self.aString.shadowOpacity = 0.6;
        
        self.dString = [CALayer layer];
        self.dString.frame = CGRectMake(0, 335, 855, 5);
        self.dString.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.dString.shadowOffset = CGSizeMake(0, 2);
        self.dString.shadowRadius = 1.5;
        self.dString.shadowColor = [UIColor blackColor].CGColor;
        self.dString.shadowOpacity = 0.6;
        
        self.gString = [CALayer layer];
        self.gString.frame = CGRectMake(0, 290, 855, 5);
        self.gString.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.gString.shadowOffset = CGSizeMake(0, 2);
        self.gString.shadowRadius = 1.5;
        self.gString.shadowColor = [UIColor blackColor].CGColor;
        self.gString.shadowOpacity = 0.6;
        
        self.bString = [CALayer layer];
        self.bString.frame = CGRectMake(0, 245, 855, 5);
        self.bString.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.bString.shadowOffset = CGSizeMake(0, 2);
        self.bString.shadowRadius = 1.5;
        self.bString.shadowColor = [UIColor blackColor].CGColor;
        self.bString.shadowOpacity = 0.6;
        
        self.higheString = [CALayer layer];
        self.higheString.frame = CGRectMake(0, 200, 855, 5);
        self.higheString.backgroundColor = [UIColor darkGrayColor].CGColor;
        self.higheString.shadowOffset = CGSizeMake(0, 2);
        self.higheString.shadowRadius = 1.5;
        self.higheString.shadowColor = [UIColor blackColor].CGColor;
        self.higheString.shadowOpacity = 0.6;
        
        
        
        
       // self.dictionaryOfLowE = [[NSDictionary alloc] init];
        
        
        
#pragma mark LOW_E_STRING
        
        self.testCircle = [CALayer layer];
        self.testCircle.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.testCircle setCornerRadius:16.0f];
        [self.testCircle setBounds:CGRectMake(0, 0, 32.0f, 32.0f)];
        self.testCircle.position = CGPointMake(23, 200);
        self.testCircle.shadowOffset = CGSizeMake(0, 2);
        self.testCircle.shadowRadius = 4.0;
        self.testCircle.shadowColor = [UIColor blackColor].CGColor;
        self.testCircle.shadowOpacity = 0.7;
        self.testCircle.opacity = 0.0;
        
        
        
        
        
        self.testCircle = [CALayer layer];
        self.testCircle.backgroundColor = [UIColor lightGrayColor].CGColor;
        [self.testCircle setCornerRadius:16.0f];
        [self.testCircle setBounds:CGRectMake(0, 0, 32.0f, 32.0f)];
        self.testCircle.position = CGPointMake(23, 200);
        self.testCircle.shadowOffset = CGSizeMake(0, 2);
        self.testCircle.shadowRadius = 4.0;
        self.testCircle.shadowColor = [UIColor blackColor].CGColor;
        self.testCircle.shadowOpacity = 0.7;
        self.testCircle.opacity = 0.0;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        self.popIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
        self.popIn.toValue = [NSNumber numberWithFloat:1];
        self.popIn.removedOnCompletion = YES;
        self.popIn.duration = .1;
        self.popIn.fillMode = kCAFillModeBoth;
        
        
        self.fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
        self.fadeOut.toValue = [NSNumber numberWithFloat:0.0];
        self.fadeOut.removedOnCompletion = NO;
        self.fadeOut.duration = 1;
        self.fadeOut.fillMode = kCAFillModeBoth;
        
        self.inAndOut = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        self.inAndOut.duration = 2.1;
        self.inAndOut.removedOnCompletion = NO;
        self.inAndOut.fillMode = kCAFillModeBoth;
        self.inAndOut.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.0], nil];
        self.inAndOut.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.1], [NSNumber numberWithFloat:1], nil];
        self.inAndOut.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], nil];
        
        self.eInAndOut = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        self.eInAndOut.duration = 2.1;
        self.eInAndOut.removedOnCompletion = NO;
        self.eInAndOut.fillMode = kCAFillModeBoth;
        self.eInAndOut.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.0], nil];
        self.eInAndOut.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.3], [NSNumber numberWithFloat:1], nil];
        self.eInAndOut.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], nil];
        
    /*    self.blocker = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        self.blocker.duration = 2;
//        self.eInAndOut.removedOnCompletion = 
        self.blocker.fillMode = kCAFillModeBoth;
        self.blocker.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:1], [NSNumber numberWithFloat:0.0], nil];
        self.blocker.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.9], [NSNumber numberWithFloat:1], nil];
        self.blocker.timingFunctions = [NSArray arrayWithObjects:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 
                                          [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], nil];*/
        
        
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
