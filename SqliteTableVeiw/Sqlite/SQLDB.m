//
//  SQLDB.m
//  SqliteTableVeiw
//
//  Created by hyunsu on 2022/01/09.
//

#import "SQLDB.h"
@interface SQLDB ()
@property FMDatabase *db;
@end

@implementation SQLDB

+ (SQLDB *) shared {
    static SQLDB *instance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        instance = [[SQLDB alloc] init];
    });
    return instance;
}

-(id) init {
    self = [super init];
    NSArray *path =  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentdirectory = [path objectAtIndex:0];
    self.db = [[FMDatabase alloc] initWithPath:[documentdirectory stringByAppendingPathComponent:@"sqliteTableView.sqlite"]];
    NSLog(@"%@", [documentdirectory stringByAppendingPathComponent:@"sqliteTableView.sqlite"]);
    [self.db open];
    return self;
}

- (void)createChatRoomTable {
    NSString *query = @"CREATE TABLE IF NOT EXISTS ChatRoom(chatRoomId INTEGER PRIMARY KEY AUTOINCREMENT, chatRoomTitle TEXT, chatRoomChat TEXT)";
    [self.db executeUpdate:query];
}


-(void)insertChatRoom: (ChatRoom *)room {
    NSString * query = @"INSERT INTO ChatRoom (chatRoomTitle, chatRoomChat) VALUES(?, ?)";
    [self.db executeUpdate:query values:@[room.chatRoomTitle, room.chatRoomChat] error:nil];
}


- (FMResultSet *)selectChatRoom {
    NSString *query = @"SELECT chatRoomId, chatRoomTitle, chatRoomChat FROM ChatRoom";
    FMResultSet *result = [self.db executeQuery:query];
    return result;
}

@end
