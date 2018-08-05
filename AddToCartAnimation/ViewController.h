//
//  ViewController.h
//  AddToCartAnimation
//
//  Created by Pratik Lad on 04/08/18.
//  Copyright © 2018 Pratik Lad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewCart;
@property (weak, nonatomic) IBOutlet UILabel *labelNoOfCount;

@end

