//
//  GameModel.h
//  BattleShip
//
//  Created by ILYA LEVIN on 3/31/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TileModel.h"


@interface GameModel : NSObject{
    
     NSMutableArray *currentBoard;
     NSMutableArray *answerBoard;
     NSMutableArray *rowAnswersNums;
     NSMutableArray *colAnswersNums;
    
     NSObject *timerWatcher;
     SEL timeWatcherMethod;
     NSTimer *ticker;
    
}


@property(assign,readwrite) int boardsize;
@property(assign,readonly) int time;
-(id)initWithLevel:(int)level;
-(TileModel *)getTileState:(int)position;
-(TileType)rotateTile:(NSInteger)position;
-(NSInteger)answerRowCount:(NSInteger)row;
-(NSInteger)answerColCount:(NSInteger)col;
-(Boolean)isRowOver:(NSInteger)row;
-(Boolean)isColOver:(NSInteger)col;
-(Boolean)isWinner;
-(void)startTimer;
-(void)stopTimer;
-(void)registerTimerLister:(id)object method:(SEL)methodName;
-(void)submitScore:(int)score;
-(TileType)getState:(NSInteger)pos;
+(NSArray *)getTopScores;


@end
