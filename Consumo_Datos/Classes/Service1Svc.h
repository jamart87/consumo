#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class Service1Svc_Send_SMS;
@class Service1Svc_Send_SMSResponse;
@class Service1Svc_IsClaro_Phone;
@class Service1Svc_IsClaro_PhoneResponse;
@interface Service1Svc_Send_SMS : NSObject {
	
/* elements */
	NSString * user;
	NSString * pass;
	NSString * to_phone;
	NSString * text;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1Svc_Send_SMS *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * user;
@property (retain) NSString * pass;
@property (retain) NSString * to_phone;
@property (retain) NSString * text;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1Svc_Send_SMSResponse : NSObject {
	
/* elements */
	NSString * Send_SMSResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1Svc_Send_SMSResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * Send_SMSResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1Svc_IsClaro_Phone : NSObject {
	
/* elements */
	NSString * user;
	NSString * pass;
	NSString * area;
	NSString * phone;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1Svc_IsClaro_Phone *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * user;
@property (retain) NSString * pass;
@property (retain) NSString * area;
@property (retain) NSString * phone;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface Service1Svc_IsClaro_PhoneResponse : NSObject {
	
/* elements */
	NSNumber * IsClaro_PhoneResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (Service1Svc_IsClaro_PhoneResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSNumber * IsClaro_PhoneResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "Service1Svc.h"
@class Service1SoapBinding;
@class Service1Soap12Binding;
@interface Service1Svc : NSObject {
	
}
+ (Service1SoapBinding *)Service1SoapBinding;
+ (Service1Soap12Binding *)Service1Soap12Binding;
@end
@class Service1SoapBindingResponse;
@class Service1SoapBindingOperation;
@protocol Service1SoapBindingResponseDelegate <NSObject>
- (void) operation:(Service1SoapBindingOperation *)operation completedWithResponse:(Service1SoapBindingResponse *)response;
@end
@interface Service1SoapBinding : NSObject <Service1SoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(Service1SoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (Service1SoapBindingResponse *)Send_SMSUsingParameters:(Service1Svc_Send_SMS *)aParameters ;
- (void)Send_SMSAsyncUsingParameters:(Service1Svc_Send_SMS *)aParameters  delegate:(id<Service1SoapBindingResponseDelegate>)responseDelegate;
- (Service1SoapBindingResponse *)IsClaro_PhoneUsingParameters:(Service1Svc_IsClaro_Phone *)aParameters ;
- (void)IsClaro_PhoneAsyncUsingParameters:(Service1Svc_IsClaro_Phone *)aParameters  delegate:(id<Service1SoapBindingResponseDelegate>)responseDelegate;
@end
@interface Service1SoapBindingOperation : NSOperation {
	Service1SoapBinding *binding;
	Service1SoapBindingResponse *response;
	id<Service1SoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) Service1SoapBinding *binding;
@property (readonly) Service1SoapBindingResponse *response;
@property (nonatomic, assign) id<Service1SoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(Service1SoapBinding *)aBinding delegate:(id<Service1SoapBindingResponseDelegate>)aDelegate;
@end
@interface Service1SoapBinding_Send_SMS : Service1SoapBindingOperation {
	Service1Svc_Send_SMS * parameters;
}
@property (retain) Service1Svc_Send_SMS * parameters;
- (id)initWithBinding:(Service1SoapBinding *)aBinding delegate:(id<Service1SoapBindingResponseDelegate>)aDelegate
	parameters:(Service1Svc_Send_SMS *)aParameters
;
@end
@interface Service1SoapBinding_IsClaro_Phone : Service1SoapBindingOperation {
	Service1Svc_IsClaro_Phone * parameters;
}
@property (retain) Service1Svc_IsClaro_Phone * parameters;
- (id)initWithBinding:(Service1SoapBinding *)aBinding delegate:(id<Service1SoapBindingResponseDelegate>)aDelegate
	parameters:(Service1Svc_IsClaro_Phone *)aParameters
;
@end
@interface Service1SoapBinding_envelope : NSObject {
}
+ (Service1SoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface Service1SoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
@class Service1Soap12BindingResponse;
@class Service1Soap12BindingOperation;
@protocol Service1Soap12BindingResponseDelegate <NSObject>
- (void) operation:(Service1Soap12BindingOperation *)operation completedWithResponse:(Service1Soap12BindingResponse *)response;
@end
@interface Service1Soap12Binding : NSObject <Service1Soap12BindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(Service1Soap12BindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (Service1Soap12BindingResponse *)Send_SMSUsingParameters:(Service1Svc_Send_SMS *)aParameters ;
- (void)Send_SMSAsyncUsingParameters:(Service1Svc_Send_SMS *)aParameters  delegate:(id<Service1Soap12BindingResponseDelegate>)responseDelegate;
- (Service1Soap12BindingResponse *)IsClaro_PhoneUsingParameters:(Service1Svc_IsClaro_Phone *)aParameters ;
- (void)IsClaro_PhoneAsyncUsingParameters:(Service1Svc_IsClaro_Phone *)aParameters  delegate:(id<Service1Soap12BindingResponseDelegate>)responseDelegate;
@end
@interface Service1Soap12BindingOperation : NSOperation {
	Service1Soap12Binding *binding;
	Service1Soap12BindingResponse *response;
	id<Service1Soap12BindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) Service1Soap12Binding *binding;
@property (readonly) Service1Soap12BindingResponse *response;
@property (nonatomic, assign) id<Service1Soap12BindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(Service1Soap12Binding *)aBinding delegate:(id<Service1Soap12BindingResponseDelegate>)aDelegate;
@end
@interface Service1Soap12Binding_Send_SMS : Service1Soap12BindingOperation {
	Service1Svc_Send_SMS * parameters;
}
@property (retain) Service1Svc_Send_SMS * parameters;
- (id)initWithBinding:(Service1Soap12Binding *)aBinding delegate:(id<Service1Soap12BindingResponseDelegate>)aDelegate
	parameters:(Service1Svc_Send_SMS *)aParameters
;
@end
@interface Service1Soap12Binding_IsClaro_Phone : Service1Soap12BindingOperation {
	Service1Svc_IsClaro_Phone * parameters;
}
@property (retain) Service1Svc_IsClaro_Phone * parameters;
- (id)initWithBinding:(Service1Soap12Binding *)aBinding delegate:(id<Service1Soap12BindingResponseDelegate>)aDelegate
	parameters:(Service1Svc_IsClaro_Phone *)aParameters
;
@end
@interface Service1Soap12Binding_envelope : NSObject {
}
+ (Service1Soap12Binding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface Service1Soap12BindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
