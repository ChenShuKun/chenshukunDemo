//
//  ViewController.m
//  codeForIcon
//
//  Created by ChenShuKun on 15/3/30.
//  Copyright (c) 2015年 ChenShuKun. All rights reserved.
//

#import "ViewController.h"
#import "NSString+FontAwesome.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSUInteger i = 0; i < 5; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        // star.backgroundColor   =  [UIColor redColor];
        
        button.frame = CGRectMake(60 +(i *40) , 200, 40, 40);
        
        button.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:35];
        button.titleLabel.shadowOffset = CGSizeMake(0, -1);
        
        [button setTitle:[NSString fontAwesomeIconStringForEnum:FAIconGlass] forState:UIControlStateNormal];
        
        [button setTitle:[NSString fontAwesomeIconStringForEnum:FAIconMusic] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:button];
        
    }

    
}

- (void)buttonAction:(UIButton *)button {
    button.selected = !button.selected ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
