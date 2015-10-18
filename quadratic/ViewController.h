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
@property (strong, nonatomic) GraphView *graphView;

@end

