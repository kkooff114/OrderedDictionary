//
//  ViewController.m
//  OrderedDictionary
//
//  Created by 娄继伟 on 17/1/10.
//  Copyright © 2017年 Lou Jiwei. All rights reserved.
//

#import "ViewController.h"
#import "OrderedDictionary.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc]init];
    
    dictionary[@"c"] = @"cc";
    dictionary[@"a"] = @"aa";
    dictionary[@"b"] = @"bb";
    dictionary[@"d"] = @"dd";
    dictionary[@"e"] = @"ee";
    
    NSLog(@"%@", dictionary.description);
    
    OrderedDictionary *ordered = [[OrderedDictionary alloc]initWithDictionary:dictionary];
    
    NSString * jsonString = [ordered toJSONString];
    
    NSLog(@"%@", jsonString);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
