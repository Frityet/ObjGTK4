/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGProxyAddress.h"

#import "OGSocketAddress.h"
#import "OGInetAddress.h"

@implementation OGProxyAddress

- (instancetype)initWithInetaddr:(OGInetAddress*)inetaddr port:(guint16)port protocol:(OFString*)protocol destHostname:(OFString*)destHostname destPort:(guint16)destPort username:(OFString*)username password:(OFString*)password
{
	GProxyAddress* gobjectValue = G_PROXY_ADDRESS(g_proxy_address_new([inetaddr castedGObject], port, [protocol UTF8String], [destHostname UTF8String], destPort, [username UTF8String], [password UTF8String]));

	@try {
		self = [super initWithGObject:gobjectValue];
	} @catch (id e) {
		g_object_unref(gobjectValue);
		[self release];
		@throw e;
	}

	g_object_unref(gobjectValue);
	return self;
}

- (GProxyAddress*)castedGObject
{
	return G_PROXY_ADDRESS([self gObject]);
}

- (OFString*)destinationHostname
{
	const gchar* gobjectValue = g_proxy_address_get_destination_hostname([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (guint16)destinationPort
{
	guint16 returnValue = g_proxy_address_get_destination_port([self castedGObject]);

	return returnValue;
}

- (OFString*)destinationProtocol
{
	const gchar* gobjectValue = g_proxy_address_get_destination_protocol([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)password
{
	const gchar* gobjectValue = g_proxy_address_get_password([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)protocol
{
	const gchar* gobjectValue = g_proxy_address_get_protocol([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)uri
{
	const gchar* gobjectValue = g_proxy_address_get_uri([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (OFString*)username
{
	const gchar* gobjectValue = g_proxy_address_get_username([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}


@end
