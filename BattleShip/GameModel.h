//
//  GameModel.h
//  BattleShip
//
//  Created by ILYA LEVIN on 3/31/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"


@interface GameModel : NSObject{
    
     NSMutableArray *currentBoard;
     NSMutableArray *anwserBoard;
    
}


@property(assign,readwrite) int boardsize;
-(id)initWithLevel:(int)level;
-(Tile *)getTileState:(int)position;


@end
