//
//  ViewController.m
//  FileManager
//
//  Created by wanghong on 2017/2/6.
//  Copyright © 2017年 wanghong. All rights reserved.
//

#import "ViewController.h"

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
    NSString *rootPath = @"/Users/wanghong/Desktop/test";
    [self recusiveFolder:rootPath];
    
    NSLog(@"%@",self.files);
    self.textView.text = [self.files componentsJoinedByString:@"\n"];
}

- (void)recusiveFolder:(NSString *)folderPath{
    NSArray *rootFiles = [self.fm contentsOfDirectoryAtPath:folderPath error:nil];
    for (NSString *fileName in rootFiles) {
        BOOL isDir;
        NSString *path = [folderPath stringByAppendingPathComponent:fileName];
        
         [self.fm fileExistsAtPath:path isDirectory:&isDir];
        
            if (isDir) {
                [self recusiveFolder:path];
            }else{
                if (![fileName isEqualToString:@".DS_Store"]) {
                    [self.files addObject:fileName];
                }
            }
    }
    
}

@end
