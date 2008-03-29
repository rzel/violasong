#import "VWCatView.h"

@implementation VWCatView

- (id)initWithFrame:(NSRect)frameRect
{
	if ((self = [super initWithFrame:frameRect]) != nil) {
		catImage = [NSImage imageNamed:@"cat1"];
		[self setNeedsDisplay:YES];
	}
	return self;
}

- (BOOL) isFlipped { return YES; }

/*- (void)setXCoordinate:(int)x andYCoordinate:(int)y
{
	pointArray[i].x = x;
	pointArray[i].y = y;
	i++;
	for (i=0; i<22; i++) {
		coorArray[i].x = xcoor; coorArray[i].y = ycoor;	
	};
}*/
NSColor * furColor;
- (void)setFurColor :(float)r :(float)g :(float)b :(float)a {
	furColor = [NSColor colorWithDeviceRed:(float)r green:(float)g blue:(float)b alpha:(float)a];

	//self = [NSColor newColor];
	//NSColor * furColor = [NSColor whiteColor];
}
- (void)drawRect:(NSRect)rect
{
	NSBezierPath * fur = [NSBezierPath bezierPath];	
	
	furColor = [NSColor colorWithDeviceRed:1.0 green:0.9 blue:1.0 alpha:1.0];

	int ptCount = 23;
    NSPoint ptArray[ptCount];
	ptArray[0].x = 12; ptArray[0].y = 25;
	ptArray[1].x = 16; ptArray[1].y = 4;
	ptArray[2].x = 26; ptArray[2].y = 16;
	ptArray[3].x = 41; ptArray[3].y = 16;
	ptArray[4].x = 52; ptArray[4].y = 2;
	ptArray[5].x = 57; ptArray[5].y = 22;
	ptArray[6].x = 60; ptArray[6].y = 66;
	ptArray[7].x = 67; ptArray[7].y = 76;
	ptArray[8].x = 72; ptArray[8].y = 74;
	ptArray[9].x = 73; ptArray[9].y = 70;
	ptArray[10].x = 73; ptArray[10].y = 58;
	ptArray[11].x = 78; ptArray[11].y = 53;
	ptArray[12].x = 83; ptArray[12].y = 53;
	ptArray[13].x = 80; ptArray[13].y = 64;
	ptArray[14].x = 82; ptArray[14].y = 74;
	ptArray[15].x = 75; ptArray[15].y = 84;
	ptArray[16].x = 67; ptArray[16].y = 84;
	ptArray[17].x = 69; ptArray[17].y = 90;
	ptArray[18].x = 52; ptArray[18].y = 98;
	ptArray[19].x = 21; ptArray[19].y = 98;
	ptArray[20].x = 5; ptArray[20].y = 89;
	ptArray[21].x = 8; ptArray[21].y = 74;
	ptArray[22].x = 13; ptArray[22].y = 66;
    //core image
	[fur appendBezierPathWithPoints:ptArray count:ptCount];
	NSPoint headCenter = { 35, 46 };
	NSPoint bottomRight = { 0, 102 };
	[fur moveToPoint: headCenter]; 
	[fur appendBezierPathWithArcWithCenter: headCenter
									 radius: 31
								 startAngle: 0 
								   endAngle: 360];
	[furColor set]; [fur fill];
	[catImage compositeToPoint:bottomRight operation:NSCompositeSourceOver];
}

@end
