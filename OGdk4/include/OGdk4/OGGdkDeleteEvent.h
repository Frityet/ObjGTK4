/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gdk/gdk.h>

#import "OGGdkEvent.h"

/**
 * An event related to closing a top-level surface.
 *
 */
@interface OGGdkDeleteEvent : OGGdkEvent
{

}


/**
 * Methods
 */

- (GdkDeleteEvent*)castedGObject;

@end
