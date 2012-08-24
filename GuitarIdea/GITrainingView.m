//
//  GITrainingView.m
//  GuitarIdea
//
//  Created by Phillip Pape on 6/29/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import "GITrainingView.h"

#define degreesToRadian(x) (M_PI * (x) / 180.0)

@implementation GITrainingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformMakeRotation(degreesToRadian(90));
        self.bounds = CGRectMake(0.0, 0.0, 480, 320);
        
        self.backgroundColor = [UIColor orangeColor];

        
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
