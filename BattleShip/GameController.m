//
//  GameController.m
//  BattleShip
//
//  Created by ILYA LEVIN on 3/30/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "GameController.h"
#import "GameModel.h"
#import "TileCell.h"
#import "AppDelegate.h"
#import "RowNum.h"
#import "ColNum.h"
#import "RowColCell.h"

@interface GameController ()

@end

@implementation GameController

static float cellSize = 50;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


   

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    game = app.game;
    
    self.BoardHeight.constant = game.boardsize * cellSize;
    self.BoardWidth.constant = game.boardsize * cellSize;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger results;
    if([collectionView isMemberOfClass:[UICollectionView class]]){
        results = game.boardsize*game.boardsize;
    }else{
        results = game.boardsize;
    }
    return results;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell;
    if([collectionView isKindOfClass:[RowNum class]]){
        RowColCell *c = [collectionView dequeueReusableCellWithReuseIdentifier:@"rowNum" forIndexPath:indexPath];
        
        c.position = indexPath.item;
        c.label.text = [NSString stringWithFormat:@"%d", [game answerRowCount:indexPath.item]];
        if([game isRowOver:indexPath.item]){
            c.label.font = [UIFont boldSystemFontOfSize:20];
            c.label.textColor=[UIColor redColor];
        }else{
            c.label.font = [UIFont systemFontOfSize:20];
            c.label.textColor = [UIColor blackColor];
            }
        cell=c;
    }else if([collectionView isKindOfClass:[ColNum class]]){
        RowColCell *c = [collectionView dequeueReusableCellWithReuseIdentifier:@"colNum" forIndexPath:indexPath];
        
        c.position = indexPath.item;
        c.label.text = [NSString stringWithFormat:@"%d", [game answerColCount:indexPath.item]];;
        cell=c;
    }else{
        TileCell *t = [collectionView dequeueReusableCellWithReuseIdentifier:@"tile" forIndexPath:indexPath];
        t.imageView.image = [UIImage imageNamed:@"playfield.png"];
        t.position = indexPath.item;
        t.game=game;
        t.controller=self;
        cell=t;
        
    }
    return cell;
}

-(void)updateRowColNumbers:(NSInteger)position{
    NSInteger row = [self positionToRow:position];
  [self.rowCollectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]]];
}

-(NSInteger)positionToRow:(NSInteger)position{
    return (position/game.boardsize);
}


@end
