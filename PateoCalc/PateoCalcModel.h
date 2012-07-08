//
//  PateoCalcModel.h
//  PateoCalc
//
//  Created by Charles Belcher on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PateoCalcModel : NSObject
-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;
@end
