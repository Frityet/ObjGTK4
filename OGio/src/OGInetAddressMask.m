/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGInetAddressMask.h"

#import "OGInetAddress.h"

@implementation OGInetAddressMask

- (instancetype)initWithAddr:(OGInetAddress*)addr length:(guint)length
{
	GError* err = NULL;

	GInetAddressMask* gobjectValue = G_INET_ADDRESS_MASK(g_inet_address_mask_new([addr castedGObject], length, &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (instancetype)initFromString:(OFString*)maskString
{
	GError* err = NULL;

	GInetAddressMask* gobjectValue = G_INET_ADDRESS_MASK(g_inet_address_mask_new_from_string([maskString UTF8String], &err));

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		if(gobjectValue != NULL)
			g_object_unref(gobjectValue);
		@throw exception;
	}

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

- (GInetAddressMask*)castedGObject
{
	return G_INET_ADDRESS_MASK([self gObject]);
}

- (bool)equal:(OGInetAddressMask*)mask2
{
	bool returnValue = g_inet_address_mask_equal([self castedGObject], [mask2 castedGObject]);

	return returnValue;
}

- (OGInetAddress*)address
{
	GInetAddress* gobjectValue = G_INET_ADDRESS(g_inet_address_mask_get_address([self castedGObject]));

	OGInetAddress* returnValue = [OGInetAddress withGObject:gobjectValue];
	return returnValue;
}

- (GSocketFamily)family
{
	GSocketFamily returnValue = g_inet_address_mask_get_family([self castedGObject]);

	return returnValue;
}

- (guint)length
{
	guint returnValue = g_inet_address_mask_get_length([self castedGObject]);

	return returnValue;
}

- (bool)matches:(OGInetAddress*)address
{
	bool returnValue = g_inet_address_mask_matches([self castedGObject], [address castedGObject]);

	return returnValue;
}

- (OFString*)toString
{
	gchar* gobjectValue = g_inet_address_mask_to_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end
