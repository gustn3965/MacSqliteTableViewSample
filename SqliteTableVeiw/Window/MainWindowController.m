//
//  MainWindowController.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/08.
//

#import "MainWindowController.h"
#import "ChatRoomTableViewController.h"
#import "SQLDB.h"
#import "TopHeaderView.h"
@interface MainWindowController ()
@property (weak) IBOutlet TopHeaderView *topHeaderView;
@property NSViewController * currentViewController;
@property (weak) IBOutlet NSView *leftView;
@property (weak) IBOutlet NSView *rightView;
@property SQLDB *sqldb;
@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    [self setChatRoomViewController];

    self.sqldb = [SQLDB shared];
    [self.sqldb createChatRoomTable];
}

-(void) removeCurrentView {
    [self.currentViewController.view removeFromSuperview];
    self.currentViewController = nil;
}

- (void) setChatRoomViewController {
    [self setupTopheaderView: @"채팅"];
    [self removeCurrentView];
    ChatRoomTableViewController *chatRoom = [[ChatRoomTableViewController alloc] initWithNibName:[ChatRoomTableViewController className] bundle:nil];
    self.currentViewController = chatRoom;
    NSView *chatRoomView = chatRoom.view;
    [self.rightView addSubview:chatRoomView];
    [chatRoomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
        [chatRoomView.leadingAnchor constraintEqualToAnchor:self.rightView.leadingAnchor],
        [chatRoomView.trailingAnchor constraintEqualToAnchor:self.rightView.trailingAnchor],
        [chatRoomView.topAnchor constraintEqualToAnchor:self.rightView.topAnchor],
        [chatRoomView.bottomAnchor constraintEqualToAnchor:self.rightView.bottomAnchor],
    ]];
}

- (void) setupTopheaderView: (NSString *) text {
    self.topHeaderView.topTextLabel.stringValue = text;
//    TopHeaderView *topHeader = [[TopHeaderView alloc] init];
//
//    [self.topHeaderView addSubview:topHeader];
//    [topHeader setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [NSLayoutConstraint activateConstraints:@[
//        [topHeader.leadingAnchor constraintEqualToAnchor:self.topHeaderView.leadingAnchor],
//        [topHeader.trailingAnchor constraintEqualToAnchor:self.topHeaderView.trailingAnchor],
//        [topHeader.topAnchor constraintEqualToAnchor:self.topHeaderView.topAnchor],
//        [topHeader.bottomAnchor constraintEqualToAnchor:self.topHeaderView.bottomAnchor],
//    ]];
}

- (void) setFriendRoomViewController {
    [self setupTopheaderView: @"친구"];
    [self removeCurrentView];

//    NSView *friendRoom = [[NSView alloc] initWithFrame:CGRectMake(0,0,300,600)];
//    [self.rightView addSubview: friendRoom];
////    [chatRoomView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [NSLayoutConstraint activateConstraints:@[
//        [friendRoom.leadingAnchor constraintEqualToAnchor:self.rightView.leadingAnchor],
//        [friendRoom.trailingAnchor constraintEqualToAnchor:self.rightView.trailingAnchor],
//        [friendRoom.topAnchor constraintEqualToAnchor:self.rightView.topAnchor],
//        [friendRoom.bottomAnchor constraintEqualToAnchor:self.rightView.bottomAnchor],
//    ]];
}

- (IBAction)showFriendRoom:(id)sender {
    [self setFriendRoomViewController];
}

- (IBAction)showChatRoom:(id)sender {
    [self setChatRoomViewController];
}

- (IBAction)addChatRoom:(id)sender {
    ChatRoom *chatRoom = [[ChatRoom alloc] init];
    chatRoom.chatRoomChat = @"오늘은 어떤가요?";
    chatRoom.chatRoomTitle = @"백준";
    [self.sqldb insertChatRoom:chatRoom];
    [self updateChatRoomTableViewController];
}

-(void) updateChatRoomTableViewController {
    if ([self.currentViewController isKindOfClass:[ChatRoomTableViewController class]]) {
        [((ChatRoomTableViewController *)self.currentViewController) fetchChatRoom];
    }
}

@end
