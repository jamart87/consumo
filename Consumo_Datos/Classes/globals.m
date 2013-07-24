//
//  globals.m
//  Consumo_Datos
//
//  Created by Jamart on 6/28/13.
//
//

#import "globals.h"

@implementation globals

@synthesize message;
@synthesize lista;
@synthesize blacklist;

static globals *sharedGlobalData = nil;

+ (globals*)sharedGlobalData {
    if (sharedGlobalData == nil) {
        sharedGlobalData = [[super allocWithZone:NULL] init];
        
        // initialize your variables here
        sharedGlobalData.message = @"Default Global Message";
        sharedGlobalData.lista = [[NSMutableArray alloc] init];
        sharedGlobalData.blacklist = [[NSMutableArray alloc] init];
    }
    return sharedGlobalData;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self)
    {
        if (sharedGlobalData == nil)
        {
            sharedGlobalData = [super allocWithZone:zone];
            return sharedGlobalData;
        }
    }
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (id)autorelease {
    return self;
}

// this is my global function
- (void)myFunc {
    self.message = @"Some Random Text";
}

@end
