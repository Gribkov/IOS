//
//  GraphView.h
//  quadratic
//
//  Created by Roman Gribkov on 18.10.15.
//  Copyright © 2015 Roman Gribkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

@property CGContextRef context;

-(void)drawInContext:(CGContextRef)context;

@end
