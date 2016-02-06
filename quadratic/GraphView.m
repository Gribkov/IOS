//
//  GraphView.m
//  quadratic
//
//  Created by Roman Gribkov on 18.10.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import "GraphView.h"


@implementation GraphView


-(void)drawInContext:(CGContextRef) context
{
    // Draw x and y
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGPoint osiPoints[12] = {CGPointMake(10, 120), CGPointMake(230, 120),
        CGPointMake(120, 10), CGPointMake(120, 230),
        CGPointMake(230, 120), CGPointMake(225, 118),
        CGPointMake(230, 120), CGPointMake(225, 122),
        CGPointMake(120, 10), CGPointMake(118, 15),
        CGPointMake(120, 10), CGPointMake(122, 15)};
    CGContextStrokeLineSegments(context, osiPoints, 12);
    
    // Count scale
    int totalElements = 1000;
    int stopElement = 1000;
    double k = 1;
    double xStart = 0;
    double xFinish = 0;
    
    if (0 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 1) k = 100;
    if (1 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 10) k = 10;
    if (10 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 100) k = 1;
    if (100 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 1000) k = 0.1;
    if (1000 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 10000) k = 0.01;
    
    // определяю стартовый и финишный x
    if (self.x1 < self.x2)
        {
            xStart = self.x1;
            xFinish = self.x2;
        }
    else {
        xStart = self.x2;
        xFinish = self.x1;
    }
    xStart--;
    xFinish++;
    
    CGPoint xyPoints[totalElements];
    for (int i = 0; i <= totalElements; i++)
    {
        xyPoints[i] = CGPointMake(120, 120);
    }
    

    
    if (self.a != 0 || self.b !=0 || self.c != 0) {
        double j = (totalElements/4)*(-1)/k;
        if (self.x1 != 0 || self.x2 != 0) j = xStart;
        for (int i = 0; j < xFinish; i) {
            xyPoints[i] = CGPointMake(j*k+120, k*((self.a*(j*j)+self.b*j+self.c)*(-1))+120);
            i++;
            j = j+1/k;
            xyPoints[i] = CGPointMake(j*k+120, k*((self.a*(j*j)+self.b*j+self.c)*(-1))+120);
            i++;
            stopElement = i;
        }
    CGContextStrokeLineSegments(context, xyPoints, stopElement);
    }
    // Draw marker to х1
    CGContextSetRGBStrokeColor(context, 255, 0, 0, 1);
    CGPoint markersPointsX1[4] = {CGPointMake(3, 3), CGPointMake(23, 3),
        CGPointMake(13, 3), CGPointMake(self.x1*k+120, 120)};
    CGContextStrokeLineSegments(context, markersPointsX1, 4);
    
    // Draw marker to х2
    CGContextSetRGBStrokeColor(context, 0, 255, 0, 1);
    CGPoint markersPointsX2[4] = {CGPointMake(237, 3), CGPointMake(217, 3),
        CGPointMake(227, 3), CGPointMake(self.x2*k+120, 120)};
    CGContextStrokeLineSegments(context, markersPointsX2, 4);
    
    // Draw marker to х0 и y0
    CGContextSetRGBStrokeColor(context, 255, 0, 255, 1);
    CGPoint markersPointsX0Y0[4] = {CGPointMake(100, 237), CGPointMake(140, 237),
        CGPointMake(120, 237), CGPointMake(self.x0*k+120, self.y0*k*(-1)+120)};
    CGContextStrokeLineSegments(context, markersPointsX0Y0, 4);
    
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect); // clear context !!!!
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, CGRectMake(1, 1, 238, 238));
    
    CGContextScaleCTM(context,1,-1); //переворачиваю ось игрек что бы текст выводился нормально
    ////////////////////////////////
    CGContextScaleCTM(context,1,-1); //переворачиваю ось игрек обратно для нормального отображения графика
    
    [self drawInContext:context];

}


@end
