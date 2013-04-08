//
//  BattleShipTests.m
//  BattleShipTests
//
//  Created by ILYA LEVIN on 3/30/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "BattleShipTests.h"
#import "GameModel.h"
#import "TileModel.h"

@implementation BattleShipTests


- (void)setUp
{
    [super setUp];
    // Set-up code here.
    gameTest = [[GameModel alloc] initWithLevel:1];
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
    gameTest=nil;
}

- (void)testisWinner
{
    gameTest = [[GameModel alloc] initWithLevel:0];
    [gameTest rotateTile:0]; // switch to water
    [gameTest rotateTile:1];
    [gameTest rotateTile:2];
    [gameTest rotateTile:2];// switch to ship
    [gameTest rotateTile:3];
    [gameTest rotateTile:4];
    [gameTest rotateTile:5];
    [gameTest rotateTile:6];
    [gameTest rotateTile:7];
    [gameTest rotateTile:8];
    Boolean results = [gameTest isWinner];
    STAssertTrue(results==YES,@"isWinner Test");
}


-(void)testTileModelisEqualisTrue{
    TileModel *a=[[TileModel alloc] initwithType:WATER];
    TileModel *b=[[TileModel alloc] initwithType:WATER];
    STAssertTrue([a isEqualTo:b],@"these two objects should be equal");
}

-(void)testTileModelisEqualisFails{
    TileModel *a=[[TileModel alloc] initwithType:WATER];
    TileModel *b=[[TileModel alloc] initwithType:SHIPBLOCK];
    STAssertFalse([a isEqualTo:b],@"these two objects should not be equal");
}

-(void)testSaveAndGetScore{
    //[gameTest getTopScores];
    [gameTest submitScore:1];
    [gameTest submitScore:2];
    [gameTest submitScore:3];
    NSArray *newScores = [gameTest getTopScores];
    for(NSString *i in newScores){
        NSLog(i);
    }
    STAssertTrue([[newScores objectAtIndex:0] isEqual:@"1"],nil);
    STAssertTrue([[newScores objectAtIndex:1] isEqual:@"2"],nil);
    STAssertTrue([[newScores objectAtIndex:2] isEqual:@"3"],nil);
    
}
@end
