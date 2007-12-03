//
//  AppController.m
//  CalendarStoreSpike
//
//  Created by wolf on 12/3/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	CalCalendar *kidsCalendar = [CalCalendar calendar];
	kidsCalendar.title = @"Kids";
	
	NSError *calError;
	if ([[CalCalendarStore defaultCalendarStore] saveCalendar:(CalCalendar *)kidsCalendar errorL(NSError **)] == NO){
		NSAlert *alertPanel = [NSAlert alertWithError:calError];
		(void) [alertPanel runModal];
	}
}

@end
