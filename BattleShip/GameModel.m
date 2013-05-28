//
//  GameModel.m
//  BattleShip
//
//  Created by ILYA LEVIN on 3/31/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "GameModel.h"
#import "TileModel.h"


@implementation GameModel

@synthesize boardsize;
@synthesize time;


-(id)initWithLevel:(int)level{
    [self loadLevel:level];
    time = 0;
    [self revealSomeTiles];
    return self;
}

-(void)registerTimerLister:(id)object method:(SEL)methodName{
    timerWatcher = object;
    timeWatcherMethod = methodName;
}

-(void)startTimer{
    ticker = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

-(void)stopTimer{
    [ticker invalidate];
}

-(void)updateTimer{
    time++;
    [timerWatcher performSelector:timeWatcherMethod withObject:[[NSNumber alloc] initWithInt:time]];
    
}


-(void)revealSomeTiles{
   int numberOfTiles = arc4random() % 4;
   for(int index=0;index<numberOfTiles;index++){
        int randomPostion = arc4random() % (boardsize *boardsize);
       [self revealTileAtPos:randomPostion];
    }
    
}

-(void)revealTileAtPos:(int)pos{
    TileModel *showAnswer = [[TileModel alloc] initwithType:[[answerBoard objectAtIndex:pos] tileState]];
    showAnswer.canChangeState=NO;
    [currentBoard replaceObjectAtIndex:pos withObject:showAnswer];
}



-(void)loadLevel:(int)level{
    NSString *prefixFileName = @"level";
    NSString *fileName = [prefixFileName stringByAppendingString:[NSString stringWithFormat:@"%d",level]];
    NSString* content = [self readFile:fileName fileType:@"txt"];
    NSArray *lines = [content componentsSeparatedByString:@"\r\n"];
    [self setupBoardSize:[[lines objectAtIndex:0] integerValue]];
    // line 2 is where the file starts to describe where shipblocks are
    for (int i=2; i<[lines count];i++) {
        NSInteger shipBlockPos = [[lines objectAtIndex:i] integerValue];
        [answerBoard replaceObjectAtIndex:shipBlockPos withObject:[[TileModel alloc] initwithType:SHIPBLOCK]];
    }
    
    [self setupAnswersRowNum];
    [self setupAnswersColNum];
}

-(void)setupBoardSize:(int)size{
    self.boardsize=size;
    rowAnswersNums = [NSMutableArray arrayWithCapacity:size];
    colAnswersNums = [NSMutableArray arrayWithCapacity:size];
    currentBoard = [NSMutableArray arrayWithCapacity:size*size];
    answerBoard = [NSMutableArray arrayWithCapacity:size*size];
    for(int i=0;i<(size*size);i++){
        [answerBoard addObject:[[TileModel alloc] initwithType:WATER]];
        [currentBoard addObject:[[TileModel alloc] initwithType:BLANK]];
    }
}

-(void)setupAnswersRowNum{
    for(int i=0;i<boardsize;i++){
       [rowAnswersNums addObject:[NSNumber numberWithInt:[self answerRowCount:i]]];
    }
}

-(void)setupAnswersColNum{
    for(int i=0;i<boardsize;i++){
        [colAnswersNums addObject:[NSNumber numberWithInt:[self answerColCount:i]]];
    }
}


-(TileModel *)getTileState:(int)position{
    return [currentBoard objectAtIndex:position];
}

-(TileType)rotateTile:(NSInteger)position{
   return [[currentBoard objectAtIndex:position] rotateState];
}

-(NSInteger)answerRowCount:(NSInteger)row{
  return [self rowCount:row applyToBoard:answerBoard];
}

-(NSInteger)rowCount:(NSInteger)row applyToBoard:(NSMutableArray *)board{
    NSInteger results=0;
    int startloop = row*boardsize;
    int endloop = startloop+(boardsize-1);
    
    for(int i=startloop;i<=endloop;i++){
        if([[board objectAtIndex:i] tileState]==SHIPBLOCK){
            results++;
        }
    }
    return results;
}

-(NSInteger)answerColCount:(NSInteger)col{
   return [self colCount:col applyToBoard:answerBoard];
}

-(NSInteger)colCount:(NSInteger)col applyToBoard:(NSMutableArray *)board{
    NSInteger results=0;
    int startloop=col;
    int endloop=col+boardsize*(boardsize-1);
    for(int i=startloop;i<=endloop;i=i+boardsize){
        if([[board objectAtIndex:i] tileState]==SHIPBLOCK){
            results++;
        }
    }
   
    return results;
}

-(Boolean)isRowOver:(NSInteger)row{
    NSNumber *currentCount = [NSNumber numberWithInt:[self rowCount:row applyToBoard:currentBoard]];
    NSNumber *answerCount = [rowAnswersNums objectAtIndex:row];
    return (currentCount.doubleValue > answerCount.doubleValue);
}

-(Boolean)isColOver:(NSInteger)col{
    NSNumber *currentCount = [NSNumber numberWithInt:[self colCount:col applyToBoard:currentBoard]];
    NSNumber *answerCount = [colAnswersNums objectAtIndex:col];
    return (currentCount.doubleValue > answerCount.doubleValue);
}

-(Boolean)isWinner{
    Boolean results = true;
    for(int i=0;i<[answerBoard count];i++){
        if(![[answerBoard objectAtIndex:i] isEqualTo:[currentBoard objectAtIndex:i]]){
            results = false;
            break;
        }
            
    }
    
    return results;
}

-(void)submitScore:(int)score{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"scores" ofType:@"plist"];
    // get score
    NSMutableArray *scores = [NSMutableArray arrayWithContentsOfFile:path];
    // add to score
    for (int index=0;index<[scores count];index++){
        if(score<[[scores objectAtIndex:index] integerValue]){
            [scores insertObject:[NSString stringWithFormat:@"%d",score] atIndex:index];
            break;
        }
    }
    
    
    // write to score
    [scores writeToFile:path atomically:NO];
    
    
}

+(NSArray *)getTopScores{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"scores" ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

-(NSString *)readFile:(NSString *)fileName fileType:(NSString *)type{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName
                                                     ofType:type];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:Nil];
    return content;
}

-(TileType)getState:(NSInteger)pos{
    return [[currentBoard objectAtIndex:pos] tileState];
}


@end
