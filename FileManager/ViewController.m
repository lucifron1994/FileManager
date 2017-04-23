//
//  ViewController.m
//  FileManager
//
//  Created by wanghong on 2017/2/6.
//  Copyright © 2017年 wanghong. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+my_des.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) NSMutableArray *files;
@property (strong, nonatomic) NSFileManager *fm;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self update:nil];
}

- (IBAction)update:(id)sender {
    self.files = [NSMutableArray array];
    self.fm = [NSFileManager defaultManager];
    NSString *rootPath = @"/Volumes/Seagate Drive/";
    [self recusiveFolder:rootPath];
    
    NSLog(@"%@",[self.files mydes]);
    self.textView.text = [self.files componentsJoinedByString:@"\n"];
}

- (void)recusiveFolder:(NSString *)folderPath{
    NSArray *rootFiles = [self.fm contentsOfDirectoryAtPath:folderPath error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSString *fileName in rootFiles) {
        BOOL isDir;
        NSString *path = [folderPath stringByAppendingPathComponent:fileName];
        
         [self.fm fileExistsAtPath:path isDirectory:&isDir];
        
            if (isDir) {
                [self recusiveFolder:path];
            }else{
                if (![fileName isEqualToString:@".DS_Store"]) {
//                    [self.files addObject:fileName];
                    NSString*str0 = [fileName stringByRemovingPercentEncoding];
                    [array addObject:str0];
                }
            }
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:array forKey:folderPath.lastPathComponent];
    [self.files addObject:dic];
    
}

@end
