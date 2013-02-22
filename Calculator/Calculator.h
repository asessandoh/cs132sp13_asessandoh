#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;
@property (assign) int numberAccumulated;
@property (assign) char OperationPending;

-(void) pressKey: (char) pressKey;
-(void) appendDigit: (char) NewDigit;
-(void) clearscreen: (char) clearscreen;
-(void) clearallkey: (char) clearallkey;
-(void) resultkey: (char) resultkey;
-(void) arithmeticallkey: (char) arithmetickey;
-(void) registerarithmetic: (char) theoperator;
-(void) clearaccumulator: (char) clearaccumulator;
-(void) clearoperation: (char) clearoperation;
@end

//function declaration

BOOL isADigit(char Digit);
BOOL isClearScreenKey(char Clear);
BOOL isclearallkey( char clearall);
BOOL isresultkey(char result);
BOOL isarithmeticallkey(char arithmetickey);
BOOL isclearaccumulator(char clearaccumulator);
BOOL isclearoperation(char clearoperation);
