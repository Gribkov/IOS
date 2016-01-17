//
//  GraphView.m
//  quadratic
//
//  Created by Roman Gribkov on 18.10.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import "GraphView.h"


@implementation GraphView


-(void)drawInContext:(CGContextRef) context points:(CGPoint[]) garphPoints countElements: (int) i
{
    CGContextStrokeLineSegments(context, garphPoints, i);
    
    
    
    char *txt =  "XYZ"; // создаем символьный массив, который выведем на экран
    CGContextSetRGBFillColor(context, 0, 0, 0, 1); // Цвет текста
    CGContextSelectFont(context, "Helvetica", 12.0, kCGEncodingMacRoman); // выбираем шрифт
    CGContextSetTextDrawingMode(context, kCGTextFill); // выбираем вариант отображения текста: kCGTextFill (заливка) или kCGTextStroke (контур)
    CGContextShowTextAtPoint(context, 20, 20, txt, strlen(txt));	// выводим текст на экран
    
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect); // Очистим context
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
    CGContextFillRect(context, CGRectMake(1, 1, 238, 238));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGPoint osiPoints[12] = {CGPointMake(10, 120), CGPointMake(230, 120),
                         CGPointMake(120, 10), CGPointMake(120, 230),
                         CGPointMake(230, 120), CGPointMake(225, 118),
                         CGPointMake(230, 120), CGPointMake(225, 122),
                         CGPointMake(120, 10), CGPointMake(118, 15),
                         CGPointMake(120, 10), CGPointMake(122, 15)};
    [self drawInContext:context points:osiPoints countElements:12];

}


@end
