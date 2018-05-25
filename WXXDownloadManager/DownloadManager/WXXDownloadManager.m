//
//  WXXDownloadManager.m
//  WXXDownloadManager
//
//  Created by Wuxi on 2018/5/24.
//  Copyright © 2018年 wuxi. All rights reserved.
//

#import "WXXDownloadManager.h"

@interface WXXDownloadManager()<NSURLSessionDelegate>

@property (nonatomic, strong)NSURLSession *session;
@property (nonatomic, strong)NSURLSession *backgroundSession;
//key:value for downloadUrl:downloadObject
@property (nonatomic, strong)NSMutableDictionary *downloads;

@end

@implementation WXXDownloadManager

+ (instancetype)sharedManager{
    static id sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
- (instancetype)init{
    if (self = [super init]){
        //init session
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:NSOperationQueue.mainQueue];
        
        //init background session
        NSURLSessionConfiguration *backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:[[NSBundle mainBundle] bundleIdentifier]];
        self.backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfiguration delegate:self delegateQueue:NSOperationQueue.mainQueue];
        
        //init dictionary
        self.downloads = [NSMutableDictionary dictionary];
    }
    return self;
}
//MARK: - Download
//- (void)
//MARK: - Clean directory
- (void)cleanDirectoryNamed:(NSString *)directory {
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error = nil;
    for (NSString *file in [fm contentsOfDirectoryAtPath:directory error:&error]) {
        [fm removeItemAtPath:[directory stringByAppendingPathComponent:file] error:&error];
    }
}

- (void)cleanTmpDirectory {
    NSArray* tmpDirectory = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:NSTemporaryDirectory() error:NULL];
    for (NSString *file in tmpDirectory) {
        [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@%@", NSTemporaryDirectory(), file] error:NULL];
    }
}
@end
