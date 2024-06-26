/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTlsPassword.h"

@implementation OGTlsPassword

- (instancetype)initWithFlags:(GTlsPasswordFlags)flags description:(OFString*)description
{
	GTlsPassword* gobjectValue = G_TLS_PASSWORD(g_tls_password_new(flags, [description UTF8String]));

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

- (GTlsPassword*)castedGObject
{
	return G_TLS_PASSWORD([self gObject]);
}

- (OFString*)description
{
	const gchar* gobjectValue = g_tls_password_get_description([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GTlsPasswordFlags)flags
{
	GTlsPasswordFlags returnValue = g_tls_password_get_flags([self castedGObject]);

	return returnValue;
}

- (const guchar*)value:(gsize*)length
{
	const guchar* returnValue = g_tls_password_get_value([self castedGObject], length);

	return returnValue;
}

- (OFString*)warning
{
	const gchar* gobjectValue = g_tls_password_get_warning([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (void)setDescription:(OFString*)description
{
	g_tls_password_set_description([self castedGObject], [description UTF8String]);
}

- (void)setFlags:(GTlsPasswordFlags)flags
{
	g_tls_password_set_flags([self castedGObject], flags);
}

- (void)setValueWithValue:(const guchar*)value length:(gssize)length
{
	g_tls_password_set_value([self castedGObject], value, length);
}

- (void)setValueFullWithValue:(guchar*)value length:(gssize)length destroy:(GDestroyNotify)destroy
{
	g_tls_password_set_value_full([self castedGObject], value, length, destroy);
}

- (void)setWarning:(OFString*)warning
{
	g_tls_password_set_warning([self castedGObject], [warning UTF8String]);
}


@end
