//
//  GameModel.m
//  BattleShip
//
//  Created by ILYA LEVIN on 3/31/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "GameModel.h"
#import "Tile.h"


@implementation GameModel

@synthesize boardsize;

-(id)initWithLevel:(int)level{
    Tile *blankTile = [[Tile alloc] initwithType:BLANK];
    if(level==1){
        self.boardsize=2;
        currentBoard = [NSMutableArray arrayWithCapacity:boardsize*boardsize];
        for (int i=0; i<boardsize*boardsize; i++) {
            [currentBoard addObject:blankTile];
        }
        anwserBoard = [currentBoard copy];
        [[anwserBoard objectAtIndex:1] setState:SHIPBLOCK];
        
    }
    return self;
}

-(Tile *)getTileState:(int)position{
    return [currentBoard objectAtIndex:position];
}


@end
