//
//  Tile.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum Tile{BLANK=1,SHIPBLOCK,WATER} TileType;

@interface Tile : NSObject


@property(readwrite,nonatomic) TileType state;
-(id)initwithType:(TileType)type;
@end
