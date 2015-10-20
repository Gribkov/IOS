//
//  ViewController.m
//  quadratic
//
//  Created by Roman Gribkov on 23.09.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.ax setText:@"0"];
    [self.bx setText:@"0"];
    [self.c setText:@"0"];
    [self.D setText:@"D"];
    [self.X1 setText:@"X1"];
    [self.X2 setText:@"X2"];
    CGRect rect = CGRectMake(10, 10, 100, 100);
    self.graphView = [[GraphView alloc] initWithFrame: rect];
    [self.graphView setBackgroundColor: [UIColor blackColor]];
    [self.graphView drawRect:rect];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calButton:(id)sender {
    
    //Close keyboard
    if ([self.ax isFirstResponder]) {
        [self.ax resignFirstResponder];
    }
    if ([self.bx isFirstResponder]) {
        [self.bx resignFirstResponder];
    }
    if ([self.c isFirstResponder]) {
        [self.c resignFirstResponder];
    }
    double abc; // Variable for count D, x1 and x2
    abc = ([self.bx.text doubleValue]*[self.bx.text doubleValue])- 4*[self.ax.text doubleValue]*[self.c.text doubleValue];
    self.D.text = [NSString stringWithFormat:@"%f",abc]; // Cound D
    if ([self.D.text doubleValue] == 0) {
        abc = -([self.bx.text doubleValue]/(2*[self.ax.text doubleValue]));
        self.X1.text = [NSString stringWithFormat:@"%f",abc];
        [self.X2 setText: self.X1.text];
    }
    if ([self.D.text doubleValue] < 0) {
        [self.X1 setText:@"0"];
        [self.X2 setText:@"0"];
    }
    if ([self.D.text doubleValue] > 0) {
        abc = (-[self.bx.text doubleValue]+sqrt(([self.bx.text doubleValue]*[self.bx.text doubleValue])- 4*[self.ax.text doubleValue]*[self.c.text doubleValue]))/(2*[self.ax.text doubleValue]); //Count X1
        self.X1.text = [NSString stringWithFormat:@"%f", abc];
        abc = (-[self.bx.text doubleValue]-sqrt(([self.bx.text doubleValue]*[self.bx.text doubleValue])- 4*[self.ax.text doubleValue]*[self.c.text doubleValue]))/(2*[self.ax.text doubleValue]); //Count X2
        self.X2.text = [NSString stringWithFormat:@"%f",abc];
        
    }
//    [self.graphView drawInContext: self.graphView.context];
    
    
}
- (IBAction)clearButton:(id)sender {
    //Clean input form
    [self.ax setText:@""];
    [self.bx setText:@""];
    [self.c setText:@""];
    [self.D setText:@"D"];
    [self.X1 setText:@"X1"];
    [self.X2 setText:@"X2"];
    // Close keyboard
    if ([self.ax isFirstResponder]) {
        [self.ax resignFirstResponder];
    }
    if ([self.bx isFirstResponder]) {
        [self.bx resignFirstResponder];
    }
    if ([self.c isFirstResponder]) {
        [self.c resignFirstResponder];
    }
}
@end
