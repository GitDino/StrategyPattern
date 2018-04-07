//
//  DOLetterValidateModel.m
//  StrategyPatternDemo
//
//  Created by 魏欣宇 on 2018/4/7.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOLetterValidateModel.h"

@implementation DOLetterValidateModel

- (BOOL)validateWithInputTextField:(UITextField *) input_textField
{
    if (input_textField.text.length == 0)
    {
        self.attribute_result = @"输入不能为空";
        return nil;
    }
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    
    NSUInteger matches_result = [regex numberOfMatchesInString:input_textField.text options:NSMatchingAnchored range:NSMakeRange(0, input_textField.text.length)];
    
    switch (matches_result) {
        case 0://不全是字母
            self.attribute_result = @"输入有误，请检查输入";
            break;
            
        default://全是字母
            self.attribute_result = @"输入正确，全是字母";
            break;
    }
    
    return self.attribute_result == nil ? YES : NO;
}

@end
