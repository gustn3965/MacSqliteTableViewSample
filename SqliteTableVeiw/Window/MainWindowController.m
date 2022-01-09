//
//  MainWindowController.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/08.
//

#import "MainWindowController.h"
#import "ChatRoomTableViewController.h"

@interface MainWindowController ()
@property id currentViewController;
@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self setChatRoomViewController];

}

- (void) setChatRoomViewController {
    ChatRoomTableViewController *chatRoom = [[ChatRoomTableViewController alloc] initWithNibName:[ChatRoomTableViewController className] bundle:nil];
    self.currentViewController = chatRoom;
    NSView *chatRoomView = chatRoom.view;
    [self.window.contentView addSubview:chatRoomView];
    [chatRoomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [chatRoomView.leadingAnchor constraintEqualToAnchor:self.window.contentView.leadingAnchor],
        [chatRoomView.trailingAnchor constraintEqualToAnchor:self.window.contentView.trailingAnchor],
        [chatRoomView.topAnchor constraintEqualToAnchor:self.window.contentView.topAnchor],
        [chatRoomView.bottomAnchor constraintEqualToAnchor:self.window.contentView.bottomAnchor],
    ]];
}

@end
