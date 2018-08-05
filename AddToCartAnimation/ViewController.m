//
//  ViewController.m
//  AddToCartAnimation
//
//  Created by Pratik Lad on 04/08/18.
//  Copyright © 2018 Pratik Lad. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"

@interface ViewController ()
@property (strong, nonatomic) UIImageView *tempImageView;
@end

@implementation ViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
    
    return cell;
}

- (IBAction)buttonHandlerAddToCart:(id)sender {
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];

    ProductCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
   CGPoint imagePoint =  [cell.imageViewProduct convertPoint:cell.imageViewProduct.bounds.origin toView:self.view];

    
    UIImage *image = cell.imageViewProduct.image;
    self.tempImageView = [[UIImageView alloc] initWithImage:image];
    
    self.tempImageView.frame = CGRectMake(imagePoint.x, imagePoint.y, cell.imageViewProduct.frame.size.width, cell.imageViewProduct.frame.size.height);
    
    [self animationOfView:self.tempImageView];
}

-(void)animationOfView:(UIImageView*)imageView{
    [self.view addSubview:imageView];
    
    [UIView animateWithDuration:1.0 animations:^{
        [self animationZoomForView:imageView withScaleX:1.5 withScaleY:1.5];
    } completion:^(BOOL finished) {
       
        [UIView animateWithDuration:0.5 animations:^{
            [self animationZoomForView:imageView withScaleX:0.2 withScaleY:0.2];
            [self animationRoted:imageView withAngle:M_PI ];
            imageView.frame = CGRectMake(self.imageViewCart.frame.origin.x, self.imageViewCart.frame.origin.y, 20, 20);
        } completion:^(BOOL finished) {
            [imageView removeFromSuperview];
        }];
    }];
}

-(void)animationZoomForView:(UIImageView*)animView withScaleX:(CGFloat)scaleX withScaleY:(CGFloat)scaleY{
    
    animView.transform = CGAffineTransformMakeScale(scaleX, scaleY);
}

-(void)animationRoted:(UIImageView*)animView withAngle:(CGFloat)angle{
    
    animView.transform = CGAffineTransformMakeRotation(angle);
}

@end
