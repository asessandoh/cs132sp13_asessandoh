
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
    if (pressKey >= '0' && pressKey <= '9'){
        int nos;
        int newdigit;
        nos = [ self numberOnScreen];
        newdigit = pressKey - '0';
        [ self setNumberOnScreen: nos *10 + newdigit];
    }
    else if(pressKey == 'c' || pressKey == 'C') {
        [self setNumberOnScreen:0];
    }else{
        
        NSLog(@"Uncovered argument '%c' in %@ message received by object at %p (%@)", pressKey, NSStringFromSelector(_cmd), self, self);
    
    return;
    }
}



-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", numberOnScreen];
}
@end
