//
//  WCSMutableFraction.h
//  Fraction Development
//
//  Created by Alex.E on 3/26/13.
//  Copyright (c) 2013 Wells CS132: Object Oriented Programming. All rights reserved.
//

#import "WCSFraction.h"

@interface WCSMutableFraction : WCSFraction

@property (assign) int numerator;
@property  (assign) int denominator;

-(void) setNumerator:(int) Num andDenominator:(int) Dem;
-(void) modifyByInverting;
-(void) modifyByNegative;
-(void) modifyByAdding;
-(void) modifyByMultiplying;
@end
