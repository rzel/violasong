#import "VWCatWindow.h"
#import <AppKit/AppKit.h>

@implementation VWCatWindow

- (id)initWithContentRect:(NSRect)contentRect
				styleMask:(unsigned int)astyle
				  backing:(NSBackingStoreType)bufferingType
					defer:(BOOL)flag
{
	NSWindow* window = [super initWithContentRect:contentRect
										 styleMask:NSBorderlessWindowMask
										   backing:NSBackingStoreBuffered
											 defer:NO];
	[window setBackgroundColor: [NSColor clearColor]];
	[window setLevel: NSStatusWindowLevel];
	[window setAlphaValue:1];
	[window setOpaque:NO];
	[window setHasShadow:NO];
	return window;
}

- (BOOL) canBecomeKeyWindow
{
	return YES;
}

- (void)mouseDragged:(NSEvent *)draggable
{
	NSPoint currentLocation;
	NSPoint newOrigin;
	NSRect screenFrame = [[NSScreen mainScreen] frame];
	NSRect windowFrame = [self frame];
	
	currentLocation = [self convertBaseToScreen:[self mouseLocationOutsideOfEventStream]];
	newOrigin.x = currentLocation.x - initialLocation.x;
	newOrigin.y = currentLocation.y - initialLocation.y;
	
	if ((newOrigin.y + windowFrame.size.height) > (screenFrame.origin.y + screenFrame.size.height - 22))
	{
		newOrigin.y = screenFrame.origin.y + (screenFrame.size.height - windowFrame.size.height - 22);
	}
	[self setFrameOrigin:newOrigin];
}

- (void)mouseDown:(NSEvent *)draggable
{
	NSRect windowFrame = [self frame];
	initialLocation = [self convertBaseToScreen:[draggable locationInWindow]];
	initialLocation.x -= windowFrame.origin.x;
	initialLocation.y -= windowFrame.origin.y;
}

@end
