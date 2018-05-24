//
//  WXXDownloadManager.h
//  WXXDownloadManager
//
//  Created by Wuxi on 2018/5/24.
//  Copyright © 2018年 wuxi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^WXXBackgroundDownloadCompletion)(void);

@interface WXXDownloadManager : NSObject

//backgroundDownload finish callback
@property (nonatomic, copy)WXXBackgroundDownloadCompletion backgroundDownloadCompletion;

+ (instancetype)sharedManager;


@end
