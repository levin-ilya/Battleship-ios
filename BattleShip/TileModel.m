//
//  Tile.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "TileModel.h"



@implementation TileModel

@synthesize tileState;

-(id)initwithType:(TileType)type{
    self.tileState=type;
    return self;
}

-(TileType)rotateState{
    if(self.tileState==BLANK){
        self.tileState=WATER;
    }else if(self.tileState==WATER){
        self.tileState=SHIPBLOCK;
    }else if(self.tileState==SHIPBLOCK){
        self.tileState=BLANK;
    }
    return self.tileState;
}


@end
