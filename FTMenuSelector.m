//
//  FTMenuSelector.m
//  FTMenuSelector
//
//  Created by Madeinweb on 2/4/15.
//  Copyright (c) 2015 MadeinWeb. All rights reserved.
//

#import "FTMenuSelector.h"
#import "FTIconCollectionViewCell.h"

@interface FTMenuSelector (){

}

@property (nonatomic, assign) NSInteger currentPosition;
@property (nonatomic, strong) NSArray* imagesArray;

@end

@implementation FTMenuSelector

- (id)initFromPosition:(NSInteger)position andButtonImages:(NSArray*)imagesArray {
    _currentPosition = position;
    _imagesArray = imagesArray;
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGRect rect;
    
    switch (position) {
        case menuPositionFromTop:
            self = [super initWithFrame:CGRectMake(0, -40, mainScreen.bounds.size.width, 40)];
            rect = CGRectMake((mainScreen.bounds.size.width - (imagesArray.count * 40)) / 2, 0, imagesArray.count * 40, self.frame.size.height);
            break;
            
        case menuPositionFromBottom:
            self = [super initWithFrame:CGRectMake(0, mainScreen.bounds.size.height, mainScreen.bounds.size.width, 40)];
            rect = CGRectMake((mainScreen.bounds.size.width - (imagesArray.count * 40)) / 2, 0, imagesArray.count * 40, self.frame.size.height);
            break;
            
        case menuPositionFromLeft:
            self = [super initWithFrame:CGRectMake(-40 , 0, 40, mainScreen.bounds.size.height)];
            rect = CGRectMake(0, (mainScreen.bounds.size.height - (imagesArray.count * 40)) / 2, self.frame.size.width, imagesArray.count * 40);
            break;
            
        case menuPositionFromRight:
            self = [super initWithFrame:CGRectMake(mainScreen.bounds.size.width, 0, 40, mainScreen.bounds.size.height)];
            rect = CGRectMake(0, (mainScreen.bounds.size.height - (imagesArray.count * 40)) / 2, self.frame.size.width, imagesArray.count * 40);
            break;
    }
    
    _roundSelectorView = [[UIView alloc]initWithFrame:CGRectMake((mainScreen.bounds.size.width - (imagesArray.count * 40)) / 2, 1, 38, 38)];
    _roundSelectorView.hidden = NO;
    _roundSelectorView.backgroundColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:1 alpha:1];
    _roundSelectorView.layer.cornerRadius = 19;
    [self addSubview:_roundSelectorView];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerClass:[FTIconCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self addSubview:collectionView];
    
    [self startAnimation];
    
    return self;
}

#pragma mark - Class Methods

#pragma mark - UICollection Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imagesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FTIconCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.iconImageView.image = [_imagesArray[indexPath.row] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    cell.iconImageView.tintColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:1 alpha:1];
    
    if(indexPath.row == 0) {
        cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.iconImageView.tintColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells =  [collectionView visibleCells];
    __block NSInteger counter = 0;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        for (FTIconCollectionViewCell *cell in cells) {
            
            cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
            cell.iconImageView.tintColor = [UIColor colorWithRed:0 green:122.0/255.0 blue:1 alpha:1];
            cell.backgroundColor = [UIColor clearColor];
            
            if (indexPath.row == counter)
            {
                cell.iconImageView.image = [cell.iconImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
                cell.iconImageView.tintColor = [UIColor whiteColor];
                
                UIScreen *mainScreen = [UIScreen mainScreen];
                
                if(indexPath.row != 0) {
                    
                    _roundSelectorView.frame = CGRectMake((1 + (mainScreen.bounds.size.width - ((4 - (indexPath.row * 2)) * 40)) / 2), 1, 38, 38);
                    
                }else {
                    
                    _roundSelectorView.frame = CGRectMake((mainScreen.bounds.size.width - ((4 - (indexPath.row * 2)) * 40)) / 2, 1, 38, 38);
                }
            }
            counter++;
        }
    }];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(40, 40);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - Animation

- (void)startAnimation {
    UIScreen *mainScreen = [UIScreen mainScreen];
    
    [UIView animateWithDuration:0.6 animations:^{
        switch (_currentPosition) {
            case menuPositionFromTop:
                self.frame = CGRectMake(0, 0, mainScreen.bounds.size.width, 40);
                break;
                
            case menuPositionFromBottom:
                self.frame = CGRectMake(0, mainScreen.bounds.size.height - 40, mainScreen.bounds.size.width, 40);
                break;
                
            case menuPositionFromLeft:
                self.frame = CGRectMake(0, 0, 40, mainScreen.bounds.size.height);
                break;
                
            case menuPositionFromRight:
                self.frame = CGRectMake(mainScreen.bounds.size.width - 40, 0, 40, mainScreen.bounds.size.height);
                break;
        }
    }];
}

- (void)finishAnimation {
    UIScreen *mainScreen = [UIScreen mainScreen];
    
    [UIView animateWithDuration:0.6 animations:^{
        switch (_currentPosition) {
            case menuPositionFromTop:
                self.frame = CGRectMake(0, -40, mainScreen.bounds.size.width, 40);
                break;
                
            case menuPositionFromBottom:
                self.frame = CGRectMake(0, mainScreen.bounds.size.height, mainScreen.bounds.size.width, 40);
                break;
                
            case menuPositionFromLeft:
                self.frame = CGRectMake(-40 , 0, 40, mainScreen.bounds.size.height);
                break;
                
            case menuPositionFromRight:
                self.frame = CGRectMake(mainScreen.bounds.size.width, 0, 40, mainScreen.bounds.size.height);
                break;
        }
    }];
}

@end
