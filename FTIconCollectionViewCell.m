//
//  FTIconCollectionViewCell.m
//  FTMenuSelector
//
//  Created by Madeinweb on 2/4/15.
//  Copyright (c) 2015 MadeinWeb. All rights reserved.
//

#import "FTIconCollectionViewCell.h"

@implementation FTIconCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setNeedsDisplay];
    if (self) {
        
        [self addSubviews];
    }
    return self;
}

- (void) addSubviews {

    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(7, 7, 26, 26)];
    [self addSubview:_iconImageView];
}

@end
