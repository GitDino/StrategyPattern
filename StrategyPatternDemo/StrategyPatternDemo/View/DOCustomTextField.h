//
//  DOCustomTextField.h
//  StrategyPatternDemo
//
//  Created by 魏欣宇 on 2018/4/7.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOBaseValidateModel;

@interface DOCustomTextField : UITextField

@property (nonatomic, strong) DOBaseValidateModel *validate_model;

- (BOOL)validate;

@end
