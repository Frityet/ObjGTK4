/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGFileMonitor.h"

@implementation OGFileMonitor

- (GFileMonitor*)castedGObject
{
	return G_FILE_MONITOR([self gObject]);
}

- (bool)cancel
{
	bool returnValue = g_file_monitor_cancel([self castedGObject]);

	return returnValue;
}

- (void)emitEventWithChild:(GFile*)child otherFile:(GFile*)otherFile eventType:(GFileMonitorEvent)eventType
{
	g_file_monitor_emit_event([self castedGObject], child, otherFile, eventType);
}

- (bool)isCancelled
{
	bool returnValue = g_file_monitor_is_cancelled([self castedGObject]);

	return returnValue;
}

- (void)setRateLimit:(gint)limitMsecs
{
	g_file_monitor_set_rate_limit([self castedGObject], limitMsecs);
}


@end
