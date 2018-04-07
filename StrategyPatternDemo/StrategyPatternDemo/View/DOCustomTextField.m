//
//  DOCustomTextField.m
//  StrategyPatternDemo
//
//  Created by 魏欣宇 on 2018/4/7.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCustomTextField.h"
#import "DOBaseValidateModel.h"

@implementation DOCustomTextField

- (BOOL)validate
{
    if (![self.validate_model validateWithInputTextField:self])
    {
        NSLog(@"%@", self.validate_model.attribute_result);
    }
    return self;
}

@end
