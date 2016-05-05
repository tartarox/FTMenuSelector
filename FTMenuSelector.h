//
//  FTMenuSelector.h
//  FTMenuSelector
//
//  Created by Madeinweb on 2/4/15.
//  Copyright (c) 2015 MadeinWeb. All rights reserved.
//

#import <UIKit/UIKit.h>

#define menuPositionFromTop 0
#define menuPositionFromBottom 1
#define menuPositionFromLeft 2
#define menuPositionFromRight 3

@interface FTMenuSelector : UIView <UICollectionViewDataSource, UICollectionViewDelegate>

- (id)initFromPosition:(NSInteger)position andButtonImages:(NSArray*)imagesArray;
- (void)startAnimation;
- (void)finishAnimation;

@property(nonatomic, strong) UIView *roundSelectorView;

@end
