//
//  ViewController.m
//  afnetTest
//
//  Created by lic on 16/12/29.
//  Copyright © 2016年 lic. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

//#define kBaseURL @"http://api.budejie.com/api/api_open.php?market=anzhi&maxid=&udid=862949026831409&a=newlist&c=data&os=4.2.2&client=android&userID=&page=1&per=20&visiting=&type=&time=week&mac=30%3A92%3Af6%3Add%3A13%3A58&ver=4.2.0"
//#define kBaseURL @"http://169.254.173.116:80"
#define kBaseURL @"http://localhost:8080/MJServer"

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
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    
    NSDictionary *dic = @{
                          @"username":@"123",
                          @"pwd":@"123"
                          };
    
    [manager GET:@"login" parameters:dic progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
//            [responseObject w0riteToFile:outPath options:NSDataWritingAtomic error:nil];
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
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        
        NSDictionary *dic = @{
//                              @"username":@"lic",
                              };
        [manager POST:@"upload" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSData *fileData = [NSData dataWithContentsOfFile:filePath];
            [formData appendPartWithFileData:fileData name:@"file" fileName:@"1.txt" mimeType:@"text/plain"];
            
        } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"");
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"");
        }];
        
        
    }
}

@end
