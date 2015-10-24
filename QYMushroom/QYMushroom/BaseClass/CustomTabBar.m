//
//  CustomTabBar.m
//  QYMushroom
//
//  Created by 李祖建 on 15/10/23.
//  Copyright © 2015年 RecordTeam. All rights reserved.
//

#import "CustomTabBar.h"

@implementation CustomTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomTabBar" owner:self options:nil] lastObject];
        self.frame = FLEFRAME(self.frame);
    }
    return self;
}

@end
