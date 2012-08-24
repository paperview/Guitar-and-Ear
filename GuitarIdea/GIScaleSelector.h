//
//  GIScaleSelector.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GIScaleConstants.h"

@interface GIScaleSelector : NSObject


@property (nonatomic, strong) NSArray *ionianScale;
@property (nonatomic, strong) NSArray *dorianScale;
@property (nonatomic, strong) NSArray *phrygianScale;
@property (nonatomic, strong) NSArray *lydianScale;
@property (nonatomic, strong) NSArray *mixolydianScale;
@property (nonatomic, strong) NSArray *aeolianScale;
@property (nonatomic, strong) NSArray *locrianScale;
@property (nonatomic, strong) NSArray *majMajModalArray;
@property (nonatomic, strong) NSArray *majMinModalArray;
@property (nonatomic, strong) NSArray *minMinModalArray;


@end
