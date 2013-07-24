//
//  JPluginCom.h
//  Consumo_Datos
//
//  Created by Jamart on 6/21/13.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <MessageUI/MessageUI.h>


@interface JPluginCom : CDVPlugin
<MFMailComposeViewControllerDelegate>
{
	
	
}

@property (readwrite, strong) NSMutableArray * list;
@property (readwrite, strong) NSMutableArray * blackList;

- (void)echo:(CDVInvokedUrlCommand*)command;
// FUNCIONES WEB SERVICE BASICO
- (void)isclaro:(CDVInvokedUrlCommand*)command;
- (void)sendSMS:(CDVInvokedUrlCommand*)command;
// FUNCIONES WEB SERVICE AVANZADO
- (void)userphone:(CDVInvokedUrlCommand*)command;
- (void)clarotype:(CDVInvokedUrlCommand*)command;

// FUNCIONES EXTRAS
- (void)tipo_dispositivo:(CDVInvokedUrlCommand*)command;
- (void)devicenumber:(CDVInvokedUrlCommand*)command;
- (void)obtenerHistorial:(CDVInvokedUrlCommand*)command;

//alarmas
- (void)registeralarms:(CDVInvokedUrlCommand*)command;
- (void)removealarms:(CDVInvokedUrlCommand*)command;
- (void)readremovedalarms:(CDVInvokedUrlCommand *)command;

// email
- (void)exit:(CDVInvokedUrlCommand *)command;



@end
