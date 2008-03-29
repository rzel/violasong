#import "VWCatBell.h"

@implementation VWCatBell

- (IBAction)catBell:(id)sender
{
	//NSColor * newColor;
	//newColor = [NSColor colorWithDeviceRed: 0.9 green:0.9 blue:9.0 alpha:1.0];
	//[newColor setFurColor]; setColor
	if ([stickyWindow isVisible])
	{
		[stickyWindow orderOut:sender];
	}
	else
	{
		[stickyWindow orderFront:sender];
	}
}

@end