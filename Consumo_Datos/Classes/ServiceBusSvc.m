#import "ServiceBusSvc.h"
#import <libxml/xmlstring.h>
#if TARGET_OS_IPHONE
#import <CFNetwork/CFNetwork.h>
#endif
@implementation ServiceBusSvc

+ (void)initialize
{
	[[USGlobals sharedInstance].wsdlStandardNamespaces setObject:@"xsd" forKey:@"http://www.w3.org/2001/XMLSchema"];
	[[USGlobals sharedInstance].wsdlStandardNamespaces setObject:@"ServiceBusSvc" forKey:@"http://internet.claro.com.gt/soap/ServiceBus"];
	[[USGlobals sharedInstance].wsdlStandardNamespaces setObject:@"ns1" forKey:@"http://schemas.xmlsoap.org/soap/encoding/"];
	[[USGlobals sharedInstance].wsdlStandardNamespaces setObject:@"ns2" forKey:@"http://schemas.xmlsoap.org/wsdl/"];
}
+ (ServiceBusBinding *)ServiceBusBinding
{
	return [[[ServiceBusBinding alloc] initWithAddress:@"http://internet.claro.com.gt/sbus/bus.php"] autorelease];
}
@end
@implementation ServiceBusBinding
@synthesize address;
@synthesize defaultTimeout;
@synthesize logXMLInOut;
@synthesize phoneresult;
@synthesize phoneresultClaroType;
@synthesize resultObtenerHistorial;
@synthesize cookies;
@synthesize authUsername;
@synthesize authPassword;
- (id)init
{
	if((self = [super init])) {
		address = nil;
		cookies = nil;
		defaultTimeout = 10;//seconds
		logXMLInOut = NO;
		synchronousOperationComplete = NO;
	}
	
	return self;
}
- (id)initWithAddress:(NSString *)anAddress
{
	if((self = [self init])) {
		self.address = [NSURL URLWithString:anAddress];
	}
	
	return self;
}
- (void)addCookie:(NSHTTPCookie *)toAdd
{
	if(toAdd != nil) {
		if(cookies == nil) cookies = [[NSMutableArray alloc] init];
		[cookies addObject:toAdd];
	}
}
- (ServiceBusBindingResponse *)performSynchronousOperation:(ServiceBusBindingOperation *)operation
{
	synchronousOperationComplete = NO;
	[operation start];
	
	// Now wait for response
	NSRunLoop *theRL = [NSRunLoop currentRunLoop];
	
	while (!synchronousOperationComplete && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
	return operation.response;
}
- (void)performAsynchronousOperation:(ServiceBusBindingOperation *)operation
{
	[operation start];
}
- (void) operation:(ServiceBusBindingOperation *)operation completedWithResponse:(ServiceBusBindingResponse *)response
{
	synchronousOperationComplete = YES;
}
- (ServiceBusBindingResponse *)user_authenticateUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_authenticate*)[ServiceBusBinding_user_authenticate alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							password:aPassword
																							] autorelease]];
}
- (void)user_authenticateAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_authenticate*)[ServiceBusBinding_user_authenticate alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 password:aPassword
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_createUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword firstname:(NSString *)aFirstname lastname:(NSString *)aLastname 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_create*)[ServiceBusBinding_user_create alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							password:aPassword
																							firstname:aFirstname
																							lastname:aLastname
																							] autorelease]];
}
- (void)user_createAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password:(NSString *)aPassword firstname:(NSString *)aFirstname lastname:(NSString *)aLastname  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_create*)[ServiceBusBinding_user_create alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 password:aPassword
																							 firstname:aFirstname
																							 lastname:aLastname
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_tokenUsingConfig:(NSString *)aConfig token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_token*)[ServiceBusBinding_user_token alloc] initWithBinding:self delegate:self
																							config:aConfig
																							token:aToken
																							] autorelease]];
}
- (void)user_tokenAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_token*)[ServiceBusBinding_user_token alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_logoutUsingConfig:(NSString *)aConfig token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_logout*)[ServiceBusBinding_user_logout alloc] initWithBinding:self delegate:self
																							config:aConfig
																							token:aToken
																							] autorelease]];
}
- (void)user_logoutAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_logout*)[ServiceBusBinding_user_logout alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_readUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_read*)[ServiceBusBinding_user_read alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_readAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_read*)[ServiceBusBinding_user_read alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_attributesUsingConfig:(NSString *)aConfig token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_attributes*)[ServiceBusBinding_user_attributes alloc] initWithBinding:self delegate:self
																							config:aConfig
																							token:aToken
																							] autorelease]];
}
- (void)user_attributesAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_attributes*)[ServiceBusBinding_user_attributes alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_updateUsingConfig:(NSString *)aConfig email:(NSString *)aEmail name:(NSString *)aName value:(NSString *)aValue 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_update*)[ServiceBusBinding_user_update alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							name:aName
																							value:aValue
																							] autorelease]];
}
- (void)user_updateAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail name:(NSString *)aName value:(NSString *)aValue  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_update*)[ServiceBusBinding_user_update alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 name:aName
																							 value:aValue
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_deleteUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_delete*)[ServiceBusBinding_user_delete alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_deleteAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_delete*)[ServiceBusBinding_user_delete alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_activate_tokenUsingConfig:(NSString *)aConfig token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_activate_token*)[ServiceBusBinding_user_activate_token alloc] initWithBinding:self delegate:self
																							config:aConfig
																							token:aToken
																							] autorelease]];
}
- (void)user_activate_tokenAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_activate_token*)[ServiceBusBinding_user_activate_token alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_activate_confirmUsingConfig:(NSString *)aConfig token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_activate_confirm*)[ServiceBusBinding_user_activate_confirm alloc] initWithBinding:self delegate:self
																							config:aConfig
																							token:aToken
																							password_new:aPassword_new
																							password_confirm:aPassword_confirm
																							] autorelease]];
}
- (void)user_activate_confirmAsyncUsingConfig:(NSString *)aConfig token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_activate_confirm*)[ServiceBusBinding_user_activate_confirm alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 token:aToken
																							 password_new:aPassword_new
																							 password_confirm:aPassword_confirm
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_passwordUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password_old:(NSString *)aPassword_old password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_password*)[ServiceBusBinding_user_password alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							password_old:aPassword_old
																							password_new:aPassword_new
																							password_confirm:aPassword_confirm
																							] autorelease]];
}
- (void)user_passwordAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail password_old:(NSString *)aPassword_old password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_password*)[ServiceBusBinding_user_password alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 password_old:aPassword_old
																							 password_new:aPassword_new
																							 password_confirm:aPassword_confirm
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_password_resetUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_password_reset*)[ServiceBusBinding_user_password_reset alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_password_resetAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_password_reset*)[ServiceBusBinding_user_password_reset alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_password_tokenUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_password_token*)[ServiceBusBinding_user_password_token alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							token:aToken
																							] autorelease]];
}
- (void)user_password_tokenAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_password_token*)[ServiceBusBinding_user_password_token alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_get_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aEmail phone:(NSString *)aToken start:(NSString *)aPassword_new end:(NSString *)aPassword_confirm
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_password_confirm*)[ServiceBusBinding_user_password_confirm alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							token:aToken
																							password_new:aPassword_new
																							password_confirm:aPassword_confirm
																							] autorelease]];
}
- (void)user_password_confirmAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken password_new:(NSString *)aPassword_new password_confirm:(NSString *)aPassword_confirm  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_password_confirm*)[ServiceBusBinding_user_password_confirm alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 token:aToken
																							 password_new:aPassword_new
																							 password_confirm:aPassword_confirm
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_searchUsingConfig:(NSString *)aConfig criteria:(NSString *)aCriteria 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_search*)[ServiceBusBinding_user_search alloc] initWithBinding:self delegate:self
																							config:aConfig
																							criteria:aCriteria
																							] autorelease]];
}
- (void)user_searchAsyncUsingConfig:(NSString *)aConfig criteria:(NSString *)aCriteria  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_search*)[ServiceBusBinding_user_search alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 criteria:aCriteria
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_claroUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_claro*)[ServiceBusBinding_user_claro alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_claroAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_claro*)[ServiceBusBinding_user_claro alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_claro_typeUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_claro_type*)[ServiceBusBinding_user_claro_type alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_claro_typeAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_claro_type*)[ServiceBusBinding_user_claro_type alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_smsUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone message:(NSString *)aMessage 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_sms*)[ServiceBusBinding_user_sms alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							message:aMessage
																							] autorelease]];
}
- (void)user_smsAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone message:(NSString *)aMessage  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_sms*)[ServiceBusBinding_user_sms alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 message:aMessage
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_phoneUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_phone*)[ServiceBusBinding_user_phone alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_phoneAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_phone*)[ServiceBusBinding_user_phone alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_phone_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_phone_package_list*)[ServiceBusBinding_user_phone_package_list alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_phone_package_listAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_phone_package_list*)[ServiceBusBinding_user_phone_package_list alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_phone_package_activateUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone package:(NSString *)aPackage 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_phone_package_activate*)[ServiceBusBinding_user_phone_package_activate alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							package:aPackage
																							] autorelease]];
}
- (void)user_phone_package_activateAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone package:(NSString *)aPackage  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_phone_package_activate*)[ServiceBusBinding_user_phone_package_activate alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 package:aPackage
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_phone_activated_package_listUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone start:(NSString *)aStart end:(NSString *)aEnd 
{
    NSLog(@"hola");
	return [self performSynchronousOperation: [[(ServiceBusBinding_user_phone_activated_package_list*)[ServiceBusBinding_user_phone_activated_package_list alloc] initWithBinding:self delegate:self config:aConfig country:aCountry phone:aPhone start:aStart end:aEnd] autorelease]];
}
- (void)user_phone_activated_package_listAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone start:(NSString *)aStart end:(NSString *)aEnd  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_phone_activated_package_list*)[ServiceBusBinding_user_phone_activated_package_list alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 start:aStart
																							 end:aEnd
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_phone_voucher_activateUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone voucher:(NSString *)aVoucher 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_phone_voucher_activate*)[ServiceBusBinding_user_phone_voucher_activate alloc] initWithBinding:self delegate:self
																							config:aConfig
																							country:aCountry
																							phone:aPhone
																							voucher:aVoucher
																							] autorelease]];
}
- (void)user_phone_voucher_activateAsyncUsingConfig:(NSString *)aConfig country:(NSString *)aCountry phone:(NSString *)aPhone voucher:(NSString *)aVoucher  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_phone_voucher_activate*)[ServiceBusBinding_user_phone_voucher_activate alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 country:aCountry
																							 phone:aPhone
																							 voucher:aVoucher
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_number_createUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_number_create*)[ServiceBusBinding_user_number_create alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_number_createAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_number_create*)[ServiceBusBinding_user_number_create alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_number_deleteUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_number_delete*)[ServiceBusBinding_user_number_delete alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							country:aCountry
																							phone:aPhone
																							] autorelease]];
}
- (void)user_number_deleteAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail country:(NSString *)aCountry phone:(NSString *)aPhone  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_number_delete*)[ServiceBusBinding_user_number_delete alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 country:aCountry
																							 phone:aPhone
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_number_confirmUsingConfig:(NSString *)aConfig email:(NSString *)aEmail phone:(NSString *)aPhone verification:(NSString *)aVerification 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_number_confirm*)[ServiceBusBinding_user_number_confirm alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							phone:aPhone
																							verification:aVerification
																							] autorelease]];
}
- (void)user_number_confirmAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail phone:(NSString *)aPhone verification:(NSString *)aVerification  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_number_confirm*)[ServiceBusBinding_user_number_confirm alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 phone:aPhone
																							 verification:aVerification
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_number_listUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_number_list*)[ServiceBusBinding_user_number_list alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_number_listAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_number_list*)[ServiceBusBinding_user_number_list alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_block_adminUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_block_admin*)[ServiceBusBinding_user_block_admin alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_block_adminAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_block_admin*)[ServiceBusBinding_user_block_admin alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_unblock_adminUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_unblock_admin*)[ServiceBusBinding_user_unblock_admin alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_unblock_adminAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_unblock_admin*)[ServiceBusBinding_user_unblock_admin alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_unblockUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_unblock*)[ServiceBusBinding_user_unblock alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							token:aToken
																							] autorelease]];
}
- (void)user_unblockAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail token:(NSString *)aToken  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_unblock*)[ServiceBusBinding_user_unblock alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 token:aToken
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_get_tokenUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_get_token*)[ServiceBusBinding_user_get_token alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_get_tokenAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_get_token*)[ServiceBusBinding_user_get_token alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_dataUsingConfig:(NSString *)aConfig email:(NSString *)aEmail data:(NSString *)aData 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_data*)[ServiceBusBinding_user_data alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							data:aData
																							] autorelease]];
}
- (void)user_dataAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail data:(NSString *)aData  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_data*)[ServiceBusBinding_user_data alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 data:aData
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)user_data_listUsingConfig:(NSString *)aConfig email:(NSString *)aEmail 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_user_data_list*)[ServiceBusBinding_user_data_list alloc] initWithBinding:self delegate:self
																							config:aConfig
																							email:aEmail
																							] autorelease]];
}
- (void)user_data_listAsyncUsingConfig:(NSString *)aConfig email:(NSString *)aEmail  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_user_data_list*)[ServiceBusBinding_user_data_list alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 email:aEmail
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)company_createUsingConfig:(NSString *)aConfig name:(NSString *)aName 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_company_create*)[ServiceBusBinding_company_create alloc] initWithBinding:self delegate:self
																							config:aConfig
																							name:aName
																							] autorelease]];
}
- (void)company_createAsyncUsingConfig:(NSString *)aConfig name:(NSString *)aName  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_company_create*)[ServiceBusBinding_company_create alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 name:aName
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)company_modifyUsingConfig:(NSString *)aConfig name:(NSString *)aName replace:(NSString *)aReplace 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_company_modify*)[ServiceBusBinding_company_modify alloc] initWithBinding:self delegate:self
																							config:aConfig
																							name:aName
																							replace:aReplace
																							] autorelease]];
}
- (void)company_modifyAsyncUsingConfig:(NSString *)aConfig name:(NSString *)aName replace:(NSString *)aReplace  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_company_modify*)[ServiceBusBinding_company_modify alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 name:aName
																							 replace:aReplace
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_listUsingConfig:(NSString *)aConfig company:(NSString *)aCompany 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_list*)[ServiceBusBinding_app_list alloc] initWithBinding:self delegate:self
																							config:aConfig
																							company:aCompany
																							] autorelease]];
}
- (void)app_listAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_list*)[ServiceBusBinding_app_list alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 company:aCompany
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_createUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_create*)[ServiceBusBinding_app_create alloc] initWithBinding:self delegate:self
																							config:aConfig
																							company:aCompany
																							name:aName
																							start:aStart
																							end:aEnd
																							ip:aIp
																							] autorelease]];
}
- (void)app_createAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_create*)[ServiceBusBinding_app_create alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 company:aCompany
																							 name:aName
																							 start:aStart
																							 end:aEnd
																							 ip:aIp
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_modifyUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_modify*)[ServiceBusBinding_app_modify alloc] initWithBinding:self delegate:self
																							config:aConfig
																							company:aCompany
																							name:aName
																							start:aStart
																							end:aEnd
																							ip:aIp
																							] autorelease]];
}
- (void)app_modifyAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName start:(NSString *)aStart end:(NSString *)aEnd ip:(NSString *)aIp  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_modify*)[ServiceBusBinding_app_modify alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 company:aCompany
																							 name:aName
																							 start:aStart
																							 end:aEnd
																							 ip:aIp
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_secretUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_secret*)[ServiceBusBinding_app_secret alloc] initWithBinding:self delegate:self
																							config:aConfig
																							company:aCompany
																							name:aName
																							] autorelease]];
}
- (void)app_secretAsyncUsingConfig:(NSString *)aConfig company:(NSString *)aCompany name:(NSString *)aName  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_secret*)[ServiceBusBinding_app_secret alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 company:aCompany
																							 name:aName
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_methodUsingConfig:(NSString *)aConfig application:(NSString *)aApplication method:(NSString *)aMethod 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_method*)[ServiceBusBinding_app_method alloc] initWithBinding:self delegate:self
																							config:aConfig
																							application:aApplication
																							method:aMethod
																							] autorelease]];
}
- (void)app_methodAsyncUsingConfig:(NSString *)aConfig application:(NSString *)aApplication method:(NSString *)aMethod  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_method*)[ServiceBusBinding_app_method alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 application:aApplication
																							 method:aMethod
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)app_method_validateUsingConfig:(NSString *)aConfig method:(NSString *)aMethod 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_app_method_validate*)[ServiceBusBinding_app_method_validate alloc] initWithBinding:self delegate:self
																							config:aConfig
																							method:aMethod
																							] autorelease]];
}
- (void)app_method_validateAsyncUsingConfig:(NSString *)aConfig method:(NSString *)aMethod  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_app_method_validate*)[ServiceBusBinding_app_method_validate alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 method:aMethod
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)testUsingConfig:(NSString *)aConfig 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_test*)[ServiceBusBinding_test alloc] initWithBinding:self delegate:self
																							config:aConfig
																							] autorelease]];
}
- (void)testAsyncUsingConfig:(NSString *)aConfig  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_test*)[ServiceBusBinding_test alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 ] autorelease]];
}
- (ServiceBusBindingResponse *)system_methodsUsingConfig:(NSString *)aConfig 
{
	return [self performSynchronousOperation:[[(ServiceBusBinding_system_methods*)[ServiceBusBinding_system_methods alloc] initWithBinding:self delegate:self
																							config:aConfig
																							] autorelease]];
}
- (void)system_methodsAsyncUsingConfig:(NSString *)aConfig  delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
{
	[self performAsynchronousOperation: [[(ServiceBusBinding_system_methods*)[ServiceBusBinding_system_methods alloc] initWithBinding:self delegate:responseDelegate
																							 config:aConfig
																							 ] autorelease]];
}
- (void)sendHTTPCallUsingBody:(NSString *)outputBody soapAction:(NSString *)soapAction forOperation:(ServiceBusBindingOperation *)operation
{
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.address 
																												 cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
																										 timeoutInterval:self.defaultTimeout];
	NSData *bodyData = [outputBody dataUsingEncoding:NSUTF8StringEncoding];
	
	if(cookies != nil) {
		[request setAllHTTPHeaderFields:[NSHTTPCookie requestHeaderFieldsWithCookies:cookies]];
	}
	[request setValue:@"wsdl2objc" forHTTPHeaderField:@"User-Agent"];
	[request setValue:soapAction forHTTPHeaderField:@"SOAPAction"];
	[request setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[request setValue:[NSString stringWithFormat:@"%u", [bodyData length]] forHTTPHeaderField:@"Content-Length"];
	[request setValue:self.address.host forHTTPHeaderField:@"Host"];
	[request setHTTPMethod: @"POST"];
	// set version 1.1 - how?
	[request setHTTPBody: bodyData];
		
	if(self.logXMLInOut) {
		NSLog(@"OutputHeaders:\n%@", [request allHTTPHeaderFields]);
		NSLog(@"OutputBody:\n%@", outputBody);
	}
	
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:operation];
	
	operation.urlConnection = connection;
	[connection release];
}
- (void) dealloc
{
	[address release];
	[cookies release];
	[super dealloc];
}
@end
@implementation ServiceBusBindingOperation
@synthesize binding;
@synthesize response;
@synthesize delegate;
@synthesize responseData;
@synthesize urlConnection;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)aDelegate
{
	if ((self = [super init])) {
		self.binding = aBinding;
		response = nil;
		self.delegate = aDelegate;
		self.responseData = nil;
		self.urlConnection = nil;
	}
	
	return self;
}
-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
	if ([challenge previousFailureCount] == 0) {
		NSURLCredential *newCredential;
		newCredential=[NSURLCredential credentialWithUser:self.binding.authUsername
												 password:self.binding.authPassword
											  persistence:NSURLCredentialPersistenceForSession];
		[[challenge sender] useCredential:newCredential
			   forAuthenticationChallenge:challenge];
	} else {
		[[challenge sender] cancelAuthenticationChallenge:challenge];
		NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Authentication Error" forKey:NSLocalizedDescriptionKey];
		NSError *authError = [NSError errorWithDomain:@"Connection Authentication" code:0 userInfo:userInfo];
		[self connection:connection didFailWithError:authError];
	}
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)urlResponse
{
	NSHTTPURLResponse *httpResponse;
	if ([urlResponse isKindOfClass:[NSHTTPURLResponse class]]) {
		httpResponse = (NSHTTPURLResponse *) urlResponse;
	} else {
		httpResponse = nil;
	}
	
	if(binding.logXMLInOut) {
		NSLog(@"ResponseStatus: %u\n", [httpResponse statusCode]);
		NSLog(@"ResponseHeaders:\n%@", [httpResponse allHeaderFields]);
	}
	
	NSMutableArray *cookies = [[NSHTTPCookie cookiesWithResponseHeaderFields:[httpResponse allHeaderFields] forURL:binding.address] mutableCopy];
	
	binding.cookies = cookies;
	[cookies release];
  if ([urlResponse.MIMEType rangeOfString:@"text/xml"].length == 0) {
		NSError *error = nil;
		[connection cancel];
		if ([httpResponse statusCode] >= 400) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:[NSHTTPURLResponse localizedStringForStatusCode:[httpResponse statusCode]] forKey:NSLocalizedDescriptionKey];
				
			error = [NSError errorWithDomain:@"ServiceBusBindingResponseHTTP" code:[httpResponse statusCode] userInfo:userInfo];
		} else {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:
																[NSString stringWithFormat: @"Unexpected response MIME type to SOAP call:%@", urlResponse.MIMEType]
																													 forKey:NSLocalizedDescriptionKey];
			error = [NSError errorWithDomain:@"ServiceBusBindingResponseHTTP" code:1 userInfo:userInfo];
		}
				
		[self connection:connection didFailWithError:error];
  }
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  if (responseData == nil) {
		responseData = [data mutableCopy];
	} else {
		[responseData appendData:data];
	}
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	if (binding.logXMLInOut) {
		NSLog(@"ResponseError:\n%@", error);
	}
	response.error = error;
	[delegate operation:self completedWithResponse:response];
}
- (void)dealloc
{
	[binding release];
	[response release];
	delegate = nil;
	[responseData release];
	[urlConnection release];
	
	[super dealloc];
}
@end
@implementation ServiceBusBinding_user_authenticate
@synthesize config;
@synthesize email;
@synthesize password;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
password:(NSString *)aPassword
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.password = aPassword;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(password != nil) [password release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(password != nil) [bodyElements setObject:password forKey:@"password"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_authenticate" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_create
@synthesize config;
@synthesize email;
@synthesize password;
@synthesize firstname;
@synthesize lastname;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
password:(NSString *)aPassword
firstname:(NSString *)aFirstname
lastname:(NSString *)aLastname
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.password = aPassword;
		self.firstname = aFirstname;
		self.lastname = aLastname;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(password != nil) [password release];
	if(firstname != nil) [firstname release];
	if(lastname != nil) [lastname release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(password != nil) [bodyElements setObject:password forKey:@"password"];
	if(firstname != nil) [bodyElements setObject:firstname forKey:@"firstname"];
	if(lastname != nil) [bodyElements setObject:lastname forKey:@"lastname"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_create" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_token
@synthesize config;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_token" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_logout
@synthesize config;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_logout" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_read
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_read" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_attributes
@synthesize config;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_attributes" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_update
@synthesize config;
@synthesize email;
@synthesize name;
@synthesize value;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
name:(NSString *)aName
value:(NSString *)aValue
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.name = aName;
		self.value = aValue;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(name != nil) [name release];
	if(value != nil) [value release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	if(value != nil) [bodyElements setObject:value forKey:@"value"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_update" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_delete
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_delete" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_activate_token
@synthesize config;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_activate_token" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_activate_confirm
@synthesize config;
@synthesize token;
@synthesize password_new;
@synthesize password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
token:(NSString *)aToken
password_new:(NSString *)aPassword_new
password_confirm:(NSString *)aPassword_confirm
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.token = aToken;
		self.password_new = aPassword_new;
		self.password_confirm = aPassword_confirm;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(token != nil) [token release];
	if(password_new != nil) [password_new release];
	if(password_confirm != nil) [password_confirm release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	if(password_new != nil) [bodyElements setObject:password_new forKey:@"password_new"];
	if(password_confirm != nil) [bodyElements setObject:password_confirm forKey:@"password_confirm"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_activate_confirm" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_password
@synthesize config;
@synthesize email;
@synthesize password_old;
@synthesize password_new;
@synthesize password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
password_old:(NSString *)aPassword_old
password_new:(NSString *)aPassword_new
password_confirm:(NSString *)aPassword_confirm
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.password_old = aPassword_old;
		self.password_new = aPassword_new;
		self.password_confirm = aPassword_confirm;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(password_old != nil) [password_old release];
	if(password_new != nil) [password_new release];
	if(password_confirm != nil) [password_confirm release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(password_old != nil) [bodyElements setObject:password_old forKey:@"password_old"];
	if(password_new != nil) [bodyElements setObject:password_new forKey:@"password_new"];
	if(password_confirm != nil) [bodyElements setObject:password_confirm forKey:@"password_confirm"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_password" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_password_reset
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_password_reset" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_password_token
@synthesize config;
@synthesize email;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_password_token" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_password_confirm
@synthesize config;
@synthesize email;
@synthesize token;
@synthesize password_new;
@synthesize password_confirm;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
token:(NSString *)aToken
password_new:(NSString *)aPassword_new
password_confirm:(NSString *)aPassword_confirm
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.token = aToken;
		self.password_new = aPassword_new;
		self.password_confirm = aPassword_confirm;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(token != nil) [token release];
	if(password_new != nil) [password_new release];
	if(password_confirm != nil) [password_confirm release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(email != nil) [bodyElements setObject:email forKey:@"country"];
	if(token != nil) [bodyElements setObject:token forKey:@"phone"];
	if(password_new != nil) [bodyElements setObject:password_new forKey:@"start"];
	if(password_confirm != nil) [bodyElements setObject:password_confirm forKey:@"end"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone_activated_package_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
            binding.resultObtenerHistorial = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_search
@synthesize config;
@synthesize criteria;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
criteria:(NSString *)aCriteria
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.criteria = aCriteria;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(criteria != nil) [criteria release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(criteria != nil) [bodyElements setObject:criteria forKey:@"criteria"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_search" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_claro
@synthesize config;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_claro" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_claro_type
@synthesize config;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_claro_type" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
            binding.phoneresultClaroType = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
            NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_sms
@synthesize config;
@synthesize country;
@synthesize phone;
@synthesize message;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
message:(NSString *)aMessage
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
		self.message = aMessage;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	if(message != nil) [message release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	if(message != nil) [bodyElements setObject:message forKey:@"message"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_sms" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_phone
@synthesize config;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(country != nil) [bodyElements setObject:country forKey:@"COUNTRY"];
	if(phone != nil)   [bodyElements setObject:phone forKey:@"PHONE"];
    
    NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
            // ESCRIBE RESPONSE DATA
            binding.phoneresult = [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease];
            NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_phone_package_list
@synthesize config;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone_package_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_phone_package_activate
@synthesize config;
@synthesize country;
@synthesize phone;
@synthesize package;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
package:(NSString *)aPackage
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
		self.package = aPackage;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	if(package != nil) [package release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	if(package != nil) [bodyElements setObject:package forKey:@"package"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone_package_activate" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_phone_activated_package_list
@synthesize config;
@synthesize country;
@synthesize phone;
@synthesize start;
@synthesize end;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
start:(NSString *)aStart
end:(NSString *)aEnd
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
		self.start = aStart;
		self.end = aEnd;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	if(start != nil) [start release];
	if(end != nil) [end release];
	
	[super dealloc];
}
- (void)main
{
    NSLog(@"hola");

    
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	
    bodyElements = [NSMutableDictionary dictionary];
    if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	//if(start != nil) [bodyElements setObject:start forKey:@"start"];
	//if(end != nil) [bodyElements setObject:end forKey:@"end"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone_activated_package_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
           	NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_phone_voucher_activate
@synthesize config;
@synthesize country;
@synthesize phone;
@synthesize voucher;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
country:(NSString *)aCountry
phone:(NSString *)aPhone
voucher:(NSString *)aVoucher
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.country = aCountry;
		self.phone = aPhone;
		self.voucher = aVoucher;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	if(voucher != nil) [voucher release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	if(voucher != nil) [bodyElements setObject:voucher forKey:@"voucher"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_phone_voucher_activate" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_number_create
@synthesize config;
@synthesize email;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_number_create" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_number_delete
@synthesize config;
@synthesize email;
@synthesize country;
@synthesize phone;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
country:(NSString *)aCountry
phone:(NSString *)aPhone
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.country = aCountry;
		self.phone = aPhone;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(country != nil) [country release];
	if(phone != nil) [phone release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(country != nil) [bodyElements setObject:country forKey:@"country"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_number_delete" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_number_confirm
@synthesize config;
@synthesize email;
@synthesize phone;
@synthesize verification;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
phone:(NSString *)aPhone
verification:(NSString *)aVerification
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.phone = aPhone;
		self.verification = aVerification;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(phone != nil) [phone release];
	if(verification != nil) [verification release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(phone != nil) [bodyElements setObject:phone forKey:@"phone"];
	if(verification != nil) [bodyElements setObject:verification forKey:@"verification"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_number_confirm" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_number_list
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_number_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_block_admin
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_block_admin" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_unblock_admin
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_unblock_admin" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_unblock
@synthesize config;
@synthesize email;
@synthesize token;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
token:(NSString *)aToken
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.token = aToken;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(token != nil) [token release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(token != nil) [bodyElements setObject:token forKey:@"token"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_unblock" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_get_token
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_get_token" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_data
@synthesize config;
@synthesize email;
@synthesize data;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
data:(NSString *)aData
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
		self.data = aData;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	if(data != nil) [data release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	if(data != nil) [bodyElements setObject:data forKey:@"data"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_data" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_user_data_list
@synthesize config;
@synthesize email;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
email:(NSString *)aEmail
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.email = aEmail;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(email != nil) [email release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(email != nil) [bodyElements setObject:email forKey:@"email"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/user_data_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_company_create
@synthesize config;
@synthesize name;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
name:(NSString *)aName
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.name = aName;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(name != nil) [name release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/company_create" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_company_modify
@synthesize config;
@synthesize name;
@synthesize replace;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
name:(NSString *)aName
replace:(NSString *)aReplace
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.name = aName;
		self.replace = aReplace;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(name != nil) [name release];
	if(replace != nil) [replace release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	if(replace != nil) [bodyElements setObject:replace forKey:@"replace"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/company_modify" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_list
@synthesize config;
@synthesize company;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
company:(NSString *)aCompany
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.company = aCompany;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(company != nil) [company release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(company != nil) [bodyElements setObject:company forKey:@"company"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_list" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_create
@synthesize config;
@synthesize company;
@synthesize name;
@synthesize start;
@synthesize end;
@synthesize ip;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
company:(NSString *)aCompany
name:(NSString *)aName
start:(NSString *)aStart
end:(NSString *)aEnd
ip:(NSString *)aIp
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.company = aCompany;
		self.name = aName;
		self.start = aStart;
		self.end = aEnd;
		self.ip = aIp;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(company != nil) [company release];
	if(name != nil) [name release];
	if(start != nil) [start release];
	if(end != nil) [end release];
	if(ip != nil) [ip release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(company != nil) [bodyElements setObject:company forKey:@"company"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	if(start != nil) [bodyElements setObject:start forKey:@"start"];
	if(end != nil) [bodyElements setObject:end forKey:@"end"];
	if(ip != nil) [bodyElements setObject:ip forKey:@"ip"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_create" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_modify
@synthesize config;
@synthesize company;
@synthesize name;
@synthesize start;
@synthesize end;
@synthesize ip;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
company:(NSString *)aCompany
name:(NSString *)aName
start:(NSString *)aStart
end:(NSString *)aEnd
ip:(NSString *)aIp
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.company = aCompany;
		self.name = aName;
		self.start = aStart;
		self.end = aEnd;
		self.ip = aIp;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(company != nil) [company release];
	if(name != nil) [name release];
	if(start != nil) [start release];
	if(end != nil) [end release];
	if(ip != nil) [ip release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(company != nil) [bodyElements setObject:company forKey:@"company"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	if(start != nil) [bodyElements setObject:start forKey:@"start"];
	if(end != nil) [bodyElements setObject:end forKey:@"end"];
	if(ip != nil) [bodyElements setObject:ip forKey:@"ip"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_modify" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_secret
@synthesize config;
@synthesize company;
@synthesize name;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
company:(NSString *)aCompany
name:(NSString *)aName
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.company = aCompany;
		self.name = aName;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(company != nil) [company release];
	if(name != nil) [name release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(company != nil) [bodyElements setObject:company forKey:@"company"];
	if(name != nil) [bodyElements setObject:name forKey:@"name"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_secret" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_method
@synthesize config;
@synthesize application;
@synthesize method;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
application:(NSString *)aApplication
method:(NSString *)aMethod
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.application = aApplication;
		self.method = aMethod;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(application != nil) [application release];
	if(method != nil) [method release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(application != nil) [bodyElements setObject:application forKey:@"application"];
	if(method != nil) [bodyElements setObject:method forKey:@"method"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_method" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_app_method_validate
@synthesize config;
@synthesize method;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
method:(NSString *)aMethod
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
		self.method = aMethod;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	if(method != nil) [method release];
	
	[super dealloc];
}

- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	if(method != nil) [bodyElements setObject:method forKey:@"method"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/app_method_validate" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_test
@synthesize config;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	
	[super dealloc];
}

- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/test" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
@implementation ServiceBusBinding_system_methods
@synthesize config;
- (id)initWithBinding:(ServiceBusBinding *)aBinding delegate:(id<ServiceBusBindingResponseDelegate>)responseDelegate
config:(NSString *)aConfig
{
	if((self = [super initWithBinding:aBinding delegate:responseDelegate])) {
		self.config = aConfig;
	}
	
	return self;
}
- (void)dealloc
{
	if(config != nil) [config release];
	
	[super dealloc];
}
- (void)main
{
	[response autorelease];
	response = [ServiceBusBindingResponse new];
	
	ServiceBusBinding_envelope *envelope = [ServiceBusBinding_envelope sharedInstance];
	
	NSMutableDictionary *headerElements = nil;
	headerElements = [NSMutableDictionary dictionary];
	
	NSMutableDictionary *bodyElements = nil;
	bodyElements = [NSMutableDictionary dictionary];
	if(config != nil) [bodyElements setObject:config forKey:@"config"];
	
	NSString *operationXMLString = [envelope serializedFormUsingHeaderElements:headerElements bodyElements:bodyElements];
	
	[binding sendHTTPCallUsingBody:operationXMLString soapAction:@"http://internet.claro.com.gt/sbus/bus.php/system_methods" forOperation:self];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if (responseData != nil && delegate != nil)
	{
		xmlDocPtr doc;
		xmlNodePtr cur;
		
		if (binding.logXMLInOut) {
			NSLog(@"ResponseBody:\n%@", [[[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] autorelease]);
		}
		
		doc = xmlParseMemory([responseData bytes], [responseData length]);
		
		if (doc == NULL) {
			NSDictionary *userInfo = [NSDictionary dictionaryWithObject:@"Errors while parsing returned XML" forKey:NSLocalizedDescriptionKey];
			
			response.error = [NSError errorWithDomain:@"ServiceBusBindingResponseXML" code:1 userInfo:userInfo];
			[delegate operation:self completedWithResponse:response];
		} else {
			cur = xmlDocGetRootElement(doc);
			cur = cur->children;
			
			for( ; cur != NULL ; cur = cur->next) {
				if(cur->type == XML_ELEMENT_NODE) {
					
					if(xmlStrEqual(cur->name, (const xmlChar *) "Body")) {
						NSMutableArray *responseBodyParts = [NSMutableArray array];
						
						xmlNodePtr bodyNode;
						for(bodyNode=cur->children ; bodyNode != NULL ; bodyNode = bodyNode->next) {
							if(cur->type == XML_ELEMENT_NODE) {
								if(xmlStrEqual(bodyNode->name, (const xmlChar *) "return")) {
									NSString  *bodyObject = [NSString  deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
								if (xmlStrEqual(bodyNode->ns->prefix, cur->ns->prefix) && 
									xmlStrEqual(bodyNode->name, (const xmlChar *) "Fault")) {
									SOAPFault *bodyObject = [SOAPFault deserializeNode:bodyNode];
									//NSAssert1(bodyObject != nil, @"Errors while parsing body %s", bodyNode->name);
									if (bodyObject != nil) [responseBodyParts addObject:bodyObject];
								}
							}
						}
						
						response.bodyParts = responseBodyParts;
					}
				}
			}
			
			xmlFreeDoc(doc);
		}
		
		xmlCleanupParser();
		[delegate operation:self completedWithResponse:response];
	}
}
@end
static ServiceBusBinding_envelope *ServiceBusBindingSharedEnvelopeInstance = nil;
@implementation ServiceBusBinding_envelope
+ (ServiceBusBinding_envelope *)sharedInstance
{
	if(ServiceBusBindingSharedEnvelopeInstance == nil) {
		ServiceBusBindingSharedEnvelopeInstance = [ServiceBusBinding_envelope new];
	}
	
	return ServiceBusBindingSharedEnvelopeInstance;
}
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements 
{
    xmlDocPtr doc;
	
	doc = xmlNewDoc((const xmlChar*)XML_DEFAULT_VERSION);
	if (doc == NULL) {
		NSLog(@"Error creating the xml document tree");
		return @"";
	}
	
	xmlNodePtr root = xmlNewDocNode(doc, NULL, (const xmlChar*)"Envelope", NULL);
	
    xmlDocSetRootElement(doc, root);
	
	xmlNsPtr soapEnvelopeNs = xmlNewNs(root, (const xmlChar*)"http://schemas.xmlsoap.org/soap/envelope/", (const xmlChar*)"soap");
	xmlSetNs(root, soapEnvelopeNs);
	
	xmlNsPtr xslNs = xmlNewNs(root, (const xmlChar*)"http://www.w3.org/1999/XSL/Transform", (const xmlChar*)"xsl");
	xmlNewNs(root, (const xmlChar*)"http://www.w3.org/2001/XMLSchema-instance", (const xmlChar*)"xsi");
	
	xmlNewNsProp(root, xslNs, (const xmlChar*)"version", (const xmlChar*)"1.0");
	
	xmlNewNs(root, (const xmlChar*)"http://www.w3.org/2001/XMLSchema", (const xmlChar*)"xsd");
	xmlNewNs(root, (const xmlChar*)"http://internet.claro.com.gt/soap/ServiceBus", (const xmlChar*)"ServiceBusSvc");
	xmlNewNs(root, (const xmlChar*)"http://schemas.xmlsoap.org/soap/encoding/", (const xmlChar*)"ns1");
	xmlNewNs(root, (const xmlChar*)"http://schemas.xmlsoap.org/wsdl/", (const xmlChar*)"ns2");
	
	if((headerElements != nil) && ([headerElements count] > 0)) {
		xmlNodePtr headerNode = xmlNewDocNode(doc, soapEnvelopeNs, (const xmlChar*)"Header", NULL);
		xmlAddChild(root, headerNode);
		
		for(NSString *key in [headerElements allKeys]) {
			id header = [headerElements objectForKey:key];
			xmlAddChild(headerNode, [header xmlNodeForDoc:doc elementName:key elementNSPrefix:nil]);
		}
	}
	
	if((bodyElements != nil) && ([bodyElements count] > 0)) {
		xmlNodePtr bodyNode = xmlNewDocNode(doc, soapEnvelopeNs, (const xmlChar*)"Body", NULL);
		xmlAddChild(root, bodyNode);
        
        
        // AGREGO NODOS DE CONFIG
        xmlNodePtr configNode = xmlNewDocNode(doc, nil, (const xmlChar*)"CONFIG", NULL);
		xmlAddChild(bodyNode, configNode);
		
        xmlNodePtr dataNode = xmlNewDocNode(doc, nil, (const xmlChar*)"DATA", nil);
		xmlAddChild(configNode, dataNode);
		
        xmlAddChild(dataNode, [@"kHAjOqyMwNKioBFRpv15" xmlNodeForDoc:doc elementName:@"APPID" elementNSPrefix:nil]);
        xmlAddChild(dataNode, [@"c4qGiuEU71m35SNrVjzgxpnZ6TPMQfbt2eC8saHk" xmlNodeForDoc:doc elementName:@"APPSECRET" elementNSPrefix:nil]);
        xmlAddChild(dataNode, [@"es" xmlNodeForDoc:doc elementName:@"LANG" elementNSPrefix:nil]);
        //
        
        
        NSArray * sortedKeys = [[bodyElements allKeys] sortedArrayUsingSelector: @selector(caseInsensitiveCompare:)];
        
        for (NSString *key in sortedKeys){
            id body = [bodyElements objectForKey:key];
            xmlAddChild(configNode, [body xmlNodeForDoc:doc elementName:key elementNSPrefix: nil]);
        }
        
        /*
        for(NSString *key in [bodyElements allKeys]) {
            id body = [bodyElements objectForKey:key];
            xmlAddChild(bodyNode, [body xmlNodeForDoc:doc elementName:key elementNSPrefix:nil]);
        }*/
    }
	
	xmlChar *buf;
	int size;
	xmlDocDumpFormatMemory(doc, &buf, &size, 1);
	
	NSString *serializedForm = [NSString stringWithCString:(const char*)buf encoding:NSUTF8StringEncoding];
	xmlFree(buf);
	
	xmlFreeDoc(doc);	
	return serializedForm;
}
@end
@implementation ServiceBusBindingResponse
@synthesize headers;
@synthesize bodyParts;
@synthesize error;
- (id)init
{
	if((self = [super init])) {
		headers = nil;
		bodyParts = nil;
		error = nil;
	}
	
	return self;
}
-(void)dealloc {
    self.headers = nil;
    self.bodyParts = nil;
    self.error = nil;	
    [super dealloc];
}
@end
