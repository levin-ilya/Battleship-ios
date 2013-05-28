//
//  GameController.h
//  BattleShip
//
//  Created by ILYA LEVIN on 3/30/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "GameModel.h"
#import "RowNum.h"
#import "ColNum.h"

@interface GameController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>{
    GameModel *game;
}


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BoardWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *BoardHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ColNumWidth;
@property (weak, nonatomic) IBOutlet RowNum *rowCollectionView;
@property (weak, nonatomic) IBOutlet ColNum *colCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *timer;

-(void)updateRowColNumbers:(NSInteger)position;
-(NSObject *)updateTimer:(NSNumber *)withTime;


@end
