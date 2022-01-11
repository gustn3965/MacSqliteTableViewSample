//
//  FriendListCellView.h
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/10.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendListCellView : NSTableCellView <NSOutlineViewDataSource>
@property (weak) IBOutlet NSImageView *profileImageView;
@property (weak) IBOutlet NSTextField *nameLabel;
@property (weak) IBOutlet NSTextField *stateLabel;

@end

NS_ASSUME_NONNULL_END
