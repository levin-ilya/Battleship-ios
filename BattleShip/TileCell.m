//
//  Tile.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "TileCell.h"

@implementation TileCell


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView.image = [UIImage imageNamed:@"playfield.png"];
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
