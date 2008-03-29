/* PrependerController */

#import <Cocoa/Cocoa.h>
#import "Prepender.h"
#import "Unprepender.h"

@interface PrependerController : NSObject
{
    IBOutlet NSTextView *inputField;
    IBOutlet Prepender *prepender;
    IBOutlet Unprepender *unprepender;
}
- (IBAction)prepend:(id)sender;
- (IBAction)unprepend:(id)sender;
- (IBAction)clear:(id)sender;
@end
