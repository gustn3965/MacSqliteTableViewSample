//
//  ChatRoom.h
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChatRoom : NSObject

@property NSInteger chatRoomId; 
@property NSString *chatRoomTitle;
@property NSString *chatRoomChat;

@end

NS_ASSUME_NONNULL_END
