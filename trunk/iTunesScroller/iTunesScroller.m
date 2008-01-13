#import "iTunesScroller.h"

@interface NSScroller (undocumented)
- (void)drawArrow:(NSScrollerArrow)arrow highlightPart:(NSScrollerArrow)highlightPart;
- (void)drawKnobSlotInRect:(NSRect)rect highlight:(BOOL)flag;
@end

static NSString* NSScrollerPartDescription(NSScrollerPart part) {
	switch (part) {
		case NSScrollerNoPart:
			return @"NSScrollerNoPart";
			break;
		case NSScrollerDecrementPage:
			return @"NSScrollerDecrementPage";
			break;
		case NSScrollerKnob:
			return @"NSScrollerKnob";
			break;
		case NSScrollerIncrementPage:
			return @"NSScrollerIncrementPage";
			break;
		case NSScrollerDecrementLine:
			return @"NSScrollerDecrementLine";
			break;
		case NSScrollerIncrementLine:
			return @"NSScrollerIncrementLine";
			break;
		case NSScrollerKnobSlot:
			return @"NSScrollerKnobSlot";
			break;
		default:
			return [NSString stringWithFormat:@"unknown part code %d", part];
	}
}

static NSString* NSScrollerArrowDescription(NSScrollerArrow arrow) {
	switch (arrow) {
		case -1:
			return @"NSScrollerNeitherArrow";
		case NSScrollerIncrementArrow:
			return @"NSScrollerIncrementArrow";
		case NSScrollerDecrementArrow:
			return @"NSScrollerDecrementArrow";
		default:
			return [NSString stringWithFormat:@"unknown NSScrollerArrow code %d", arrow];
	}
}

@implementation iTunesScroller

- (void)drawPart:(NSScrollerPart)part highlight:(BOOL)highlight {
	NSRect partRect = [self rectForPart:part];
	NSEraseRect(partRect);
	[[NSColor orangeColor] set];
	NSFrameRect(partRect);
	if (highlight) {
		NSRectFill(partRect);
	}
}

- (void)drawArrow:(NSScrollerArrow)arrow highlightPart:(NSScrollerArrow)highlightPart {
	//NSLog(@"drawArrow:%@ highlightPart:%@", NSScrollerArrowDescription(arrow), NSScrollerArrowDescription(part));
	//[super drawArrow:arrow highlightPart:part];
	//if (part == -1)
	//	NSLog(@" ");
	
	switch (highlightPart) {
		case -1:
			[self drawPart:NSScrollerDecrementLine highlight:NO];
			[self drawPart:NSScrollerIncrementLine highlight:NO];
			break;
		case NSScrollerIncrementArrow:
			[self drawPart:NSScrollerIncrementLine highlight:YES];
			break;
		case NSScrollerDecrementArrow:
			[self drawPart:NSScrollerDecrementLine highlight:YES];
			break;
	}
}

- (void)drawKnob {
	//NSLog(@"drawKnob");
	//[super drawKnob];
	
	//[[NSColor blueColor] set];
	//NSRectFill([self rectForPart:NSScrollerKnob]);
	[self drawPart:NSScrollerKnob highlight:NO];
}

- (void)drawKnobSlotInRect:(NSRect)rect highlight:(BOOL)flag {
	//NSLog(@"drawKnobSlotInRect:highlight:%d", flag);
	//[super drawKnobSlotInRect:rect highlight:flag];
	
	[[NSColor lightGrayColor] set];
	NSRectFill(rect);
}

@end
