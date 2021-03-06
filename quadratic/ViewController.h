//
//  ViewController.h
//  quadratic
//
//  Created by Roman Gribkov on 23.09.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *ax;
@property (weak, nonatomic) IBOutlet UITextField *bx;
@property (weak, nonatomic) IBOutlet UITextField *c;
- (IBAction)calButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *D;
@property (weak, nonatomic) IBOutlet UILabel *X1;
@property (weak, nonatomic) IBOutlet UILabel *X2;
- (IBAction)clearButton:(id)sender;
@property (weak, nonatomic) IBOutlet GraphView *graphicView;
@property (weak, nonatomic) IBOutlet UILabel *x0Label;
@property (weak, nonatomic) IBOutlet UILabel *y0Label;

@end

