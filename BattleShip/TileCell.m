//
//  Tile.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "TileCell.h"
#import "GameModel.h"
#import "AppDelegate.h"

@implementation TileCell


@synthesize imageView;
@synthesize position;
@synthesize game;
@synthesize controller;

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

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    TileType state = [game rotateTile:self.position];
    if(state==WATER){
        self.imageView.image = [UIImage imageNamed:@"water2.jpg"];
    }else if(state==SHIPBLOCK){
        self.imageView.image = [UIImage imageNamed:@"tdbig_pencil.png"];
    }else if(state==BLANK){
        self.imageView.image = [UIImage imageNamed:@"playfield.png"];
    }
    [controller updateRowColNumbers:self.position];
    
}


@end
