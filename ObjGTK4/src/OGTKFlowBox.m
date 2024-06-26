/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFlowBox.h"

#import "OGTKFlowBoxChild.h"
#import "OGTKAdjustment.h"

@implementation OGTKFlowBox

- (instancetype)init
{
	GtkFlowBox* gobjectValue = GTK_FLOW_BOX(gtk_flow_box_new());

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

- (GtkFlowBox*)castedGObject
{
	return GTK_FLOW_BOX([self gObject]);
}

- (void)append:(OGTKWidget*)child
{
	gtk_flow_box_append([self castedGObject], [child castedGObject]);
}

- (void)bindModelWithModel:(GListModel*)model createWidgetFunc:(GtkFlowBoxCreateWidgetFunc)createWidgetFunc userData:(gpointer)userData userDataFreeFunc:(GDestroyNotify)userDataFreeFunc
{
	gtk_flow_box_bind_model([self castedGObject], model, createWidgetFunc, userData, userDataFreeFunc);
}

- (bool)activateOnSingleClick
{
	bool returnValue = gtk_flow_box_get_activate_on_single_click([self castedGObject]);

	return returnValue;
}

- (OGTKFlowBoxChild*)childAtIndex:(int)idx
{
	GtkFlowBoxChild* gobjectValue = GTK_FLOW_BOX_CHILD(gtk_flow_box_get_child_at_index([self castedGObject], idx));

	OGTKFlowBoxChild* returnValue = [OGTKFlowBoxChild withGObject:gobjectValue];
	return returnValue;
}

- (OGTKFlowBoxChild*)childAtPosWithX:(int)x y:(int)y
{
	GtkFlowBoxChild* gobjectValue = GTK_FLOW_BOX_CHILD(gtk_flow_box_get_child_at_pos([self castedGObject], x, y));

	OGTKFlowBoxChild* returnValue = [OGTKFlowBoxChild withGObject:gobjectValue];
	return returnValue;
}

- (guint)columnSpacing
{
	guint returnValue = gtk_flow_box_get_column_spacing([self castedGObject]);

	return returnValue;
}

- (bool)homogeneous
{
	bool returnValue = gtk_flow_box_get_homogeneous([self castedGObject]);

	return returnValue;
}

- (guint)maxChildrenPerLine
{
	guint returnValue = gtk_flow_box_get_max_children_per_line([self castedGObject]);

	return returnValue;
}

- (guint)minChildrenPerLine
{
	guint returnValue = gtk_flow_box_get_min_children_per_line([self castedGObject]);

	return returnValue;
}

- (guint)rowSpacing
{
	guint returnValue = gtk_flow_box_get_row_spacing([self castedGObject]);

	return returnValue;
}

- (GList*)selectedChildren
{
	GList* returnValue = gtk_flow_box_get_selected_children([self castedGObject]);

	return returnValue;
}

- (GtkSelectionMode)selectionMode
{
	GtkSelectionMode returnValue = gtk_flow_box_get_selection_mode([self castedGObject]);

	return returnValue;
}

- (void)insertWithWidget:(OGTKWidget*)widget position:(int)position
{
	gtk_flow_box_insert([self castedGObject], [widget castedGObject], position);
}

- (void)invalidateFilter
{
	gtk_flow_box_invalidate_filter([self castedGObject]);
}

- (void)invalidateSort
{
	gtk_flow_box_invalidate_sort([self castedGObject]);
}

- (void)prepend:(OGTKWidget*)child
{
	gtk_flow_box_prepend([self castedGObject], [child castedGObject]);
}

- (void)remove:(OGTKWidget*)widget
{
	gtk_flow_box_remove([self castedGObject], [widget castedGObject]);
}

- (void)removeAll
{
	gtk_flow_box_remove_all([self castedGObject]);
}

- (void)selectAll
{
	gtk_flow_box_select_all([self castedGObject]);
}

- (void)selectChild:(OGTKFlowBoxChild*)child
{
	gtk_flow_box_select_child([self castedGObject], [child castedGObject]);
}

- (void)selectedForeachWithFunc:(GtkFlowBoxForeachFunc)func data:(gpointer)data
{
	gtk_flow_box_selected_foreach([self castedGObject], func, data);
}

- (void)setActivateOnSingleClick:(bool)single
{
	gtk_flow_box_set_activate_on_single_click([self castedGObject], single);
}

- (void)setColumnSpacing:(guint)spacing
{
	gtk_flow_box_set_column_spacing([self castedGObject], spacing);
}

- (void)setFilterFuncWithFilterFunc:(GtkFlowBoxFilterFunc)filterFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_flow_box_set_filter_func([self castedGObject], filterFunc, userData, destroy);
}

- (void)setHadjustment:(OGTKAdjustment*)adjustment
{
	gtk_flow_box_set_hadjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)setHomogeneous:(bool)homogeneous
{
	gtk_flow_box_set_homogeneous([self castedGObject], homogeneous);
}

- (void)setMaxChildrenPerLine:(guint)nchildren
{
	gtk_flow_box_set_max_children_per_line([self castedGObject], nchildren);
}

- (void)setMinChildrenPerLine:(guint)nchildren
{
	gtk_flow_box_set_min_children_per_line([self castedGObject], nchildren);
}

- (void)setRowSpacing:(guint)spacing
{
	gtk_flow_box_set_row_spacing([self castedGObject], spacing);
}

- (void)setSelectionMode:(GtkSelectionMode)mode
{
	gtk_flow_box_set_selection_mode([self castedGObject], mode);
}

- (void)setSortFuncWithSortFunc:(GtkFlowBoxSortFunc)sortFunc userData:(gpointer)userData destroy:(GDestroyNotify)destroy
{
	gtk_flow_box_set_sort_func([self castedGObject], sortFunc, userData, destroy);
}

- (void)setVadjustment:(OGTKAdjustment*)adjustment
{
	gtk_flow_box_set_vadjustment([self castedGObject], [adjustment castedGObject]);
}

- (void)unselectAll
{
	gtk_flow_box_unselect_all([self castedGObject]);
}

- (void)unselectChild:(OGTKFlowBoxChild*)child
{
	gtk_flow_box_unselect_child([self castedGObject], [child castedGObject]);
}


@end