//
//  globals.h
//  Consumo_Datos
//
//  Created by Jamart on 6/28/13.
//
//

#import <Foundation/Foundation.h>

@interface globals : NSObject  {
    NSString *message;
    NSMutableArray *blacklist;
}

@property (nonatomic, retain) NSString *message;
@property (nonatomic, retain) NSMutableArray *lista;
@property (nonatomic, retain) NSMutableArray *blacklist;

+ (globals*) sharedGlobalData;

// global function
- (void) myFunc;

@end
