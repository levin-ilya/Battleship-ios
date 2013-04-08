//
//  HighScoreController.m
//  BattleShip
//
//  Created by ILYA LEVIN on 4/7/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "HighScoreController.h"
#import "GameModel.h"
#import "AppDelegate.h"

@interface HighScoreController ()

@end

@implementation HighScoreController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [GameModel.getTopScores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topScore" forIndexPath:indexPath];
    UILabel *topScoreText = [[UILabel alloc] initWithFrame:CGRectMake(50,10, 40, 40)];
    topScoreText.text = [GameModel.getTopScores objectAtIndex:indexPath.item];
    //topScoreText.text = @"100";
    [cell addSubview:topScoreText];
    return cell;
}






- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
