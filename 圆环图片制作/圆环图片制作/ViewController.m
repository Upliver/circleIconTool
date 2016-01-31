//
//  ViewController.m
//  圆环图片制作
//
//  Created by upliver on 16/2/1.
//  Copyright © 2016年 Upriver. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+XL.h"

@interface ViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UIButton *circleBtn;

@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider.enabled = NO;
}

- (IBAction)buttonClick:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"切头像" message:@"Are you sure?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}


- (IBAction)valueChange:(UISlider *)sender {
    
    [self changeBorderWidth];
    
}

#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex NS_DEPRECATED_IOS(2_0, 9_0){
    
    if(buttonIndex == 1){
    
        /**
         *  调用该方法可以实现一键切图,并能根据实际的要求设置圆环图片的边框颜色和高度!
         */
        UIImage *image = [UIImage circleImageWithName:@"bj.jpg" borderWidth:1 borderColor:[UIColor greenColor]];
        
        self.iconView.image = image;
        
        self.slider.enabled = YES;
    }
    
}

- (void)changeBorderWidth
{
    /**
     *  调用该方法可以实现一键切图,并能根据实际的要求设置圆环图片的边框颜色和高度!
     */
    UIImage *image = [UIImage circleImageWithName:@"bj.jpg" borderWidth:self.slider.value * 30 borderColor:[UIColor greenColor]];
    
    self.iconView.image = image;
}

@end
