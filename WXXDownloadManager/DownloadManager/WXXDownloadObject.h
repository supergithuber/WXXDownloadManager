//
//  WXXDownloadObject.h
//  WXXDownloadManager
//
//  Created by Wuxi on 2018/5/24.
//  Copyright © 2018年 wuxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^WXXDownloadRemainingSecondsBlock)(NSUInteger seconds);
typedef void(^WXXDownloadProgressBlock)(CGFloat progress);
typedef void(^WXXDownloadCompletionBlock)(BOOL completed);

@interface WXXDownloadObject : NSObject

@property (copy, nonatomic) WXXDownloadProgressBlock progressBlock;  //下载过程回调
@property (copy, nonatomic) WXXDownloadCompletionBlock completionBlock; //下载完成回调
@property (copy, nonatomic) WXXDownloadRemainingSecondsBlock remainingSecondsBlock; //下载剩余时间回调

//文件的下载流
@property (nonatomic, strong)NSOutputStream *outputStream;
//文件下载的URL
@property (nonatomic, strong)NSURL *fileURL;
//文件的总长度
@property (nonatomic, assign)long long totalLength;

@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;
@property (copy, nonatomic)   NSString *fileName;      //文件名字
@property (copy, nonatomic)   NSString *fileNickname;   //下载完成后用于显示的文件名
@property (copy, nonatomic)   NSString *directoryName;  //目标目录文件夹，本地文件夹
@property (strong, nonatomic) NSDate *startDate;        //开始时间

- (instancetype)initWithSession:(NSURLSessionDownloadTask *)downloadTask
                  progressBlock:(WXXDownloadProgressBlock)progressBlock
                  remainingTime:(WXXDownloadRemainingSecondsBlock)remainingSecondsBlock
                completionBlock:(WXXDownloadCompletionBlock)completionBlock;

- (void)closeOutputStream;

@end
