//
//  Calculator.h
//  Calculator
//
//  Created by Michael Maloof on 4/9/16.
//  Copyright © 2016 Jetpack Dinosaur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject


@property int equationType;
@property float runningTotal;
@property float variable;

-(void)clearCalculator;
-(void)handleEquationType:(int)equationType;
-(void)handleNumberSelected:(float)number;
-(float)handleTipAmountSelected:(float)tipAmount;
-(void)handleDecimal:(NSString*)numberString;
-(float)solveEquation;

@end
