//
//  avanzado.h
//  WebService
//
//  Created by Jamart on 6/19/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface avanzado : NSObject 
-(NSString*) ObtenerDatos:(NSString*) phone;
-(NSString*) ValidarDispositivo:(NSString*) phone;
-(NSString*) ObtenerHistorial:(NSString*) phone Inicio:(NSString*) start Fin:(NSString*) end;

@end
