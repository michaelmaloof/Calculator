//
//  ViewController.m
//  Calculator
//
//  Created by Michael Maloof on 4/8/16.
//  Copyright © 2016 Jetpack Dinosaur. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

//calculator textView and calculator buttons on the viewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *tenPercentButton;
@property (weak, nonatomic) IBOutlet UIButton *fifteenPercent;
@property (weak, nonatomic) IBOutlet UIButton *twentyPercentButton;
@property (weak, nonatomic) IBOutlet UIButton *divideButton;
@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *fourButton;
@property (weak, nonatomic) IBOutlet UIButton *fiveButton;
@property (weak, nonatomic) IBOutlet UIButton *sixButton;
@property (weak, nonatomic) IBOutlet UIButton *sevenButton;
@property (weak, nonatomic) IBOutlet UIButton *eightButton;
@property (weak, nonatomic) IBOutlet UIButton *nineButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplyButton;
@property (weak, nonatomic) IBOutlet UIButton *equalButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *decimalButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;

@property Calculator *calculator;

@property BOOL isNewEquation;

@end

@implementation ViewController

//the app finished loading this viewController (or screen)
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCalculator];
}



#pragma Buttons Were Tapped



//the user tapped 10%
- (IBAction)tenPercentWasTapped:(id)sender {
    NSLog(@"10 Percent");
    [self tipAmountSelected:.10];
}

//the user tapped 15%
- (IBAction)fifteenPercentWasTapped:(id)sender {
    NSLog(@"15 Percent");
    [self tipAmountSelected:.15];
}

//the user tapped 20%
- (IBAction)twentyPercentWasTapped:(id)sender {
    NSLog(@"20 Percent");
    [self tipAmountSelected:.20];
}

//the user tapped divide
- (IBAction)divideWasTapped:(id)sender {
    NSLog(@"/ Was Tapped");
    //the user tapped "/" so pass a 1 to represent this
    [self equationTypeSelected:1];
}

//the user tapped one
- (IBAction)oneWasTapped:(id)sender {
    NSLog(@"1 Was Tapped");
    //the user tapped the "1" button, so pass an int of 1 to the numberSelected method
    [self numberSelected:1];
}

//the user tapped two
- (IBAction)twoWasTapped:(id)sender {
    NSLog(@"2 Was Tapped");
    //the user tapped the "2" button, so pass an int of 2 to the numberSelected method
    [self numberSelected:2];
}

//the user tapped three
- (IBAction)threeWasTapped:(id)sender {
    NSLog(@"3 Was Tapped");
    //the user tapped the "3" button, so pass an int of 3 to the numberSelected method
    [self numberSelected:3];
}

//the user tapped divide add
- (IBAction)addWasTapped:(id)sender {
    NSLog(@"+ Was Tapped");
    //the user tapped "+" so pass a 2 to represent this
    [self equationTypeSelected:2];
}

//the user tapped four
- (IBAction)fourWasTapped:(id)sender {
    NSLog(@"4 Was Tapped");
    //the user tapped the "4" button, so pass an int of 4 to the numberSelected method
    [self numberSelected:4];
}

//the user tapped five
- (IBAction)fiveWasTapped:(id)sender {
    NSLog(@"5 Was Tapped");
    //the user tapped the "5" button, so pass an int of 5 to the numberSelected method
    [self numberSelected:5];
}

//the user tapped six
- (IBAction)sixWasTapped:(id)sender {
    NSLog(@"6 Was Tapped");
    //the user tapped the "6" button, so pass an int of 6 to the numberSelected method
    [self numberSelected:6];
}

//the user tapped subtract
- (IBAction)subtractWasTapped:(id)sender {
    NSLog(@"- Was Tapped");
    //the user tapped "-" so pass a 3 to represent this
    [self equationTypeSelected:3];
}

//the user tapped seven
- (IBAction)sevenWasTapped:(id)sender {
    NSLog(@"7 Was Tapped");
    //the user tapped the "7" button, so pass an int of 7 to the numberSelected method
    [self numberSelected:7];
}

//the user tapped eight
- (IBAction)eightWasTapped:(id)sender {
    NSLog(@"8 Was Tapped");
    //the user tapped the "8" button, so pass an int of 8 to the numberSelected method
    [self numberSelected:8];
}

- (IBAction)nineWasTapped:(id)sender {
    NSLog(@"9 Was Tapped");
    //the user tapped the "9" button, so pass an int of 9 to the numberSelected method
    [self numberSelected:9];
}

//the user tapped nine
- (IBAction)multiplyWasTapped:(id)sender {
    NSLog(@"x Was Tapped");
    //the user tapped "x" so pass a 4 to represent this
    [self equationTypeSelected:4];
}

- (IBAction)equalWasTapped:(id)sender {
    NSLog(@"= Was Tapped");
    [self findAnswer];
}

//the user tapped clear
- (IBAction)clearWasTapped:(id)sender {
    NSLog(@"C Was Tapped");
    [self clearCalcuator];
}

//the user tapped decimal point
- (IBAction)decimalWasTapped:(id)sender {
    NSLog(@". Was Tapped");
    [self handleDecimal];
}



#pragma Calculator Logic



//Has the calculator object clear itself and updates the viewControlelr accordingly
-(void)clearCalcuator{
    NSLog(@"viewController clear logic started");
    
    [self.calculator clearCalculator];
    self.textView.text = nil;
    
    //calculator just started, so disable buttons that can't be clicked yet
    [self disablePercentButtons];
    [self disableEquationTypeButtons];
    
    self.isNewEquation = YES;
}

//Has the calculator object insert an equation type itself and updates the viewControlelr accordingly
-(void)equationTypeSelected:(int)equationType{
    NSLog(@"viewController equationType logic for equation type %d", equationType);
    
    //send the equation type to the calculator object
    [self.calculator handleEquationType:equationType];
    
    //clear the textView so the user can type the next number
    self.textView.text = nil;
    
    //disable the buttons we can't interact with now
    [self disableEquationTypeButtons];
    [self disablePercentButtons];
}

//Has the calculator object insert a number to itself and updates the viewControlelr accordingly
-(void)numberSelected:(int)number{
    NSLog(@"viewController number selected logic started for number %d",number);
    
    //turn the int the user selected into a string to display on self.textView
    NSString *numberCharacter = [NSString stringWithFormat:@"%d",number];
    //insert the string into self.textView
    [self.textView insertText:numberCharacter];
    
    //convert the string in the textView into an int so we can have the total int on the textView and not just the number the user tapped. Then send that int when we call handleNumberSelected so the calculator object can handle the logic of what to do with this number
    [self.calculator handleNumberSelected:[self.textView.text intValue]];
    NSLog(@"self.textView.text = %@",self.textView.text);
    
    //we now have a number in our textView so let the user click buttons that needed numbers to interact with
        [self enableButtons];
}

//Has the calculator object insert a tip amount to itself and updates the viewControlelr accordingly
-(void)tipAmountSelected:(float)tipAmount{
    NSLog(@"viewController tipamount logic started for tip amount %f", tipAmount);
    float tip = [self.calculator handleTipAmountSelected:tipAmount];
    
    //display answer on textView but only two decimals since its a dollar amount
    self.textView.text = [NSString stringWithFormat:@"%.02f", tip];
    NSLog(@"tip = %@", self.textView.text);
    
    self.isNewEquation = YES;
    
    //let them interact with the answer
    [self enableButtons];

}

//Has the calculator object insert a decimal point to itself and updates the viewControlelr accordingly
-(void)handleDecimal{
    NSLog(@"viewController decimal logic started");

}

//Has the calculator object answer its equation and updates the viewController accordingly
-(void)findAnswer{
    NSLog(@"viewController find answer logic started");
    //set an int equal to the answer of the equation, which we have the calculator object solve
    int answer = [self.calculator solveEquation];
    
    //display answer on textView
    self.textView.text = [NSString stringWithFormat:@"%d", answer];
    NSLog(@"answer to equation = %@", self.textView.text);

    self.isNewEquation = YES;
    
    //let them interact with the answer
    [self enableButtons];
}



#pragma ViewController Setup



-(void)setupCalculator{
    //alloc and init for the self.calculator object to work
    self.calculator = [[Calculator alloc]init];
    
    //calculator just started, so disable buttons that can't be clicked yet
    [self disablePercentButtons];
    [self disableEquationTypeButtons];
    
    self.isNewEquation = YES;
}

//disable percent buttons until you have a number to find the percent of
-(void)disablePercentButtons{
    //set enable to false so they can't be clicked
    self.tenPercentButton.enabled = NO;
    self.fifteenPercent.enabled = NO;
    self.twentyPercentButton.enabled = NO;
    
    //fade the buttons to show they're disabled
    self.tenPercentButton.alpha = .3;
    self.fifteenPercent.alpha = .3;
    self.twentyPercentButton.alpha = .3;
}

//disable equation buttons until you have a number to work with
-(void)disableEquationTypeButtons{
    //set enable to false so they can't be clicked
    self.multiplyButton.enabled = NO;
    self.plusButton.enabled = NO;
    self.divideButton.enabled = NO;
    self.subtractButton.enabled = NO;
    self.equalButton.enabled = NO;
    
    //fade the buttons to show they're disabled
    self.multiplyButton.alpha = .3;
    self.plusButton.alpha = .3;
    self.divideButton.alpha = .3;
    self.subtractButton.alpha = .3;
    self.equalButton.alpha = .3;
}

//enable percent buttons now that you have a number to find the percent of
-(void)enablePercentButtons{
    //set enable to true so they can be clicked
    self.tenPercentButton.enabled = YES;
    self.fifteenPercent.enabled = YES;
    self.twentyPercentButton.enabled = YES;
    
    //unfade the buttons to show they're enabled
    self.tenPercentButton.alpha = 1;
    self.fifteenPercent.alpha = 1;
    self.twentyPercentButton.alpha = 1;
}

//enable equation buttons now that you have a number to work with
-(void)enableButtons{
    
    //only enable them if this is a new equation, if not for now we require them to click "=" before clicking another math symbol
    if (self.isNewEquation == YES){

        //set enable to true so they can be clicked
        self.multiplyButton.enabled = YES;
        self.plusButton.enabled = YES;
        self.divideButton.enabled = YES;
        self.subtractButton.enabled = YES;
        
        //unfade the buttons to show they're enabled
        self.multiplyButton.alpha = 1;
        self.plusButton.alpha = 1;
        self.divideButton.alpha = 1;
        self.subtractButton.alpha = 1;
        
        [self enablePercentButtons];
        
        self.isNewEquation = NO;
    }
    
    self.equalButton.enabled = YES;
    self.equalButton.alpha = 1;
}

@end
