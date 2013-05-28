//
//  WinnerController.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/5/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "WinnerController.h"
#import "AppDelegate.h"
#import "GameModel.h"

@interface WinnerController ()

@end

@implementation WinnerController

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
    [self ScoreLabel].text = [[NSString alloc] initWithFormat:@"%d",game.time];
    [game submitScore:game.time];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
