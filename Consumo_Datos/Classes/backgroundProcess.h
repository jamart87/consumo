//
//  backgroundProcess.h
//  SlowCount
//
//  Created by Jamart on 6/26/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface backgroundProcess : NSObject {
    int count;
    NSTimer *theTimer;
    UIBackgroundTaskIdentifier counterTask; }

-(void) StartBackgroundTask;
-(void) StopBackgroundTask;

@end
