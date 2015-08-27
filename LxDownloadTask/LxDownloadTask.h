//
//  LxDownloadTask.h
//  LxDownloadTaskDemo
//
//  Created by DeveloperLx on 15/8/2.
//  Copyright (c) 2015年 DeveloperLx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

static NSTimeInterval const REQUEST_TIMEOUT_INTERVAL = 60;

typedef NS_ENUM(NSUInteger, LxDownloadTaskStatus) {
    LxDownloadTaskStatusNone = 0,
    LxDownloadTaskStatusWaiting,
    LxDownloadTaskStatusExecuting,
    LxDownloadTaskStatusPaused,
    LxDownloadTaskStatusFailed,
    LxDownloadTaskStatusCancelled,
    LxDownloadTaskStatusFinished,
};

@interface LxDownloadTask : NSObject

@property (nonatomic,copy) NSString * identifier;

@property (nonatomic,retain) NSURL * sourceURL;
@property (nonatomic,retain) NSString * savePath;

@property (nonatomic,assign) LxDownloadTaskStatus status;

@property (nonatomic,assign,readonly) NSInteger totalBytes;
@property (nonatomic,assign,readonly) NSInteger finishedBytes;

- (void)convertToWaitStatus;
- (void)start;
- (void)pause;
- (void)cancel;

@property (nonatomic,copy) void (^startedCallback)(LxDownloadTask * downloadTask);
@property (nonatomic,copy) void (^progressCallback)(LxDownloadTask * downloadTask, NSInteger bytesRead, NSInteger finishedBytes, NSInteger totalBytes, CGFloat finishedPercent);
@property (nonatomic,copy) void (^failedCallback)(LxDownloadTask * downloadTask);
@property (nonatomic,copy) void (^finishedCallback)(LxDownloadTask * downloadTask);

@property (nonatomic,retain,readonly) NSDate * createDate;
@property (nonatomic,retain,readonly) NSDate * beginDate;
@property (nonatomic,retain,readonly) NSDate * failedDate;
@property (nonatomic,retain,readonly) NSDate * finishedDate;

@end
