#import "Unprepender.h"

@implementation Unprepender
- (NSString *)unprependText:(NSString *)text {
	NSString *textString = text;
	NSArray *splitString = [textString componentsSeparatedByString:@"\n"];
	NSString *prepender = @">";
	NSString *finalOutput = @"";
	int i = 0;
	for (i=0; i < ([splitString count]); ++i) {
		NSString *unprependedLine = @"";
		if (0 != [[splitString objectAtIndex:i] length]) {
			if ([[[splitString objectAtIndex:i] substringToIndex:1] isEqualToString:prepender]) {
				unprependedLine = [[splitString objectAtIndex:i] substringFromIndex:1];
			}
			else {
				unprependedLine = [splitString objectAtIndex:i];
			}
			if (i != ([splitString count]-1)) {
				unprependedLine = [unprependedLine stringByAppendingString:@"\n"];
			}
			finalOutput = [finalOutput stringByAppendingString:unprependedLine];
		}
		else {
			finalOutput = [finalOutput stringByAppendingString:@"\n"];
		}
	}
	return finalOutput;
}
@end
