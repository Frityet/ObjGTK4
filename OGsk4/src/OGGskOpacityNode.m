/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGGskOpacityNode.h"

@implementation OGGskOpacityNode

- (instancetype)initWithChild:(GskRenderNode*)child opacity:(float)opacity
{
	GskOpacityNode* gobjectValue = (gsk_opacity_node_new(child, opacity));

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



- (GskRenderNode*)child
{
	GskRenderNode* returnValue = gsk_opacity_node_get_child([self castedGObject]);

	return returnValue;
}

- (float)opacity
{
	float returnValue = gsk_opacity_node_get_opacity([self castedGObject]);

	return returnValue;
}


@end