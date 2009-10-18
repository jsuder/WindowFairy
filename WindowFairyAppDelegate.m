// -------------------------------------------------------
// WindowFairyAppDelegate.m
//
// Copyright (c) 2009 Jakub Suder <jakub.suder@gmail.com>
// -------------------------------------------------------

#import "WindowFairyAppDelegate.h"
#import "WindowManager.h"

#import "Window.h"
#import "Application.h"

@implementation WindowFairyAppDelegate

@synthesize window, windowManager;

- (void) awakeFromNib {
  [windowManager reloadWindowList];
  NSLog(@"windows:");
  for (Window *wnd in windowManager.windowList) {
    NSLog(@"window \"%@\" of application %@ (%@)", wnd.name, wnd.application.name, wnd.application.pid);
  }
}

- (IBAction) switchButtonClicked: (id) sender {
  
}

- (NSInteger) numberOfRowsInTableView: (NSTableView *) view {
  NSLog(@"count = %d", windowManager.windowList.count);
  return windowManager.windowList.count;
}

- (id) tableView: (NSTableView *) view
       objectValueForTableColumn: (NSTableColumn *) column
       row: (NSInteger) row {
  Window *windowRecord = [windowManager.windowList objectAtIndex: row];
  NSString *columnName = (NSString *) [column identifier];
  if ([columnName isEqualToString: @"Icon"]) {
    return nil;
  } else if ([columnName isEqualToString: @"AppName"]) {
    return windowRecord.application.name;
  } else {
    return windowRecord.name;
  }
}

@end
