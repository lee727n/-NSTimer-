//
//  RegisterVC.m
//  register
//
//  Created by 刘梓轩 on 2017/6/15.
//  Copyright © 2017年 MIKEz. All rights reserved.
//

#import "RegisterVC.h"
#define kSendVerifyCode             @"发送验证码"
#define kResendVerifyCode(sec)      [NSString stringWithFormat:@"重新发送(%ds)", sec]
#define kColor(color)               [UIColor color]
#define kCGColor(color)             [UIColor color].CGColor

@interface RegisterVC ()
{
int secondsCountDown; //倒计时总时长
NSTimer *countDownTimer;
UILabel *labelText;
}
@property (nonatomic)UIButton *button;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.164 green:0.657 blue:0.915 alpha:1.000]];
    //设置倒计时总时长
    secondsCountDown = 60;//60秒倒计时

    
}
- (IBAction)verifyBtn:(UIButton *)sender {
    UIButton *button = (UIButton *)sender;
    //开始倒计时
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES]; //启动倒计时后会每秒钟调用一次方法 timeFireMethod
    self.button = button;
    //设置倒计时显示的时间
   button.titleLabel.text =[NSString stringWithFormat:@"%d",secondsCountDown];
    
    
}

-(void)timeFireMethod{
    //倒计时-1
    secondsCountDown--;
    //修改倒计时标签现实内容
    self.button.titleLabel.text=[NSString stringWithFormat:@"%d",secondsCountDown];
    if(secondsCountDown == 0){
        
        [countDownTimer invalidate];
        [labelText removeFromSuperview];
       
    }
    //当倒计时到0时，做需要的操作，比如验证码过期不能提交
    if(secondsCountDown==0){
        [countDownTimer invalidate];
        self.button.titleLabel.text = @"发送验证码";
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
