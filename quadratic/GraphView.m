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
    
    

    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGPoint osiPoints[12] = {CGPointMake(10, 120), CGPointMake(230, 120),
        CGPointMake(120, 10), CGPointMake(120, 230),
        CGPointMake(230, 120), CGPointMake(225, 118),
        CGPointMake(230, 120), CGPointMake(225, 122),
        CGPointMake(120, 10), CGPointMake(118, 15),
        CGPointMake(120, 10), CGPointMake(122, 15)};
    CGContextStrokeLineSegments(context, osiPoints, 12);
    
    int totalElements = 1000;
    double k = 1;
    double xStart = 0;
    
    if (0 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 1) k = 100;
    if (1 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 10) k = 10;
    if (10 < fabs(self.x1)+fabs(self.x2) && fabs(self.x1)+fabs(self.x2) < 100) k = 1;
    
    
    if (self.x1 < self.x2) xStart = self.x1;
        else xStart = self.x2;
    xStart--;
    
    CGPoint xyPoints[totalElements];
    for (int i = 0; i <= totalElements; i++)
    {
        xyPoints[i] = CGPointMake(120, 120);
    }
    

    
    if (self.a != 0 || self.b !=0 || self.c != 0) {
        double j = (totalElements/4)*(-1)/k;
        if (self.x1 != 0 || self.x2 != 0) j = xStart;
        for (int i = 0; i < totalElements; i) {
            xyPoints[i] = CGPointMake(j*k+120, k*((self.a*(j*j)+self.b*j+self.c)*(-1))+120);
            i++;
            j = j+1/k;
            xyPoints[i] = CGPointMake(j*k+120, k*((self.a*(j*j)+self.b*j+self.c)*(-1))+120);
            i++;
        }
    CGContextStrokeLineSegments(context, xyPoints, totalElements);
    }
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect); // Очистим context
    //CGContextScaleCTM(context,-1,-1);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, CGRectMake(1, 1, 238, 238));
    
    CGContextScaleCTM(context,1,-1); //переворачиваю ось игрек что бы текст выводился нормально
    ////////////////////////////////
    
    CFStringRef string;
    CTFontRef font;
    // Initialize the string, font, and context
    
    CFStringRef keys[] = { kCTFontAttributeName };
    CFTypeRef values[] = { font };
    
    CFDictionaryRef attributes = CFDictionaryCreate(kCFAllocatorDefault, (const void**)&keys, (const void**)&values, sizeof(keys) / sizeof(keys[0]),
                                                    &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    CFAttributedStringRef attrString = CFAttributedStringCreate(kCFAllocatorDefault, string, attributes);
    CFRelease(string);
    CFRelease(attributes);
    
    CTLineRef line = CTLineCreateWithAttributedString(attrString);
    
    // Set text position and draw the line into the graphics context
    CGContextSetTextPosition(context, 10.0, 10.0);
    CTLineDraw(line, context);
    CFRelease(line);
    
    ////////////////////////////////
    CGContextScaleCTM(context,1,-1); //переворачиваю ось игрек что бы текст выводился нормально
    
    [self drawInContext:context];

}


@end
