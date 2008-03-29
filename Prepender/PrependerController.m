#import "PrependerController.h"

@implementation PrependerController

- (IBAction)prepend:(id)sender {
	NSString *text, *output;
	text = [[inputField textStorage] string];
		
	output = [prepender prependText:text];
	
	[inputField setString:output];
}

- (IBAction)unprepend:(id)sender {
	NSString *text, *output;
	text = [[inputField textStorage] string];
	
	output = [unprepender unprependText:text];
	
	[inputField setString:output];
}

- (IBAction)clear:(id)sender {
	NSString *text = @"";
	[inputField setString:text];
}

@end