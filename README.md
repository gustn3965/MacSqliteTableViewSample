
# 목적
* `Objective C`언어를 이용하여 `macOS`를 개발해본다.  
* `Sqlite`를 이용하여 데이터를 저장하고, 불러와본다. 
    * `FMDB`를 이용한다. 
* 데이터를 `NSTableView`를 이용하여 불러와본다.
    * 추가적으로 `NSOutlineView` 구현해본다.
* 추가적으로 `KVOController`를 이용하여 `KVO`를 사용해본다. 

# Pod
* `FMDB`
* `KVOController`

# FMDB 
* 1.DB저장소 `위치` 설정 
* 2.DB `open` 
* 3.`Table` 생성 및 `insert` 
* 4.`select` 
    * `FMResultSet` 를 반환하므로, `next`를 이용하여 원하는 컬럼을 가져와 타입으로 만들어주는 과정이 필요하다. 

```objc
    FMResultSet *result = [self.sqldb selectChatRoom];
    self.chatRoom = [[NSMutableArray alloc] init];
    while ([result next]) {
        ChatRoom *chatRoom = [[ChatRoom alloc] init];
        chatRoom.chatRoomChat = [result stringForColumn:@"chatRoomChat"];
        chatRoom.chatRoomTitle = [result stringForColumn:@"chatRoomTitle"];
        chatRoom.chatRoomId = [result intForColumn:@"chatRoomId"];
        [self.chatRoom addObject:chatRoom];
    }
```

------- 

## 궁금증
* Pod으로 설치했더니, FMDB의 macOS 타겟이 10.6, KVOController은 10.7로 되어있는데, 그럼 지금 프로젝트는 최소타겟이 10.12인데 괜찮겠지...? ?  

* `FMDB`를 이용하여 SQlite 저장소 가져오는 객체를 SQLDB 객체로 만들었고, 이 과정에서 싱글톤으로 구현했다. 여기서 싱글톤으로 구현하기 위해, GCD를 이용했는데, `dispatch_once`와 `static`에 대해서 공부하자. 
```objc
+ (SQLDB *) shared {
    static SQLDB *instance = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        instance = [[SQLDB alloc] init];
    });
    return instance;
}
```
