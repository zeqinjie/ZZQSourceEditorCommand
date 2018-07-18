//
//  EditorCommand.h
//  AlignSourceEditorCommand
//
//  Created by zhengzeqin on 2018/7/18.
//  Copyright © 2018年 addcn. All rights reserved.
//

#import <XcodeKit/XcodeKit.h>

/*
 1.XCSourceEditorCommand 是另外一个核心概念，其实就是当插件被触发之后，你有机会在代理方法里面拦截到这个消息（XCSourceEditorCommandInvocation），做出处理之后将内容返回给 Xcode，仅此而已
 2.XCSourceEditorCommandInvocation 里面会存放一些 meta 数据，其中最重要的是 identifier 和 buffer，identifier 就是用来做区分的，buffer 则是整个插件中最最重要的概念，但是他其实也很简单。
 3.
 */
@interface JosnModelEditorCommand : NSObject <XCSourceEditorCommand>

@end
