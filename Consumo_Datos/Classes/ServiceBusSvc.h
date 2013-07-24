#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "ServiceBusSvc.h"
@class ServiceBusBinding;
@interface ServiceBusSvc : NSObject {
	}
+ (ServiceBusBinding *)ServiceBusBinding;
@end
@class ServiceBusBindingResponse;
@class ServiceBusBindingOperation;
@protocol ServiceBusBindingResponseDelegate <NSObject>
- (void) operation:(ServiceBusBindingOperation *)operation completedWithResponse:(ServiceBusBindingResponse *)response;
@end
@interface ServiceBusBinding : NSObject <ServiceBusBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSString *phoneresult;
@property (copy) NSString *phoneresultClaroType;
@property (copy) NSString *resultObtenerHistorial;
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(ServiceBusBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (ServiceBusBindingResponse *)user_authenticateUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword ;
- (void)user_authenticateAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_createUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword firstname:(NSString *)aFirstname lastname:(NSString *)aLastname ;
- (void)user_createAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword firstname:(NSString *)aFirstname lastname:(NSString *)aLastname  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_tokenUsingConfig:(NSString *)aConfig token:(NSString *)aToken ;
- (void)user_tokenAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_logoutUsingConfig:(NSString *)aConfig token:(NSString *)aToken ;
- (void)user_logoutAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_readUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_readAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_attributesUsingConfig:(NSString *)aConfig token:(NSString *)aToken ;
- (void)user_attributesAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_updateUsingConfig:(NSString *)aConfig email:(NSString *)aEmail name:(NSString *)aName value:(NSString *)aValue ;
- (void)user_updateAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail name:(NSString *)aName value:(NSString *)aValue  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_deleteUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_deleteAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_activate_tokenUsingConfig:(NSString *)aConfig token:(NSString *)aToken ;
- (void)user_activate_tokenAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_activate_confirmUsingConfig:(NSString *)aConfig token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm ;
- (void)user_activate_confirmAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_passwordUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password_old:(NSString *)aPassword_old password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm ;
- (void)user_passwordAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password_old:(NSString *)aPassword_old password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_password_resetUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_password_resetAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_password_tokenUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken ;
- (void)user_password_tokenAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_get_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aEmail phone:(NSString *)aToken start:(NSString *)aPassword_new end:(NSString *)aPassword_confirm ;
- (void)user_password_confirmAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_searchUsingConfig:(NSString *)aConfig criteria:(NSString *)aCriteria ;
- (void)user_searchAsyncUsingConfig:(NSString *)aConfig criteria:(NSString *)aCriteria  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_claroUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_claroAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_claro_typeUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_claro_typeAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_smsUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone message:(NSString *)aMessage ;
- (void)user_smsAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone message:(NSString *)aMessage  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_phoneUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_phoneAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_phone_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_phone_package_listAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_phone_package_activateUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone package:(NSString *)aPackage ;
- (void)user_phone_package_activateAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone package:(NSString *)aPackage  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_phone_activated_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone start:(NSString *)aStart end:(NSString *)aEnd ;
- (void)user_phone_activated_package_listAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone start:(NSString *)aStart end:(NSString *)aEnd  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_phone_voucher_activateUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone voucher:(NSString *)aVoucher ;
- (void)user_phone_voucher_activateAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone voucher:(NSString *)aVoucher  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_number_createUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_number_createAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_number_deleteUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone ;
- (void)user_number_deleteAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_number_confirmUsingConfig:(NSString *)aConfig email:(NSString *)aEmail phone:(NSString *)aPhone verification:(NSString *)aVerification ;
- (void)user_number_confirmAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail phone:(NSString *)aPhone verification:(NSString *)aVerification  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_number_listUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_number_listAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_block_adminUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_block_adminAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_unblock_adminUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_unblock_adminAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_unblockUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken ;
- (void)user_unblockAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_get_tokenUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_get_tokenAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_dataUsingConfig:(NSString *)aConfig email:(NSString *)aEmail data:(NSString *)aData ;
- (void)user_dataAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail data:(NSString *)aData  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)user_data_listUsingConfig:(NSString *)aConfig email:(NSString *)aEmail ;
- (void)user_data_listAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)company_createUsingConfig:(NSString *)aConfig name:(NSString *)aName ;
- (void)company_createAsyncUsingConfig:(NSString *)aConfig name:(NSString *)aName  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)company_modifyUsingConfig:(NSString *)aConfig name:(NSString *)aName replace:(NSString *)aReplace ;
- (void)company_modifyAsyncUsingConfig:(NSString *)aConfig name:(NSString *)aName replace:(NSString *)aReplace  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_listUsingConfig:(NSString *)aConfig company:(NSString *)aCompany ;
- (void)app_listAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_createUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp ;
- (void)app_createAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_modifyUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp ;
- (void)app_modifyAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_secretUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName ;
- (void)app_secretAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_methodUsingConfig:(NSString *)aConfig application:(NSString *)aApplication method:(NSString *)aMethod ;
- (void)app_methodAsyncUsingConfig:(NSString *)aConfig application:(NSString *)aApplication method:(NSString *)aMethod  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)app_method_validateUsingConfig:(NSString *)aConfig method:(NSString *)aMethod ;
- (void)app_method_validateAsyncUsingConfig:(NSString *)aConfig method:(NSString *)aMethod  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)testUsingConfig:(NSString *)aConfig ;
- (void)testAsyncUsingConfig:(NSString *)aConfig  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
- (ServiceBusBindingResponse *)system_methodsUsingConfig:(NSString *)aConfig ;
- (void)system_methodsAsyncUsingConfig:(NSString *)aConfig  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate;
@end
@interface ServiceBusBindingOperation : NSOperation {
	ServiceBusBinding *binding;
	ServiceBusBindingResponse *response;
	id<ServiceBusBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) ServiceBusBinding *binding;
@property (readonly) ServiceBusBindingResponse *response;
@property (nonatomic, assign) id<ServiceBusBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate;
@end
@interface ServiceBusBinding_user_authenticate : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * password;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * password;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	password:(NSString *)aPassword
;
@end
@interface ServiceBusBinding_user_create : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * password;
	NSString * firstname;
	NSString * lastname;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * password;
@property (retain) NSString * firstname;
@property (retain) NSString * lastname;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	password:(NSString *)aPassword
	firstname:(NSString *)aFirstname
	lastname:(NSString *)aLastname
;
@end
@interface ServiceBusBinding_user_token : ServiceBusBindingOperation {
	NSString * config;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_logout : ServiceBusBindingOperation {
	NSString * config;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_read : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_attributes : ServiceBusBindingOperation {
	NSString * config;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_update : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * name;
	NSString * value;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * name;
@property (retain) NSString * value;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	name:(NSString *)aName
	value:(NSString *)aValue
;
@end
@interface ServiceBusBinding_user_delete : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_activate_token : ServiceBusBindingOperation {
	NSString * config;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_activate_confirm : ServiceBusBindingOperation {
	NSString * config;
	NSString * token;
	NSString * password_new;
	NSString * password_confirm;
}
@property (retain) NSString * config;
@property (retain) NSString * token;
@property (retain) NSString * password_new;
@property (retain) NSString * password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	token:(NSString *)aToken
	password_new:(NSString *)aPassword_new
	password_confirm:(NSString *)aPassword_confirm
;
@end
@interface ServiceBusBinding_user_password : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * password_old;
	NSString * password_new;
	NSString * password_confirm;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * password_old;
@property (retain) NSString * password_new;
@property (retain) NSString * password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	password_old:(NSString *)aPassword_old
	password_new:(NSString *)aPassword_new
	password_confirm:(NSString *)aPassword_confirm
;
@end
@interface ServiceBusBinding_user_password_reset : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_password_token : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_password_confirm : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * token;
	NSString * password_new;
	NSString * password_confirm;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * token;
@property (retain) NSString * password_new;
@property (retain) NSString * password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	token:(NSString *)aToken
	password_new:(NSString *)aPassword_new
	password_confirm:(NSString *)aPassword_confirm
;
@end
@interface ServiceBusBinding_user_search : ServiceBusBindingOperation {
	NSString * config;
	NSString * criteria;
}
@property (retain) NSString * config;
@property (retain) NSString * criteria;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	criteria:(NSString *)aCriteria
;
@end
@interface ServiceBusBinding_user_claro : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_claro_type : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_sms : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
	NSString * message;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
@property (retain) NSString * message;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
	message:(NSString *)aMessage
;
@end
@interface ServiceBusBinding_user_phone : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_phone_package_list : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_phone_package_activate : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
	NSString * package;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
@property (retain) NSString * package;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
	package:(NSString *)aPackage
;
@end
@interface ServiceBusBinding_user_phone_activated_package_list : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
	NSString * start;
	NSString * end;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
@property (retain) NSString * start;
@property (retain) NSString * end;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
	start:(NSString *)aStart
	end:(NSString *)aEnd
;
@end
@interface ServiceBusBinding_user_phone_voucher_activate : ServiceBusBindingOperation {
	NSString * config;
	NSString * country;
	NSString * phone;
	NSString * voucher;
}
@property (retain) NSString * config;
@property (retain) NSString * country;
@property (retain) NSString * phone;
@property (retain) NSString * voucher;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
	voucher:(NSString *)aVoucher
;
@end
@interface ServiceBusBinding_user_number_create : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_number_delete : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * country;
	NSString * phone;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * country;
@property (retain) NSString * phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	country:(NSString *)aCountry
	phone:(NSString *)aPhone
;
@end
@interface ServiceBusBinding_user_number_confirm : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * phone;
	NSString * verification;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * phone;
@property (retain) NSString * verification;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	phone:(NSString *)aPhone
	verification:(NSString *)aVerification
;
@end
@interface ServiceBusBinding_user_number_list : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_block_admin : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_unblock_admin : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_unblock : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * token;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	token:(NSString *)aToken
;
@end
@interface ServiceBusBinding_user_get_token : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_user_data : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
	NSString * data;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
@property (retain) NSString * data;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
	data:(NSString *)aData
;
@end
@interface ServiceBusBinding_user_data_list : ServiceBusBindingOperation {
	NSString * config;
	NSString * email;
}
@property (retain) NSString * config;
@property (retain) NSString * email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	email:(NSString *)aEmail
;
@end
@interface ServiceBusBinding_company_create : ServiceBusBindingOperation {
	NSString * config;
	NSString * name;
}
@property (retain) NSString * config;
@property (retain) NSString * name;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	name:(NSString *)aName
;
@end
@interface ServiceBusBinding_company_modify : ServiceBusBindingOperation {
	NSString * config;
	NSString * name;
	NSString * replace;
}
@property (retain) NSString * config;
@property (retain) NSString * name;
@property (retain) NSString * replace;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	name:(NSString *)aName
	replace:(NSString *)aReplace
;
@end
@interface ServiceBusBinding_app_list : ServiceBusBindingOperation {
	NSString * config;
	NSString * company;
}
@property (retain) NSString * config;
@property (retain) NSString * company;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	company:(NSString *)aCompany
;
@end
@interface ServiceBusBinding_app_create : ServiceBusBindingOperation {
	NSString * config;
	NSString * company;
	NSString * name;
	NSString * start;
	NSString * end;
	NSString * ip;
}
@property (retain) NSString * config;
@property (retain) NSString * company;
@property (retain) NSString * name;
@property (retain) NSString * start;
@property (retain) NSString * end;
@property (retain) NSString * ip;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	company:(NSString *)aCompany
	name:(NSString *)aName
	start:(NSString *)aStart
	end:(NSString *)aEnd
	ip:(NSString *)aIp
;
@end
@interface ServiceBusBinding_app_modify : ServiceBusBindingOperation {
	NSString * config;
	NSString * company;
	NSString * name;
	NSString * start;
	NSString * end;
	NSString * ip;
}
@property (retain) NSString * config;
@property (retain) NSString * company;
@property (retain) NSString * name;
@property (retain) NSString * start;
@property (retain) NSString * end;
@property (retain) NSString * ip;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	company:(NSString *)aCompany
	name:(NSString *)aName
	start:(NSString *)aStart
	end:(NSString *)aEnd
	ip:(NSString *)aIp
;
@end
@interface ServiceBusBinding_app_secret : ServiceBusBindingOperation {
	NSString * config;
	NSString * company;
	NSString * name;
}
@property (retain) NSString * config;
@property (retain) NSString * company;
@property (retain) NSString * name;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	company:(NSString *)aCompany
	name:(NSString *)aName
;
@end
@interface ServiceBusBinding_app_method : ServiceBusBindingOperation {
	NSString * config;
	NSString * application;
	NSString * method;
}
@property (retain) NSString * config;
@property (retain) NSString * application;
@property (retain) NSString * method;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	application:(NSString *)aApplication
	method:(NSString *)aMethod
;
@end
@interface ServiceBusBinding_app_method_validate : ServiceBusBindingOperation {
	NSString * config;
	NSString * method;
}
@property (retain) NSString * config;
@property (retain) NSString * method;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
	method:(NSString *)aMethod
;
@end
@interface ServiceBusBinding_test : ServiceBusBindingOperation {
	NSString * config;
}
@property (retain) NSString * config;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
;
@end
@interface ServiceBusBinding_system_methods : ServiceBusBindingOperation {
	NSString * config;
}
@property (retain) NSString * config;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
	config:(NSString *)aConfig
;
@end
@interface ServiceBusBinding_envelope : NSObject {
}
+ (ServiceBusBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface ServiceBusBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
