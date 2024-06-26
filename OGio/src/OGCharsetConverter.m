/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGCharsetConverter.h"

@implementation OGCharsetConverter

- (instancetype)initWithToCharset:(OFString*)toCharset fromCharset:(OFString*)fromCharset
{
	GError* err = NULL;

	GCharsetConverter* gobjectValue = G_CHARSET_CONVERTER(g_charset_converter_new([toCharset UTF8String], [fromCharset UTF8String], &err));

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

- (GCharsetConverter*)castedGObject
{
	return G_CHARSET_CONVERTER([self gObject]);
}

- (guint)numFallbacks
{
	guint returnValue = g_charset_converter_get_num_fallbacks([self castedGObject]);

	return returnValue;
}

- (bool)useFallback
{
	bool returnValue = g_charset_converter_get_use_fallback([self castedGObject]);

	return returnValue;
}

- (void)setUseFallback:(bool)useFallback
{
	g_charset_converter_set_use_fallback([self castedGObject], useFallback);
}


@end
