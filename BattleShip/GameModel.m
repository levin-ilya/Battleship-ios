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
        rowAnswersNums = [NSMutableArray arrayWithCapacity:boardsize];
        colAnswersNums = [NSMutableArray arrayWithCapacity:boardsize];
        currentBoard = [NSMutableArray arrayWithCapacity:boardsize*boardsize];
        answerBoard = [NSMutableArray arrayWithCapacity:boardsize*boardsize];
        for (int i=0; i<boardsize*boardsize; i++) {
            [currentBoard addObject:[[TileModel alloc] initwithType:BLANK]];
            [answerBoard addObject:[[TileModel alloc] initwithType:WATER]];
        }
        [[answerBoard objectAtIndex:0] setTileState:SHIPBLOCK];
        [self setupAnswersRowNum];
        [self setupAnswersColNum];
    }
    return self;
}

-(void)setupAnswersRowNum{
    for(int i=0;i<boardsize;i++){
       [rowAnswersNums addObject:[NSNumber numberWithInt:[self answerRowCount:i]]];
    }
}

-(void)setupAnswersColNum{
    for(int i=0;i<boardsize;i++){
        [colAnswersNums addObject:[NSNumber numberWithInt:[self answerColCount:i]]];
    }
}


-(TileModel *)getTileState:(int)position{
    return [currentBoard objectAtIndex:position];
}

-(TileType)rotateTile:(NSInteger)position{
   return [[currentBoard objectAtIndex:position] rotateState];
}

-(NSInteger)answerRowCount:(NSInteger)row{
  return [self rowCount:row applyToBoard:answerBoard];
}

-(NSInteger)rowCount:(NSInteger)row applyToBoard:(NSMutableArray *)board{
    NSInteger results=0;
    int startloop = row*boardsize;
    int endloop = startloop+(boardsize-1);
    
    for(int i=startloop;i<=endloop;i++){
        if([[board objectAtIndex:i] tileState]==SHIPBLOCK){
            results++;
        }
    }
    return results;
}

-(NSInteger)answerColCount:(NSInteger)col{
   return [self colCount:col applyToBoard:answerBoard];
}

-(NSInteger)colCount:(NSInteger)col applyToBoard:(NSMutableArray *)board{
    NSInteger results=0;
    int startloop=col;
    int endloop=boardsize*(boardsize-1);
    for(int i=startloop;i<=endloop;i=i+boardsize){
        if([[board objectAtIndex:i] tileState]==SHIPBLOCK){
            results++;
        }
    }
   
    return results;
}

-(Boolean)isRowOver:(NSInteger)row{
    NSNumber *currentCount = [NSNumber numberWithInt:[self rowCount:row applyToBoard:currentBoard]];
    NSNumber *answerCount = [rowAnswersNums objectAtIndex:row];
    return (currentCount.doubleValue > answerCount.doubleValue);
}

@end
