//
//  ProductCell.h
//  AddToCartAnimation
//
//  Created by Pratik Lad on 04/08/18.
//  Copyright © 2018 Pratik Lad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddToCart;

@end
