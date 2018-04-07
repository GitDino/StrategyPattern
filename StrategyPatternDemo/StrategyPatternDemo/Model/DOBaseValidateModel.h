//
//  DOBaseValidateModel.h
//  StrategyPatternDemo
//
//  Created by 魏欣宇 on 2018/4/7.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DOBaseValidateModel : NSObject

@property (nonatomic, copy) NSString *attribute_result;

/**
 验证输入方法（抽象方法）
 */
- (BOOL)validateWithInputTextField:(UITextField *) input_textField;

@end
