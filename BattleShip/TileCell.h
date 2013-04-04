//
//  Tile.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#import "AppDelegate.h"
#import "GameController.h"


@interface TileCell : UICollectionViewCell

@property(strong,nonatomic) IBOutlet UIImageView *imageView;
@property(readwrite,nonatomic) NSInteger position;
@property(strong,nonatomic) GameModel *game;
@property(strong,nonatomic) GameController *controller;
@end
