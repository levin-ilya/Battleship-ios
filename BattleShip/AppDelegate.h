//
//  AppDelegate.h
//  BattleShip
//
//  Created by ILYA LEVIN on 3/30/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) GameModel *game;

@end
