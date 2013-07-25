//
//  ViewController.m
//  CATransaction_Study
//
//  Created by Robin on 13-7-24.
//  Copyright (c) 2013年 Robin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    float corner;
}
@end

@implementation ViewController
- (void)dealloc
{
    [_btnColorClick release];
    [_swich release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    layer = [CALayer layer];
    [layer setFrame:CGRectMake(100, 100, 120, 230)];
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.borderColor = [UIColor blackColor].CGColor;
    layer.opacity = 1.0f;
    [self.view.layer addSublayer:layer];
    
    _swich.on = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCornerClick:(id)sender {
    [CATransaction setDisableActions:_swich.on];
    corner +=10;
    layer.cornerRadius = corner;

}


- (IBAction)btnColorClick:(id)sender
{
    //[CATransaction setDisableActions:_swich.on];
    [CATransaction begin];
    [CATransaction setValue:(_swich.on?(id)kCFBooleanTrue:(id)kCFBooleanFalse) forKey:kCATransactionDisableActions];
    [self setLayerBC];
       [CATransaction commit];
    
    
}
- (IBAction)btnpostionClick:(id)sender
{
    [CATransaction setValue:[NSNumber numberWithFloat:10.0f]
                     forKey:kCATransactionAnimationDuration];//设定隐式事务处理时间
    [CATransaction setDisableActions:_swich.on];//是否禁用事务动画
    [self setLayerPosition];
}
- (IBAction)btnBoundClick:(id)sender
{
    //隐式事务
    [CATransaction setDisableActions:_swich.on];
    [self setLayerBound];
}
- (IBAction)btnOpacityClick:(id)sender
{
    //显示事务
    [CATransaction begin];
     [CATransaction setValue:(_swich.on?(id)kCFBooleanTrue:(id)kCFBooleanFalse) forKey:kCATransactionDisableActions];
    [self setLayerOpcity];
    [CATransaction commit];
    
}
//事务嵌套
- (IBAction)btnMixClick:(id)sender {
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:2.0f]
                     forKey:kCATransactionAnimationDuration];//设定隐式事务处理时间
    [self setLayerBound];
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:4.0f]
                     forKey:kCATransactionAnimationDuration];//设定隐式事务处理时间
    [self setLayerBC];
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:6.0f]
                     forKey:kCATransactionAnimationDuration];//设定隐式事务处理时间
    [self setLayerPosition];
    [CATransaction commit];
    [CATransaction commit];
    [CATransaction commit];
}

- (IBAction)btnUseLessClick:(id)sender {
    //显式事务无法在控件中应用,事务直接在runloop中提交了,所以看不到动画
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:4.0f]
                     forKey:kCATransactionAnimationDuration];//设定隐式事务处理时间
    if (_swich.layer.position.x == 80) {
          _swich.layer.position = CGPointMake(40,300);
    }
    else
    {
    _swich.layer.position = CGPointMake(80, 80);
    }
    [CATransaction commit];
}
- (void)setLayerBC
{
    CGColorRef redColor = [UIColor redColor].CGColor, blueColor = [UIColor blueColor].CGColor;
    layer.backgroundColor = (layer.backgroundColor == redColor) ? blueColor : redColor;
}
- (void)setLayerOpcity
{
    layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;
}
- (void)setLayerBound
{
    if (layer.bounds.size.width == layer.bounds.size.height)
    layer.bounds = CGRectMake(layer.bounds.origin.x, layer.bounds.origin.y, layer.bounds.size.width + 100, layer.bounds.size.height);
    else
        layer.bounds = CGRectMake(layer.bounds.origin.x, layer.bounds.origin.y, layer.bounds.size.width - 100, layer.bounds.size.height);
}

- (void)setLayerPosition
{
     layer.position = CGPointMake(layer.position.x +50, layer.position.y);
}
@end
