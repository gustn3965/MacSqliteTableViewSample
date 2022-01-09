//
//  ChatRoomTableViewController.h
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomTableViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

-(void) fetchChatRoom ;


@end

NS_ASSUME_NONNULL_END
