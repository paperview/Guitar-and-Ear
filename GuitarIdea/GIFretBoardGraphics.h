//
//  GIFretBoardGraphics.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/18/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GIFretBoardGraphics : UIView

@property (nonatomic, strong) CALayer *lowEstring;
@property (nonatomic, strong) CALayer *aString;
@property (nonatomic, strong) CALayer *dString;
@property (nonatomic, strong) CALayer *gString;
@property (nonatomic, strong) CALayer *bString;
@property (nonatomic, strong) CALayer *higheString;

@property (nonatomic, strong) CALayer *testCircle;

@property (nonatomic, assign) CGPoint E3LowEDot;
@property (nonatomic, assign) CGPoint F3LowEDot;
@property (nonatomic, assign) CGPoint FSharp3LowEDot;
@property (nonatomic, assign) CGPoint G3LowEDot;
@property (nonatomic, assign) CGPoint GSharp3LowEDot;
@property (nonatomic, assign) CGPoint A3LowEDot;
@property (nonatomic, assign) CGPoint ASharp3LowEDot;
@property (nonatomic, assign) CGPoint B3LowEDot;
@property (nonatomic, assign) CGPoint C4LowEDot;
@property (nonatomic, assign) CGPoint CSharp4LowEDot;
@property (nonatomic, assign) CGPoint D4LowEDot;
@property (nonatomic, assign) CGPoint DSharp4LowEDot;
@property (nonatomic, assign) CGPoint E4LowEDot;

@property (nonatomic, strong) NSSet *setOfENoteCGPoints;

@property (nonatomic, strong) CABasicAnimation *popIn;
@property (nonatomic, strong) CABasicAnimation *fadeOut;

@property (nonatomic, strong) CAKeyframeAnimation *inAndOut;
@property (nonatomic, strong) CAKeyframeAnimation *eInAndOut;
@property (nonatomic, strong) CAKeyframeAnimation *blocker;



//@property (nonatomic, strong) NSDictionary *dictionaryOfLowE;

@end
