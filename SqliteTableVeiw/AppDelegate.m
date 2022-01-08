//
//  AppDelegate.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/08.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()
@property NSMutableArray *windows;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.windows = [[NSMutableArray alloc] init];
    MainWindowController *main = [[MainWindowController alloc] initWithWindowNibName:[MainWindowController className]];
    [self.windows addObject:main];
    [main showWindow:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
