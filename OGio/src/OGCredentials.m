/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCredentials.h"

@implementation OGCredentials

- (instancetype)init
{
	GCredentials* gobjectValue = G_CREDENTIALS(g_credentials_new());

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

- (GCredentials*)castedGObject
{
	return G_CREDENTIALS([self gObject]);
}

- (gpointer)native:(GCredentialsType)nativeType
{
	gpointer returnValue = g_credentials_get_native([self castedGObject], nativeType);

	return returnValue;
}

- (pid_t)unixPid
{
	GError* err = NULL;

	pid_t returnValue = g_credentials_get_unix_pid([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (uid_t)unixUser
{
	GError* err = NULL;

	uid_t returnValue = g_credentials_get_unix_user([self castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (bool)isSameUser:(OGCredentials*)otherCredentials
{
	GError* err = NULL;

	bool returnValue = g_credentials_is_same_user([self castedGObject], [otherCredentials castedGObject], &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (void)setNativeWithNativeType:(GCredentialsType)nativeType native:(gpointer)native
{
	g_credentials_set_native([self castedGObject], nativeType, native);
}

- (bool)setUnixUser:(uid_t)uid
{
	GError* err = NULL;

	bool returnValue = g_credentials_set_unix_user([self castedGObject], uid, &err);

	if(err != NULL) {
		OGErrorException* exception = [OGErrorException exceptionWithGError:err];
		g_error_free(err);
		@throw exception;
	}

	return returnValue;
}

- (OFString*)toString
{
	gchar* gobjectValue = g_credentials_to_string([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:true] : nil);
	return returnValue;
}


@end
