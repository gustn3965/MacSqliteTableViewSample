//
//  ChatRoomTableCellView.h
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoomTableCellView : NSTableCellView
@property (weak) IBOutlet NSImageView *chatRoomIConVIew;
@property (weak) IBOutlet NSTextField *chatRoomTitleLabel;
@property (weak) IBOutlet NSTextField *chatRoomIChatLabel;

- (void) makeLayerCorner;
@end

NS_ASSUME_NONNULL_END
