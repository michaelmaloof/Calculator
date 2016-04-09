//
//  Calculator.m
//  Calculator
//
//  Created by Michael Maloof on 4/9/16.
//  Copyright © 2016 Jetpack Dinosaur. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

-(void)handleNumberSelected:(float)number{
    self.variable = number;
    NSLog(@"Calculator handled number %f", self.variable);
}

-(void)handleEquationType:(int)equationType{
    //set the euation type for the calculator
    self.equationType = equationType;
    
    //add variable to the running total
    self.runningTotal = self.variable;
    
    NSLog(@"Calculator handled equationType %d", self.equationType);
    NSLog(@"Calculator set runningTotal to %f", self.runningTotal);

}

-(void)handleDecimal:numberString{
    NSString *floatString = [NSString stringWithFormat:@"%@0",numberString];
    self.variable = [floatString floatValue];
}

-(float)solveEquation{
    
    float answer = 0;
    
    if (self.equationType == 1){ //divide
        
        answer = self.runningTotal / self.variable;
        
    } else if (self.equationType == 2){ //add
        
        answer = self.runningTotal + self.variable;
        
    } else if (self.equationType == 3){ //subtract
        
        answer = self.runningTotal - self.variable;
        
    } else if (self.equationType == 4){ //multiply
        
        answer = self.runningTotal * self.variable;

    }
    
    self.runningTotal = answer;
    [self resetCalculator];
    return self.runningTotal;
}

//called after you solve an equation. Keeps the runningTotal
-(void)resetCalculator {
    self.equationType = 0;
    self.variable = self.runningTotal;
}

-(void)clearCalculator{
    self.runningTotal = 0;
    self.variable = 0;
    self.equationType = 0;
}

-(float)handleTipAmountSelected:(float)tipAmount{
    float answer = tipAmount * self.variable;
    self.runningTotal = answer;
    [self resetCalculator];
    
    return self.runningTotal;
}

@end
