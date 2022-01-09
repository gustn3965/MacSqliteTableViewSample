//
//  ChatRoomTableCellView.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import "ChatRoomTableCellView.h"
@interface ChatRoomTableCellView ()

@end

@implementation ChatRoomTableCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

- (void) makeLayerCorner {
    [self.chatRoomIConVIew setWantsLayer:YES];
    [self.chatRoomIConVIew.layer setMasksToBounds:YES];
    [self.chatRoomIConVIew.layer setCornerRadius:15.0];
}


@end
