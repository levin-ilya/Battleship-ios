//
//  Tile.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/2/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TileCell : UICollectionViewCell

@property(strong,nonatomic) IBOutlet UIImageView *imageView;
@property(strong,nonatomic) NSString *state;
@end
