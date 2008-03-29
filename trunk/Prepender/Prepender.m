#import "Prepender.h"

@implementation Prepender
- (NSString *)prependText:(NSString *)text {
	NSString *textString = text;
	NSArray *splitString = [textString componentsSeparatedByString:@"\n"];
	NSString *prepender = @">";
	NSString *finalOutput = @"";
	int i;
	for (i=0; i < [splitString count]; i++) {
		NSString *prependedLine = [prepender stringByAppendingString:[splitString objectAtIndex:i]];
		if (i != ([splitString count]-1))
			prependedLine =  [prependedLine stringByAppendingString:@"\n"];
		finalOutput = [finalOutput stringByAppendingString:prependedLine];
	}
	return finalOutput;
}
@end