//
//  XmlParser.m
//  x
//
//  Created by Jamart on 6/28/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import "XmlParser.h"
#import "wsavanzado.h"

@implementation XmlParser

@synthesize currentTagContent;
@synthesize arrayFila;


-(NSInteger)getPorcentajeFromXML:(NSString *) phone{
    wsavanzado *wservice = [[wsavanzado alloc] init];
    
    NSString* str = [wservice ObtenerDatos:phone];
    
    int a, b, c, porcentaje = 0;
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSXMLParser* parser = [[NSXMLParser alloc] initWithData: data];
    
    //INICIALIZAR VECTOR DONDE SE ALMACENARAN DATOS
    self.arrayFila = [NSMutableArray array];
    // PARSEAMOS EL XML
    [parser setDelegate:self];
    [parser parse];
    
    for (a=0; a<[arrayFila count]; a++) {
        if (![[arrayFila objectAtIndex: a] isEqualToString: @"1"]) {
            NSLog (@"Codigo Paquete %@", [arrayFila objectAtIndex: a]);
            b= [[arrayFila objectAtIndex: a+1] integerValue];
            c= [[arrayFila objectAtIndex: a+2] integerValue];
            porcentaje = (c*100)/b;
            NSLog (@"Porcentaje Consumido %d",porcentaje);
            break;
        } else {a+=2;}
    }
    
    return porcentaje;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ( [elementName isEqualToString:@"CODIGO"])
    {
    }
    if ( [elementName isEqualToString:@"LIMITEDATOSMB"])
    {
        return;
    }
    
    if ( [elementName isEqualToString:@"CONSUMOMB"])
    {
        return;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
    if ( [elementName isEqualToString:@"CODIGO"])
    {
        [self.arrayFila addObject:self.currentTagContent];
    }
    if ([elementName isEqualToString:@"LIMITEDATOSMB"])
    {
        [arrayFila addObject:self.currentTagContent];
        
    }
    if ( [elementName isEqualToString:@"CONSUMOMB"])
    {
        [arrayFila addObject:self.currentTagContent];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    self.currentTagContent = string;
}


@end
