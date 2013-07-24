//
//  wsavanzado.m
//  WebService
//
//  Created by Jamart on 6/19/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import "wsavanzado.h"
#import "ServiceBusSvc.h"

@implementation wsavanzado


-(NSString*) ObtenerDatos:(NSString *) _phone {
    NSString *resultado;
    
    ServiceBusBinding  *binding = [[ServiceBusSvc ServiceBusBinding] initWithAddress:@"http://internet.claro.com.gt/sbus/bus.php?wsdl"];
    binding.logXMLInOut = YES;
    [binding user_phoneUsingConfig: @" " country:@"502" phone:_phone];
    
    resultado =[[[binding.phoneresult stringByReplacingOccurrencesOfString: @"&lt;" withString: @"<"]
            stringByReplacingOccurrencesOfString: @"&gt;" withString: @">"]
             stringByReplacingOccurrencesOfString: @"&quot;" withString: @"\""];
    
    return resultado;
}

-(NSString*) ValidarDispositivo:(NSString *) _phone {
    NSString *resultado;
    
    ServiceBusBinding  *binding = [[ServiceBusSvc ServiceBusBinding] initWithAddress:@"http://internet.claro.com.gt/sbus/bus.php?wsdl"];
    binding.logXMLInOut = YES;
    [binding user_claro_typeUsingConfig:@" " country:@"502" phone:_phone];
    
    resultado =[[[binding.phoneresultClaroType stringByReplacingOccurrencesOfString: @"&lt;" withString: @"<"]
          stringByReplacingOccurrencesOfString: @"&gt;" withString: @">"]
         stringByReplacingOccurrencesOfString: @"&quot;" withString: @"\""];
    
    return resultado;
}

-(NSString*) ObtenerHistorial:(NSString*) _phone Inicio:(NSString *) _start Fin:(NSString *) _end {
    NSString *resultado;
    
    ServiceBusBinding  *binding = [[ServiceBusSvc ServiceBusBinding] initWithAddress:@"http://internet.claro.com.gt/sbus/bus.php?wsdl"];
    
    [binding user_get_package_listUsingConfig:@" " country:@"502" phone:@"42299259" start:@"2013-02-01T15:00:00" end:@"2013-02-02T15:00:00"];
    
    resultado =[[[binding.resultObtenerHistorial stringByReplacingOccurrencesOfString: @"&lt;" withString: @"<"]
          stringByReplacingOccurrencesOfString: @"&gt;" withString: @">"]
         stringByReplacingOccurrencesOfString: @"&quot;" withString: @"\""];
        
    return resultado;
}

@end
