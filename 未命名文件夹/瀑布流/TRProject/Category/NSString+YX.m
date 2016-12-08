//
//  NSString+YX.m
//  TRProject
//
//  Created by tarena on 2016/11/14.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)
- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}
@end
