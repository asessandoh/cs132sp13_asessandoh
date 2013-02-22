#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;
@property (assign) int numberAccumulated;
@property (assign) char operationPending;

-(void) pressKey: (char) pressKey;
-(void) appendDigit: (char) NewDigit;
-(void) clearscreen: (char) clearscreen;
-(void) clearallkey: (char) clearallkey;
@end

//function declaration

BOOL isADigit(char Digit);
BOOL isClearScreenKey(char Clear);
BOOL isclearallkey( char clearall);

