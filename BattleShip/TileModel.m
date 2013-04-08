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
@synthesize canChangeState;

-(id)initwithType:(TileType)type{
    self.tileState=type;
    self.canChangeState=true;
    return self;
}

-(TileType)rotateState{
    if(canChangeState){
        if(self.tileState==BLANK){
            self.tileState=WATER;
        }else if(self.tileState==WATER){
            self.tileState=SHIPBLOCK;
        }else if(self.tileState==SHIPBLOCK){
            self.tileState=BLANK;
        }
    }
    return self.tileState;
}

- (BOOL)isEqualTo:(id)tile{
    TileModel *compare2 = (TileModel *)tile;
    Boolean results = self.tileState==compare2.tileState;
    return results;
    
}

@end
