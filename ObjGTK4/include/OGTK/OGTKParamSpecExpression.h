/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#include <gtk/gtk.h>

#import "OGTKParamSpec.h"

/**
 * A `GParamSpec` for properties holding a `GtkExpression`.
 *
 */
@interface OGTKParamSpecExpression : OGTKParamSpec
{

}


/**
 * Methods
 */

- (GtkParamSpecExpression*)castedGObject;

@end
