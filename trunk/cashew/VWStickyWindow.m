#import "VWStickyWindow.h"
#import <AppKit/AppKit.h>

@implementation VWStickyWindow

- (id)initWithContentRect:(NSRect)contentRect
				styleMask:(unsigned int)astyle
				  backing:(NSBackingStoreType)bufferingType
					defer:(BOOL)flag
{
	NSWindow* window = [super initWithContentRect:contentRect
										styleMask:NSBorderlessWindowMask
										  backing:NSBackingStoreBuffered
											defer:NO];
	[window setBackgroundColor: [NSColor blackColor]];
	[window setLevel: NSNormalWindowLevel];
	[window setAlphaValue:1];
	[window setOpaque:NO];
	[window setHasShadow:NO];
	return window;
}

- (BOOL) canBecomeKeyWindow
{
	return YES;
}

@end
