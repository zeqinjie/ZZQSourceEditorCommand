//
//  DeleteCommand.m
//  AlignSourceEditorCommand
//
//  Created by zhengzeqin on 2018/7/18.
//  Copyright © 2018年 addcn. All rights reserved.
//

#import "DeleteCommand.h"

@implementation DeleteCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
    [self deleteLineWithInvocation:invocation completionHandler:completionHandler];
    
}


- (void)deleteLineWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler{
    //有选中了才删除
    if (invocation.buffer.selections.count != 0) {
        XCSourceTextRange* firstObject = invocation.buffer.selections.firstObject;
        //开始删除的位置
        NSUInteger start = firstObject.start.line;
        //删除的行数
        NSUInteger len = firstObject.end.line - start +1;
        //Index Set
        NSIndexSet* set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(start,len)];
        //移除指定代码
        [invocation.buffer.lines removeObjectsAtIndexes:set];
    }
    completionHandler(nil);
}

@end
