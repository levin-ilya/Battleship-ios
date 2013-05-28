//
//  WinnerController.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/5/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface WinnerController : UIViewController{
    GameModel *game;
}
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;



@end
