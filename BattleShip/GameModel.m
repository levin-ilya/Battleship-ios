//
//  GameModel.m
//  BattleShip
//
//  Created by ILYA LEVIN on 3/31/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "GameModel.h"
#import "TileModel.h"


@implementation GameModel

@synthesize boardsize;

-(id)initWithLevel:(int)level{
    if(level==1){
        self.boardsize=3;
        currentBoard = [NSMutableArray arrayWithCapacity:boardsize*boardsize];
        for (int i=0; i<boardsize*boardsize; i++) {
            [currentBoard addObject:[[TileModel alloc] initwithType:BLANK]];
        }
        answerBoard = [currentBoard copy];
        [[answerBoard objectAtIndex:1] setTileState:SHIPBLOCK];
        
    }
    return self;
}

-(TileModel *)getTileState:(int)position{
    return [currentBoard objectAtIndex:position];
}

-(TileType)rotateTile:(NSInteger)position{
   return [[currentBoard objectAtIndex:position] rotateState];
}

-(NSInteger)rowCount:(NSInteger)row{
    NSInteger results=0;
    int startloop = row*boardsize;
    int endloop = startloop-boardsize;
    // this loops down
    for(int i=startloop;i<=endloop;i--){
        if([[answerBoard objectAtIndex:i-1] tileState]==SHIPBLOCK){
            results++;
        }
    }
    return results;
}

-(NSInteger)colCount:(NSInteger)col{
    
}



@end
