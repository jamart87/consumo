//
//  basico.h
//  WebService
//
//  Created by Jamart on 6/18/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface basico : NSObject

-(NSString*) ValidarNumero:(NSString*) phone;
-(NSString*) EnviarSMS:(NSString*) phone Mensaje:(NSString*) datos;


@end
