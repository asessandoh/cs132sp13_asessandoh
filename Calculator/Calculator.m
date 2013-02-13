
#import "Calculator.h"

@implementation Calculator

@synthesize numberAccumulated;
@synthesize numberOnScreen;
@synthesize operationPending;

- (id)init
{
    self = [super init];
    if (self)
    {
        //Set up initial calculator conditions here
    }
    return self;
}
-(void) pressKey: (char ) pressKey
{

    if (isADigit(pressKey)){
        
        [self appendDigit:pressKey];
    }
    else if(pressKey == 'c' || pressKey == 'C') {
    else if(isClearScreenKey(pressKey)) {
        [self setNumberOnScreen:0];
        [self clearscreen:pressKey];
    }else{
        
        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", pressKey, NSStringFromSelector(_cmd), self, self);
    
    return;
    }
}
-(void) appendDigit:(char)NewDigit
{
    numberOnScreen = (numberOnScreen *10 + NewDigit - '0');
}

-(void) clearscreen: (char) clearscreen
{
   [self setNumberOnScreen:0]; 
}


-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", numberOnScreen];
}
@end
BOOL isADigit(char Digit)
{
    if( Digit > '9') return NO;
    if( Digit < '0') return NO;
    return YES;
BOOL isClearScreenKey(char Clear)
{
    if(Clear == 'c') return YES;
    if(Clear == 'C') return YES;
    return NO;
}