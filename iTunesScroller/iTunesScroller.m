#import "iTunesScroller.h"

@interface NSScroller (undocumented)
+ (void)_drawEndCapInRect:(NSRect)rect;
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

- (BOOL)isVertical {
    NSRect bounds = [self bounds];
    return NSHeight(bounds) < NSWidth(bounds);
}

#if 0
NSEraseRect(partRect);
[[NSColor orangeColor] set];
NSFrameRect(partRect);
if (highlight) {
    NSRectFill(partRect);
}
#endif

- (void)drawPart:(NSScrollerPart)part highlight:(BOOL)highlight {
    //NSLog(@"drawPart:%@ highlight:%@", NSScrollerPartDescription(part), highlight ? @"YES":@"NO");
    
	NSRect partRect = [self rectForPart:part];
    
    switch (part) {
        case NSScrollerKnob: {
            assert(!highlight); // TODO FIXME I don't know who sets this yet, but I haven't seen it happen yet. It *should*.
            [[NSColor colorWithDeviceRed:0. green:0. blue:255/128 alpha:1.0] set];
            NSRectFill(partRect);
        }   break;
        case NSScrollerIncrementLine: {
            if ([self isVertical]) {
                //  Right arrow.
            } else {
                //  Down arrow.
            }
        }   break;
        case NSScrollerDecrementLine: {
            if ([self isVertical]) {
                //  Left arrow.
            } else {
                //  Up arrow.
            }
        }   break;
        case NSScrollerKnobSlot: {
            NSAssert(!highlight, nil); // I never expect this to be set.
            if ([self isVertical]) {
                NSGradient *gradient = [[[NSGradient alloc] initWithStartingColor:[NSColor lightGrayColor]
                                                                      endingColor:[NSColor whiteColor]] autorelease];
                [gradient drawInRect:partRect angle:90.];
            } else {
                NSGradient *gradient = [[[NSGradient alloc] initWithStartingColor:[NSColor lightGrayColor]
                                                                      endingColor:[NSColor whiteColor]] autorelease];
                [gradient drawInRect:partRect angle:0.];
            }
        }   break;
        case NSScrollerNoPart:
        case NSScrollerIncrementPage:
        case NSScrollerDecrementPage:
            NSAssert1(NO, @"-[iTunesScroller drawPart:%@ highlight:] => unexpected drawPart.", NSScrollerPartDescription(part));
            break;
        default:
            NSAssert2(NO, @"unknown NSScrollerPart: %d (%@)", part, NSScrollerPartDescription(part));
    }
}

- (void)drawArrow:(NSScrollerArrow)arrow highlightPart:(NSScrollerArrow)highlightPart {
	//NSLog(@"drawArrow:%@ highlightPart:%@", NSScrollerArrowDescription(arrow), NSScrollerArrowDescription(highlightPart));
	
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
	[self drawPart:NSScrollerKnob highlight:NO];
}

- (void)drawKnobSlotInRect:(NSRect)rect highlight:(BOOL)highlight_ {
    NSAssert(!highlight_, @"apparently -drawKnobSlotInRect:highlight:'s highlight IS sometimes set");
    [self drawPart:NSScrollerKnobSlot highlight:NO];
}

@end
