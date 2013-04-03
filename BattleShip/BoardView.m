//
//  BoardView.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/1/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "BoardView.h"
#import "AppDelegate.h"
#import "GameModel.h"
#import "Tile.h"
#import "TileCell.h"

@implementation BoardView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    //Tile *t =[game getTileState:indexPath.item];
  TileCell *cell = [self dequeueReusableCellWithReuseIdentifier:@"tile" forIndexPath:indexPath];
  cell.imageView.backgroundColor = [UIColor whiteColor];
//    if(t.state==BLANK){
//        cell.imageView.image = nil;
//        cell.imageView.backgroundColor = [UIColor whiteColor];
//    }else if (t.state==WATER){
//        cell.imageView.image = [UIImage imageNamed:@"water2.jpg"];
//    }else if(t.state==SHIPBLOCK){
//        cell.imageView.image = [UIImage imageNamed:@"tdbig_pencil,png"];
//    }
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   // return game.boardsize;
    return 4;
}
//
//-(void)viewDidLoad{
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    game = app.game;
//    
//}


@end
