//
//  OrderedDictionary.m
//  DMS
//
//  Created by 娄继伟 on 17/1/10.
//  Copyright (c) 2017 Lou Jiwei. All rights reserved.
//

#import "OrderedDictionary.h"

@implementation OrderedDictionary {

    NSMutableDictionary *_dictionary;
    NSMutableArray *_sortedArray;

}


- (OrderedDictionary *)initWithDictionary:(NSMutableDictionary *)dictionary {

    self = [super init];
    if (self) {

        _dictionary = [[NSMutableDictionary alloc] initWithDictionary:dictionary];

        NSArray *keys = [_dictionary allKeys];

        _sortedArray = [[NSMutableArray alloc] initWithArray:
                [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {

                    return [obj1 compare:obj2 options:NSNumericSearch];
                }]];

    }

    return self;
}


- (NSString *)toJSONString {

    NSMutableString *jsonString = [[NSMutableString alloc] init];

    [jsonString appendString:@"{"];

    for (int i = 0; i < _sortedArray.count; i++) {

        id value = _dictionary[_sortedArray[i]];

        if (value == nil) {
            continue;
        } else if ([value isKindOfClass:[NSString class]]) {
            // 如果是string
            [jsonString appendFormat:@"\"%@\":\"%@\"", _sortedArray[i], value];

        } else if ([value isKindOfClass:[NSArray class]]) {
            // 如果是array
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:value options:0 error:nil];
            NSString *arrayString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            [jsonString appendFormat:@"\"%@\":%@", _sortedArray[i], arrayString];

        } else if ([value isKindOfClass:[OrderedDictionary class]]) {
            // 如果是OrderedDictionary
            [jsonString appendFormat:@"\"%@\":%@", _sortedArray[i], [value toJSONString]];

        } else if ([value isKindOfClass:[NSDictionary class]]) {
            // 如果是dictionary, 先转成OrderedDictionary
            OrderedDictionary *orderedDictionary = [[OrderedDictionary alloc] initWithDictionary:value];
            [jsonString appendFormat:@"\"%@\":%@", _sortedArray[i], [orderedDictionary toJSONString]];
        } else {
            continue;
        }

        if (i < _sortedArray.count - 1) {
            [jsonString appendString:@","];
        }
    }

    [jsonString appendString:@"}"];

    return jsonString;
}
@end
