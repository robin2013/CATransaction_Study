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
    [CATransaction setDisableActions:_swich.on];
    CGColorRef redColor = [UIColor redColor].CGColor, blueColor = [UIColor blueColor].CGColor;
    layer.backgroundColor = (layer.backgroundColor == redColor) ? blueColor : redColor;
}
- (IBAction)btnpostionClick:(id)sender
{
    [CATransaction setDisableActions:_swich.on];
     layer.position = CGPointMake(layer.position.x +10, layer.position.y);
}
- (IBAction)btnBoundClick:(id)sender
{
    [CATransaction setDisableActions:YES];
    if (layer.bounds.size.width == layer.bounds.size.height)
        layer.bounds = CGRectMake(layer.bounds.origin.x, layer.bounds.origin.y, layer.bounds.size.width + 100, layer.bounds.size.height);
    else
        layer.bounds = CGRectMake(layer.bounds.origin.x, layer.bounds.origin.y, layer.bounds.size.width - 100, layer.bounds.size.height);
}
- (IBAction)btnOpacityClick:(id)sender
{
    [CATransaction setDisableActions:_swich.on];
    layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;
}


@end
