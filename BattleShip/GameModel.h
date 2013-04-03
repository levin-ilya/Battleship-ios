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
    
}


@property(assign,readwrite) int boardsize;
-(id)initWithLevel:(int)level;
-(TileModel *)getTileState:(int)position;
-(TileType)rotateTile:(NSInteger)position;
-(NSInteger)rowCount:(NSInteger)row;
-(NSInteger)colCount:(NSInteger)col;


@end
