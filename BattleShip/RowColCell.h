//
//  RowColCell.h
//  BattleShip
//
//  Created by ILYA LEVIN on 4/3/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowColCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UILabel *label;
@property(readwrite,nonatomic) NSInteger position;

@end
