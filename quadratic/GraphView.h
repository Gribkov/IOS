//
//  GraphView.h
//  quadratic
//
//  Created by Roman Gribkov on 18.10.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

-(void)drawInContext:(CGContextRef)context;
@property double x0;
@property double y0;
@property double a;
@property double b;
@property double c;
@property double x1;
@property double x2;

@end
