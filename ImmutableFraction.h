//
//  ImmutableFraction.h
//  
//
//  Created by Alex.E on 2/28/13.
//
//

#import <Cocoa/Cocoa.h>

@interface ImmutableFraction : NSObject
@property (assign) int numerator;
@property (assign) int denominator;

-(void)Description;
-(void)init;


@end
