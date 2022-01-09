//
//  SQLDB.h
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "ChatRoom.h"

NS_ASSUME_NONNULL_BEGIN

@interface SQLDB : NSObject
+ (SQLDB *) shared; 

- (void) createChatRoomTable;
- (void) insertChatRoom: (ChatRoom *)room;
- (FMResultSet *) selectChatRoom;


@end

NS_ASSUME_NONNULL_END
