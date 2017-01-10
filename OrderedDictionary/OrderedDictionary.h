//
//  OrderedDictionary.h
//  DMS
//
//  Created by 娄继伟 on 17/1/10.
//  Copyright (c) 2017 Lou Jiwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderedDictionary : NSObject


-(OrderedDictionary *)initWithDictionary:(NSMutableDictionary *)dictionary;

- (NSString *)toJSONString;
@end
