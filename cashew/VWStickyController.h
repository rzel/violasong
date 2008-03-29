/* VWStickyController */

#import <Cocoa/Cocoa.h>

@interface VWStickyController : NSObject
{
    IBOutlet id catView;
    IBOutlet id inputField;
    IBOutlet id stickyWindow; //setValue:forInputKey:
}
- (IBAction)changeColor:(id)sender;
@end
// plist -- no menu lsui