//
//  rowColCell.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/3/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "RowColCell.h"

@implementation RowColCell

@synthesize label;
@synthesize position;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
