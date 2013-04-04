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
    
}


@property(assign,readwrite) int boardsize;
-(id)initWithLevel:(int)level;
-(TileModel *)getTileState:(int)position;
-(TileType)rotateTile:(NSInteger)position;
-(NSInteger)answerRowCount:(NSInteger)row;
-(NSInteger)answerColCount:(NSInteger)col;
-(Boolean)isRowOver:(NSInteger)row;


@end
