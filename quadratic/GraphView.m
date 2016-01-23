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
    
    int totalElements = 100;
    int k = 1;
    
    CGPoint xyPoints[totalElements];
    for (int i = 0; i <= totalElements; i++)
    {
        xyPoints[i] = CGPointMake(120, 120);
    }
    
  /*  char *txt =  "WXYZ"; // создаем символьный массив, который выведем на экран
    CGContextSetRGBFillColor(context, 0, 0, 0, 1); // Цвет текста
    CGContextSelectFont(context, "Helvetica", 12.0, kCGEncodingMacRoman); // выбираем шрифт
    CGContextSetTextDrawingMode(context, kCGTextStroke); // выбираем вариант отображения текста: kCGTextFill (заливка) или kCGTextStroke (контур)
    CGContextShowTextAtPoint(context, 20, 20, txt, strlen(txt));	// выводим текст на экран
   */
    if (self.a != 0 || self.b !=0 || self.c != 0) {
        double j = (totalElements/4)*(-1);
        int i = 0;
        for (i; i < totalElements; i) {
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
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, CGRectMake(1, 1, 238, 238));
    
    [self drawInContext:context];

}


@end
