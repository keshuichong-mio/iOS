//
//  ViewController.m
//  afnetTest
//
//  Created by lic on 16/12/29.
//  Copyright © 2016年 lic. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define kBaseURL @"http://localhost:80"
//#define kBaseURL @"http://169.254.173.116:80"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [self testAfnetworkVisit];
    [self testAfnetworkUpload];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - net
- (void)testAfnetworkVisit {
    //输出路径
    NSString *home = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *outPath = [home stringByAppendingPathComponent:@"1.html"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
    [manager GET:kBaseURL parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
//            [responseObject writeToFile:outPath options:NSDataWritingAtomic error:nil];
        }
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

- (void)testAfnetworkUpload {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"番外" ofType:@"txt"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    if ([fileM fileExistsAtPath:filePath]) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:kBaseURL parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSData *fileData = [NSData dataWithContentsOfFile:filePath];
            [formData appendPartWithFileData:fileData name:@"2" fileName:@"txt" mimeType:@"text/plain"];
            
        } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"");
        }];
        
        
    }
}

@end
