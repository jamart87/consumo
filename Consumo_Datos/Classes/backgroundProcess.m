//
//  backgroundProcess.m
//  SlowCount
//
//  Created by Jamart on 6/26/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import "backgroundProcess.h"
#import "globals.h"
#import "XmlParser.h"

@implementation backgroundProcess

- (void)countUp {
    NSString *currentCount, *numero;
    int porcentajeConsumido, porcentajeAlarma;
    NSMutableArray *key;
    XmlParser *xml = [[XmlParser alloc] init];
    
    if (count==30) {
        [theTimer invalidate];
        [[UIApplication sharedApplication] endBackgroundTask:counterTask];
    } else {
        if (count == 15) {
           
           for (key in [globals sharedGlobalData].lista) {
               
               porcentajeAlarma = [[key objectAtIndex:1] integerValue];
               numero = [key objectAtIndex:2];
               
               porcentajeConsumido = [xml getPorcentajeFromXML:numero];
               
               if (porcentajeConsumido >= porcentajeAlarma)
               {
                   [self Alerta:[NSString stringWithFormat:@"Su porcentaje consumido es %ld %%",(long)porcentajeConsumido]];
                   //add to blacklist
                   [[globals sharedGlobalData].blacklist addObject:key];
                   // Eliminar Alarma
                   [[globals sharedGlobalData].lista removeObject:key];
               }
            }
            
            count=0;
        }
        count++;
        currentCount=[[NSString alloc] initWithFormat:@"%d",count];
    }

}

-(void)Alerta:(NSString *) msg {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [[NSDate alloc] initWithTimeIntervalSinceNow:0];
    notification.alertBody = msg;
    notification.alertAction = @"Consumo de Datos";
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.hasAction = YES;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

-(void) StartBackgroundTask {
    //START BACKGROUND TASK
    counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
                       // If you're worried about exceeding 10 minutes, handle it here
                   }];
    
    //INICIALIZAR TIMER
    count=0;
    theTimer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
}


-(void) StopBackgroundTask {
    [theTimer invalidate];
    [[UIApplication sharedApplication] endBackgroundTask:counterTask];
}


@end
