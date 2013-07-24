//
//  XmlParser.h
//  x
//
//  Created by Jamart on 6/28/13.
//  Copyright (c) 2013 Jamart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlParser : NSObject

@property (nonatomic,readwrite,strong) NSString *currentTagContent;
@property (nonatomic,readwrite,strong) NSMutableArray *arrayFila;

-(NSInteger)getPorcentajeFromXML:(NSString *) phone;

@end
