//
//  avanzado.m
//  WebService
//
//  Created by Jamart on 6/19/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import "avanzado.h"
#import "ServiceBusSvc.h"

@implementation avanzado

-(NSString*) ObtenerDatos:(NSString *) _phone {

    NSString *texto;
    
    ServiceBusBinding *binding = [ServiceBusSvc ServiceBusBinding];
    
    //ServiceBusBinding *binding = [ServiceBusSvc ServiceBusBinding];
    //Service1SoapBinding *binding = [[Service1Svc Service1SoapBinding] initWithAddress:@"http://200.6.192.205/Send_SMS/Service1.asmx"];
    binding.logXMLInOut = YES;  // to get logging to the console.
    
    ServiceBusBindingResponse *resp = [binding user_phoneUsingConfig:@"x" country:@"502" phone:@"42299259"];
    //Service1SoapBindingResponse *resp = [binding IsClaro_PhoneUsingParameters:request];
    
    for (id mine in resp.bodyParts)
        {
            if ([mine isKindOfClass:[ServiceBusBindingResponse class]])
            {
                texto = [mine result];
            }
        }
    return texto;
}
@end
