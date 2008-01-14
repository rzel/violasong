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

- (void)drawPart:(NSScrollerPart)part highlight:(BOOL)highlight {
    //NSLog(@"drawPart:%@ highlight:%@", NSScrollerPartDescription(part), highlight ? @"YES":@"NO");
    
	NSRect partRect = [self rectForPart:part];
    
    switch (part) {
        case NSScrollerNoPart: {
        }   break;
        case NSScrollerDecrementPage: {
        }   break;
        case NSScrollerKnob: {
        }   break;
        case NSScrollerIncrementPage: {
        }   break;
        case NSScrollerDecrementLine: {
        }   break;
        case NSScrollerIncrementLine: {
        }   break;
        case NSScrollerKnobSlot: {
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
        default:
            NSAssert2(false, @"unknown NSScrollerPart: %d (%@)", part, NSScrollerPartDescription(part));
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
