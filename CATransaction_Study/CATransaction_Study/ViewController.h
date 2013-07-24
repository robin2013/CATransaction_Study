//
//  ViewController.h
//  CATransaction_Study
//
//  Created by Robin on 13-7-24.
//  Copyright (c) 2013年 Robin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController : UIViewController
{
    CALayer *layer;
}
@property (retain, nonatomic) IBOutlet UIButton *btnColorClick;
- (IBAction)btnCornerClick:(id)sender;
- (IBAction)btnColorClick:(id)sender;
- (IBAction)btnpostionClick:(id)sender;
- (IBAction)btnBoundClick:(id)sender;
- (IBAction)btnOpacityClick:(id)sender;

@property (retain, nonatomic) IBOutlet UISwitch *swich;







@end
