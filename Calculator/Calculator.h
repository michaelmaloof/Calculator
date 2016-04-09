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
@property int runningTotal;
@property int variable;

-(void)clearCalculator;
-(void)handleEquationType:(int)equationType;
-(void)handleNumberSelected:(int)number;
-(void)handleTipAmountSelected:(float)tipAmount;
-(void)handleDecimal;
-(int)solveEquation;

@end
