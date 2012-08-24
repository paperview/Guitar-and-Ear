//
//  GIChordLibrary.h
//  GuitarIdea
//
//  Created by Phillip Pape on 6/12/12.
//  Copyright (c) 2012 Southern Illinois University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GIChordLibrary : NSObject

@property (nonatomic, strong) NSDictionary *aMinor;
@property (nonatomic, strong) NSDictionary *aMajor;

@property (nonatomic, strong) NSArray *majorTriad;
@property (nonatomic, strong) NSArray *minorTriad;
@property (nonatomic, strong) NSArray *augmentedMajorTriad;
@property (nonatomic, strong) NSArray *augmentedMinorTriad;
@property (nonatomic, strong) NSArray *diminishedTriad;
@property (nonatomic, strong) NSArray *majorSeventh;
@property (nonatomic, strong) NSArray *minorSeventh;
@property (nonatomic, strong) NSArray *halfDiminishedSeventh;

@end
