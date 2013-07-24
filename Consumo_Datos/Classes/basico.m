//
//  basico.m
//  WebService
//
//  Created by Jamart on 6/18/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import "basico.h"
#import "Service1Svc.h"

@implementation basico


-(NSString*) ValidarNumero:(NSString *) _phone {
    NSString *texto;
    
    Service1SoapBinding *binding = [[Service1Svc Service1SoapBinding] initWithAddress:@"http://200.6.192.205/Send_SMS/Service1.asmx"];
   
    Service1Svc_IsClaro_Phone *request = [[Service1Svc_IsClaro_Phone alloc] init];
    
    request.user = @"c1@R025m5";
    request.pass = @"5m52c1@R0";
    request.area = @"502";
    request.phone = _phone;
    
    Service1SoapBindingResponse *resp = [binding IsClaro_PhoneUsingParameters:request];
    
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[Service1Svc_IsClaro_PhoneResponse class]])
        {
            NSNumber *numero = [mine IsClaro_PhoneResult];
            texto = [NSString stringWithFormat:@"%@", numero ];
        }
    }

    return texto;
}

-(NSString*) EnviarSMS:(NSString*) _phone Mensaje:(NSString*) _datos {
    NSString *texto;
    //NSString *Telefono = [NSString stringWithFormat:@"502%@", _phone];
    
    Service1SoapBinding *binding = [[Service1Svc Service1SoapBinding] initWithAddress:@"http://200.6.192.205/Send_SMS/Service1.asmx"];
    
    Service1Svc_Send_SMS *request = [[Service1Svc_Send_SMS alloc] init];
    
    request.user = @"c1@R025m5";
    request.pass = @"5m52c1@R0";
    request.to_phone = _phone;
    request.text = _datos;
    
    Service1SoapBindingResponse *resp = [binding Send_SMSUsingParameters:request];
    
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[Service1Svc_Send_SMSResponse class]])
       {
            texto = [mine Send_SMSResult];
       }
    }
    
    return texto;
 
}

@end
