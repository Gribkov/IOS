//
//  GraphView.m
//  quadratic
//
//  Created by Roman Gribkov on 18.10.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView


-(void)drawInContext:(CGContextRef)context
{
    // Drawing lines with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);
    
    // Draw a single line from left to right
    CGContextMoveToPoint(context, 10.0, 30.0);
    CGContextAddLineToPoint(context, 310.0, 30.0);
    CGContextStrokePath(context);
}

-(void)drawRect:(CGRect)rect
{
   [self drawInContext: UIGraphicsGetCurrentContext()];
}


@end
