/* VWCatBell */

#import <Cocoa/Cocoa.h>

@interface VWCatBell : NSObject
{
	IBOutlet NSButton *catBellButton;
	IBOutlet NSWindow *stickyWindow;
}
- (IBAction)catBell:(id)sender;
@end
