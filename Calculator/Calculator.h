#import <Foundation/Foundation.h>
#import "WCSFraction.h"
#import "WCSMutableFraction.h"

typedef enum {
	WCSPartTop,
	WCSPartBottom
} WCSFractionPart;


@interface Calculator : NSObject
@property (strong, readwrite) WCSMutableFraction* numberOnScreen;
@property (strong, readwrite) WCSFraction* numberAccumulated;
@property (assign) char operatingPending;
@property (assign) WCSFractionPart fractional;

-(void) pressKey: (char) theKey ;
-(void) appendDigit: (char) theDigit ;
-(void) registerArithmetic:(char)theOperator ;
-(void) computeAndDisplayResult ;
-(void)clearScreen ;
-(void)clearAccumulator ;
-(void)clearOperation ;
@end
BOOL isADigit(char someChar) ;
BOOL isClearScreenKey(char someChar) ;
BOOL isClearAllKey(char someChar) ;
BOOL isResultKey(char someChar) ;
BOOL isArithmeticAllKey(char someChar) ;