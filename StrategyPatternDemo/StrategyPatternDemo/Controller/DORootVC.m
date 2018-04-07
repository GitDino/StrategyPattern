//
//  DORootVC.m
//  StrategyPatternDemo
//
//  Created by 魏欣宇 on 2018/4/7.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DORootVC.h"

#import "DOCustomTextField.h"

#import "DOLetterValidateModel.h"
#import "DONumberValidateModel.h"

@interface DORootVC ()<UITextFieldDelegate>

/**
 字母输入框
 */
@property (nonatomic, strong) DOCustomTextField *letter_textField;

/**
 数字输入框
 */
@property (nonatomic, strong) DOCustomTextField *number_textField;

/**
 验证按钮
 */
@property (nonatomic, strong) UIButton *validate_btn;

@end

@implementation DORootVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"策略模式";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    self.letter_textField.delegate = self;
    self.letter_textField.validate_model = [[DOLetterValidateModel alloc] init];
    [self.view addSubview:self.letter_textField];
    
    self.number_textField.delegate = self;
    self.number_textField.validate_model = [[DONumberValidateModel alloc] init];
    [self.view addSubview:self.number_textField];
    
    [self.view addSubview:self.validate_btn];
    [self.validate_btn addTarget:self action:@selector(clickValidateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - UITextFieldDelegate代理方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isKindOfClass:[DOCustomTextField class]])
    {
        [(DOCustomTextField *)textField validate];
    }
    
    
    UIAlertController *alert_controller = [UIAlertController alertControllerWithTitle:@"提示" message:[[(DOCustomTextField *)textField validate_model] attribute_result] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok_action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert_controller addAction:ok_action];
    [self presentViewController:alert_controller animated:YES completion:nil];
}

#pragma mark - Event Cycle
- (void)clickValidateBtnAction:(UIButton *) validate_btn
{
    [self.view endEditing:YES];
}

#pragma mark - Getter Cycle
- (DOCustomTextField *)letter_textField
{
    if (!_letter_textField)
    {
        _letter_textField = [[DOCustomTextField alloc] initWithFrame:CGRectMake(20, 80, SCREEN_WIDTH - 40, 35)];
        _letter_textField.borderStyle = UITextBorderStyleRoundedRect;
        _letter_textField.placeholder = @"请输入字母：";
    }
    return _letter_textField;
}

- (DOCustomTextField *)number_textField
{
    if (!_number_textField)
    {
        _number_textField = [[DOCustomTextField alloc] initWithFrame:CGRectMake(20, 130, SCREEN_WIDTH - 40, 35)];
        _number_textField.borderStyle = UITextBorderStyleRoundedRect;
        _number_textField.placeholder = @"请输入数字：";
    }
    return _number_textField;
}

- (UIButton *)validate_btn
{
    if (!_validate_btn)
    {
        _validate_btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 190, SCREEN_WIDTH - 40, 44)];
        [_validate_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_validate_btn setTitle:@"验 证" forState:UIControlStateNormal];
    }
    return _validate_btn;
}

@end
