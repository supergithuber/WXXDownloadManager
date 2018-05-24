//
//  WXXDownloadObject.m
//  WXXDownloadManager
//
//  Created by Wuxi on 2018/5/24.
//  Copyright © 2018年 wuxi. All rights reserved.
//

#import "WXXDownloadObject.h"

@implementation WXXDownloadObject

- (instancetype)initWithSession:(NSURLSessionDownloadTask *)downloadTask progressBlock:(WXXDownloadProgressBlock)progressBlock remainingTime:(WXXDownloadRemainingSecondsBlock)remainingSecondsBlock completionBlock:(WXXDownloadCompletionBlock)completionBlock{
    if (self = [super init]){
        _downloadTask = downloadTask;
        _progressBlock = progressBlock;
        _remainingSecondsBlock = remainingSecondsBlock;
        _completionBlock = completionBlock;
    }
    return self;
}
- (void)closeOutputStream{
    if (_outputStream){
        [_outputStream close];
        _outputStream = nil;
    }
}
@end
