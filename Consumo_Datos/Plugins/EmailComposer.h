//
//  EmailComposer.h
//  Consumo_Datos
//
//  Created by Jamart on 7/3/13.
//
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Cordova/CDVPlugin.h>


@interface EmailComposer : CDVPlugin < MFMailComposeViewControllerDelegate > {
    
    
}

- (void) showEmailComposer:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end