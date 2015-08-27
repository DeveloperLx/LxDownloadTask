//
//  LxDownloadTask.m
//  LxDownloadTaskDemo
//
//  Created by DeveloperLx on 15/8/2.
//  Copyright (c) 2015年 DeveloperLx. All rights reserved.
//

//  http://blog.sina.com.cn/s/blog_7b9d64af01019q57.html
//  http://www.cnblogs.com/hbf369/p/3581986.html

#import "LxDownloadTask.h"


@interface LxDownloadTask () <NSURLConnectionDataDelegate>

@property (nonatomic,assign) NSInteger totalBytes;
@property (nonatomic,assign) NSInteger finishedBytes;

@property (nonatomic,retain) NSDate * createDate;
@property (nonatomic,retain) NSDate * beginDate;
@property (nonatomic,retain) NSDate * failedDate;
@property (nonatomic,retain) NSDate * finishedDate;

@end

@implementation LxDownloadTask
{
    NSMutableURLRequest * _urlRequest;
    NSURLConnection * _urlConnection;
    
    NSOutputStream * _outputStream;
}
@synthesize status = _status;

- (void)prepare
{
    _urlRequest = [NSMutableURLRequest requestWithURL:self.sourceURL
                                          cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                      timeoutInterval:REQUEST_TIMEOUT_INTERVAL];
    
    
    
    
    BOOL saveFileExist = [[NSFileManager defaultManager]fileExistsAtPath:self.savePath];
    
    if (saveFileExist == NO) {
    
        BOOL createFileSuccess =
        [[NSFileManager defaultManager]createFileAtPath:self.savePath
                                               contents:nil
                                             attributes:nil];
        if (createFileSuccess) {
           
        }
        else {
            NSCAssert(NO, @"LxDownloadTask: savePath format error!");
        }
    }
    
    NSError * error = nil;
    NSDictionary * fileAttributes = [[NSFileManager defaultManager]attributesOfItemAtPath:self.savePath error:&error];
    self.finishedBytes = [fileAttributes fileSize];
    NSString * headerRangeFieldValue = [NSString stringWithFormat:@"bytes=%zi-", self.finishedBytes];
    [_urlRequest setValue:headerRangeFieldValue forHTTPHeaderField:@"Range"];
    
    _urlConnection = [[NSURLConnection alloc]initWithRequest:_urlRequest delegate:self];
    
    _outputStream = [NSOutputStream outputStreamToFileAtPath:self.savePath append:YES];
    [_outputStream open];
}

- (void)convertToWait
{
    switch (self.status) {
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            [_urlConnection cancel];
            self.status = LxDownloadTaskStatusWaiting;
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            self.status = LxDownloadTaskStatusWaiting;
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            self.status = LxDownloadTaskStatusWaiting;
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            self.status = LxDownloadTaskStatusWaiting;
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            self.status = LxDownloadTaskStatusWaiting;
            break;
        }
        default: {
            break;
        }
    }
}

- (void)start
{
    switch (self.status) {
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            break;
        }
        default: {
            break;
        }
    }
    
    
}

- (void)fallToWait
{
    switch (self.status) {
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)pause
{
    switch (self.status) {
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)cancel
{
    [_urlConnection cancel];
    
    switch (self.status) {
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            break;
        }
        default: {
            break;
        }
    }
}

- (void)setStatus:(LxDownloadTaskStatus)status
{
    switch (status) {
        case LxDownloadTaskStatusNone: {
            
            break;
        }
        case LxDownloadTaskStatusWaiting: {
            
            break;
        }
        case LxDownloadTaskStatusExecuting: {
            
            break;
        }
        case LxDownloadTaskStatusPaused: {
            
            break;
        }
        case LxDownloadTaskStatusFailed: {
            
            break;
        }
        case LxDownloadTaskStatusCancelled: {
            
            break;
        }
        case LxDownloadTaskStatusFinished: {
            
            break;
        }
        default: {
            break;
        }
    }
    _status = status;
}

#pragma delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{

}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{

}

@end
