
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
    
    NSLog(@"STUB response to '%@' message received by object at %p (%@)", NSStringFromSelector(_cmd), self, self);
    
    int thisnum;
    int newdigit;
    thisnum = [ self numberOnScreen];
    newdigit = thisnum - '0';
    [ self setNumberOnScreen: thisnum *10 + newdigit];
    
    
    
    
    
    return;
}



-(NSString*) description
{
    return [NSString stringWithFormat:@"Calculator with %d on screen.", numberOnScreen];
}
@end
