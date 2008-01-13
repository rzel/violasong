#import "iTunesScrollView.h"
#import "iTunesScroller.h"

@implementation iTunesScrollView

+ (Class)_horizontalScrollerClass {
	return [iTunesScroller class];
}

+ (Class)_verticalScrollerClass {
	return [iTunesScroller class];
}

- (id)initWithCoder:(NSKeyedUnarchiver*)decoder_ {
	[decoder_ setClass:[iTunesScroller class] forClassName:@"NSScroller"];
	self = [super initWithCoder:decoder_];
	[decoder_ setClass:[NSScroller class] forClassName:@"NSScroller"];
	return self;
}

@end
