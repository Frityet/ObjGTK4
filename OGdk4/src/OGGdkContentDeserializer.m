/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGdkContentDeserializer.h"

#import <OGio/OGCancellable.h>
#import <OGio/OGInputStream.h>

@implementation OGGdkContentDeserializer

- (GdkContentDeserializer*)castedGObject
{
	return GDK_CONTENT_DESERIALIZER([self gObject]);
}

- (OGCancellable*)cancellable
{
	GCancellable* gobjectValue = G_CANCELLABLE(gdk_content_deserializer_get_cancellable([self castedGObject]));

	OGCancellable* returnValue = [OGCancellable withGObject:gobjectValue];
	return returnValue;
}

- (GType)gtype
{
	GType returnValue = gdk_content_deserializer_get_gtype([self castedGObject]);

	return returnValue;
}

- (OGInputStream*)inputStream
{
	GInputStream* gobjectValue = G_INPUT_STREAM(gdk_content_deserializer_get_input_stream([self castedGObject]));

	OGInputStream* returnValue = [OGInputStream withGObject:gobjectValue];
	return returnValue;
}

- (OFString*)mimeType
{
	const char* gobjectValue = gdk_content_deserializer_get_mime_type([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (int)priority
{
	int returnValue = gdk_content_deserializer_get_priority([self castedGObject]);

	return returnValue;
}

- (gpointer)taskData
{
	gpointer returnValue = gdk_content_deserializer_get_task_data([self castedGObject]);

	return returnValue;
}

- (gpointer)userData
{
	gpointer returnValue = gdk_content_deserializer_get_user_data([self castedGObject]);

	return returnValue;
}

- (GValue*)value
{
	GValue* returnValue = gdk_content_deserializer_get_value([self castedGObject]);

	return returnValue;
}

- (void)returnError:(GError*)error
{
	gdk_content_deserializer_return_error([self castedGObject], error);
}

- (void)returnSuccess
{
	gdk_content_deserializer_return_success([self castedGObject]);
}

- (void)setTaskDataWithData:(gpointer)data notify:(GDestroyNotify)notify
{
	gdk_content_deserializer_set_task_data([self castedGObject], data, notify);
}


@end
