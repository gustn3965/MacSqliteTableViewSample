//
//  ChatRoomTableViewController.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import "ChatRoomTableViewController.h"
#import "ChatRoomTableCellView.h"

@interface ChatRoomTableViewController ()
@property (weak) IBOutlet NSTableView *tableView;

@end

@implementation ChatRoomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 5;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *identi = tableColumn.identifier;
    ChatRoomTableCellView *cell = [tableView makeViewWithIdentifier:identi owner:self];
    cell.chatRoomTitleLabel.stringValue = @"보통 보통";
    [cell makeLayerCorner];
    [cell.chatRoomIConVIew setImage:[NSImage imageNamed:@"kakao"]];
    [cell.chatRoomIConVIew setImageScaling:(NSImageScaleAxesIndependently)];
    return cell;
}


@end
