//  PateoGroup Calculator
//  PateoCalcViewController.m
//  PateoCalc
//
//  Created by Charles Belcher on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PateoCalcViewController.h"
#import "PateoCalcModel.h"

@interface PateoCalcViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) PateoCalcModel *pateoCalcModel;
@property (nonatomic) BOOL userPressedDecimal;
@end

@implementation PateoCalcViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize pateoCalcModel = _pateoCalcModel;
@synthesize userPressedDecimal;

-(PateoCalcModel *)pateoCalcModel
{
    if (!_pateoCalcModel) _pateoCalcModel = [[PateoCalcModel alloc] init];
    return _pateoCalcModel;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text=[self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)decimalPressed:(id)sender {
    NSString *decimal = [sender currentTitle];
    if (self.userPressedDecimal == NO)
    {
        self.display.text=[self.display.text stringByAppendingString:decimal];
    }
    self.userPressedDecimal = YES;
}

- (IBAction)enterPressed {
    [self.pateoCalcModel pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userPressedDecimal = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) 
    {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result=[self.pateoCalcModel performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}


- (IBAction)clearPressed:(id)sender {
    self.display.text = @"0";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    [self.pateoCalcModel pushOperand:0];
}


@end
