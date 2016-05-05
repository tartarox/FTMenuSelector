//
//  ViewController.m
//  FTMenuSelector
//
//  Created by Madeinweb on 2/4/15.
//  Copyright (c) 2015 MadeinWeb. All rights reserved.
//

#import "ViewController.h"
#import "FTMenuSelector.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imagesArray = @[[UIImage imageNamed:@"diploma-hat-black"],
                             [UIImage imageNamed:@"brain-black"],
                             [UIImage imageNamed:@"books2-black"],
                             //[UIImage imageNamed:@"books3-black"],
                             [UIImage imageNamed:@"comment-ellipsis-black"]];
    
    FTMenuSelector *menuSelector = [[FTMenuSelector alloc]initFromPosition:menuPositionFromBottom andButtonImages:imagesArray];
    [self.view addSubview:menuSelector];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
