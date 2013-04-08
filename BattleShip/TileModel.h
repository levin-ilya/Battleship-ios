//
//  Tile.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Tile{BLANK,SHIPBLOCK,WATER} TileType;

@interface TileModel : NSObject


@property(readwrite,nonatomic) TileType tileState;
@property(readwrite,nonatomic) Boolean canChangeState;
-(id)initwithType:(TileType)type;
-(TileType)rotateState;
- (BOOL)isEqualTo:(id)tile;

@end
