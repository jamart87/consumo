//
//  JPluginCom.m
//  Consumo_Datos
//
//  Created by Jamart on 6/21/13.
//
//

#import "JPluginCom.h"
#import <Cordova/CDV.h>
#import "basico.h"
#import "wsavanzado.h"
#import "globals.h"


@implementation JPluginCom

@synthesize list;
@synthesize blackList;


- (void)echo:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    echo = @"GEORGE THE BEST";
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// TIPO DISPOSITIVO
- (void)tipo_dispositivo:(CDVInvokedUrlCommand *)command
{
    NSString *deviceType = [UIDevice currentDevice].model;
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deviceType];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// OBTENER NUMERO
- (void)devicenumber:(CDVInvokedUrlCommand *)command
{
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"SBFormattedPhoneNumber"];
    
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:phoneNumber];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// VERIFICA SI EL NUMERO ES CLARO
- (void)isclaro:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* phone = [command.arguments objectAtIndex:0];
    // INSTANCIAR VARIABLES
    NSString* resultado;
    CDVPluginResult* pluginResult = nil;
    
    // CREAR OBJETO WEB SERVICE BASICO
    basico *instancia = [[basico alloc] init];
    
    //LLAMAR A METODO QUE VALIDA NUMERO
    resultado = [instancia ValidarNumero:phone];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// SEND SMS
- (void)sendSMS:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* phone = [command.arguments objectAtIndex:0];
    NSString* msg = [command.arguments objectAtIndex:1];
    
    // INSTANCIAR VARIABLES
    NSString* resultado;
    CDVPluginResult* pluginResult = nil;
    
    // CREAR OBJETO WEB SERVICE BASICO
    basico *instancia = [[basico alloc] init];
    
    //LLAMAR A METODO QUE VALIDA NUMERO
    resultado = [instancia EnviarSMS:phone Mensaje:msg];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// OBTENER DATOS
- (void)userphone:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* phone = [command.arguments objectAtIndex:0];
    
    // INSTANCIAR VARIABLES
    NSString* resultado;
    CDVPluginResult* pluginResult = nil;
    
    // CREAR OBJETO WEB SERVICE BASICO
    wsavanzado *instancia = [[wsavanzado alloc] init];
    
    //LLAMAR A METODO QUE VALIDA NUMERO
    resultado = [instancia ObtenerDatos:phone];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// VALIDAR TELEFONO SI ES MODEM / SIM
- (void)clarotype:(CDVInvokedUrlCommand *)command
{
   // GET VALUES FROM FUNCTION
    NSString* phone = [command.arguments objectAtIndex:0];
    
    // INSTANCIAR VARIABLES
    NSString* resultado;
    CDVPluginResult* pluginResult = nil;
    
    // CREAR OBJETO WEB SERVICE BASICO
    wsavanzado *instancia = [[wsavanzado alloc] init];
    
    
    //LLAMAR A METODO QUE VALIDA NUMERO
    resultado = [instancia ValidarDispositivo:phone];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// OBTENER HISTORIAL
- (void)obtenerHistorial:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* phone = [command.arguments objectAtIndex:0];
    NSString* start = [command.arguments objectAtIndex:1];
    NSString* end = [command.arguments objectAtIndex:2];
    
    // INSTANCIAR VARIABLES
    NSString* resultado;
    CDVPluginResult* pluginResult = nil;
    
    // CREAR OBJETO WEB SERVICE BASICO
    wsavanzado *instancia = [[wsavanzado alloc] init];
    
    //LLAMAR A METODO QUE VALIDA NUMERO
    resultado = [instancia ObtenerHistorial:phone Inicio:start Fin:end];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// REGISTRAR ALARMA
- (void)registeralarms:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* numeros = [command.arguments objectAtIndex:0];
   
    // GENERAR STRING A VECTOR
    NSArray *alarmas = [numeros componentsSeparatedByString:@","];
    // VECTOR GLOBAL QUE GUARDA ALARMAS
    [[globals sharedGlobalData].lista addObject:alarmas];
    
    NSString* resultado = @"";
    CDVPluginResult* pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// Borrar Alarma
- (void)removealarms:(CDVInvokedUrlCommand *)command
{
    // GET VALUES FROM FUNCTION
    NSString* alarmKey = [command.arguments objectAtIndex:0];
    NSArray *alarmas = [[NSArray alloc] init];
    int indice = 0;
    int find = 0;
    
    for ( alarmas in  [globals sharedGlobalData].lista)
        {
            if ([[alarmas objectAtIndex:0] integerValue] == [alarmKey integerValue]){
                // ADDING TO THE BLACKLIST
                [[globals sharedGlobalData].blacklist addObject:alarmas];
                find++;
                break;
            }
            indice++;
        }
    
        if (find == 1) {
            // REMOVIN FROM THE LIST
            [[globals sharedGlobalData].lista removeObjectAtIndex:indice];
        }
    
    NSString* resultado = @"REMOVED SUCCESFULLY";
    CDVPluginResult* pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// Borrar Alarma
- (void)readremovedalarms:(CDVInvokedUrlCommand *)command
{
    NSString *listado = @"";
    int len = [[globals sharedGlobalData].blacklist count];
    int i = 0;
    NSArray *alarmas = [[NSArray alloc] init];
    CDVPluginResult* pluginResult = nil;
    
    for (alarmas in [globals sharedGlobalData].blacklist) {
        listado = [listado stringByAppendingString:[alarmas objectAtIndex:0]];
        if (i!=(len-1))
            listado = [listado stringByAppendingString:@","];
        i++;
    }
    
    [[globals sharedGlobalData].blacklist removeAllObjects];
    /*for (int i=0;i<len;i++){
        listado = listado + Configuracion.blacklist.get(i);
        if (i!=(len-1))
            listado = listado + ",";
    }*/

    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:listado];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

// Borrar Alarma
- (void)exit:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"exit"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
