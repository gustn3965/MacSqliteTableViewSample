//
//  ChatRoomTableViewController.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import "ChatRoomTableViewController.h"
#import "ChatRoomTableCellView.h"
#import "SQLDB.h"

@interface ChatRoomTableViewController ()
@property (weak) IBOutlet NSTableView *tableView;
@property SQLDB *sqldb;

@property NSMutableArray<ChatRoom *> *chatRoom;
@end

@implementation ChatRoomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.sqldb = [SQLDB shared];
    [self fetchChatRoom];
}

-(void) fetchChatRoom {
    FMResultSet *result = [self.sqldb selectChatRoom];
    self.chatRoom = [[NSMutableArray alloc] init];
    while ([result next]) {
        ChatRoom *chatRoom = [[ChatRoom alloc] init];
        chatRoom.chatRoomChat = [result stringForColumn:@"chatRoomChat"];
        chatRoom.chatRoomTitle = [result stringForColumn:@"chatRoomTitle"];
        chatRoom.chatRoomId = [result intForColumn:@"chatRoomId"];
        [self.chatRoom addObject:chatRoom];
    }
    [self.tableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.chatRoom count];
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identi = tableColumn.identifier;
    ChatRoomTableCellView *cell = [tableView makeViewWithIdentifier:identi owner:self];
    
    [cell makeLayerCorner];
    [cell.chatRoomIConVIew setImage:[NSImage imageNamed:@"kakao"]];
    [cell.chatRoomIConVIew setImageScaling:(NSImageScaleAxesIndependently)];
    ChatRoom *chatRoom = [self.chatRoom objectAtIndex:row];
    NSString *title = [@(chatRoom.chatRoomId) stringValue];
    title = [title stringByAppendingString:@" - "];
    title = [title stringByAppendingString:chatRoom.chatRoomTitle];
    cell.chatRoomTitleLabel.stringValue = title;
    cell.chatRoomIChatLabel.stringValue = chatRoom.chatRoomChat;
    return cell;
}

@end
