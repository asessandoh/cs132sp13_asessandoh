#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (assign) int numberOnScreen;
@property (assign) int numberAccumulated;
@property (assign) char operationPending;

-(void) pressKey: (char) pressKey;


@end
BOOL isADigit(char Digit);
BOOL isClearScreenKey(char Clear);
