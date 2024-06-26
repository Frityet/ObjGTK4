/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKAssistant.h"

#import "OGTKWidget.h"
#import "OGTKAssistantPage.h"

@implementation OGTKAssistant

- (instancetype)init
{
	GtkAssistant* gobjectValue = GTK_ASSISTANT(gtk_assistant_new());

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

- (GtkAssistant*)castedGObject
{
	return GTK_ASSISTANT([self gObject]);
}

- (void)addActionWidget:(OGTKWidget*)child
{
	gtk_assistant_add_action_widget([self castedGObject], [child castedGObject]);
}

- (int)appendPage:(OGTKWidget*)page
{
	int returnValue = gtk_assistant_append_page([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)commit
{
	gtk_assistant_commit([self castedGObject]);
}

- (int)currentPage
{
	int returnValue = gtk_assistant_get_current_page([self castedGObject]);

	return returnValue;
}

- (int)npages
{
	int returnValue = gtk_assistant_get_n_pages([self castedGObject]);

	return returnValue;
}

- (OGTKWidget*)nthPage:(int)pageNum
{
	GtkWidget* gobjectValue = GTK_WIDGET(gtk_assistant_get_nth_page([self castedGObject], pageNum));

	OGTKWidget* returnValue = [OGTKWidget withGObject:gobjectValue];
	return returnValue;
}

- (OGTKAssistantPage*)page:(OGTKWidget*)child
{
	GtkAssistantPage* gobjectValue = GTK_ASSISTANT_PAGE(gtk_assistant_get_page([self castedGObject], [child castedGObject]));

	OGTKAssistantPage* returnValue = [OGTKAssistantPage withGObject:gobjectValue];
	return returnValue;
}

- (bool)pageComplete:(OGTKWidget*)page
{
	bool returnValue = gtk_assistant_get_page_complete([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (OFString*)pageTitle:(OGTKWidget*)page
{
	const char* gobjectValue = gtk_assistant_get_page_title([self castedGObject], [page castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (GtkAssistantPageType)pageType:(OGTKWidget*)page
{
	GtkAssistantPageType returnValue = gtk_assistant_get_page_type([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (GListModel*)pages
{
	GListModel* returnValue = gtk_assistant_get_pages([self castedGObject]);

	return returnValue;
}

- (int)insertPageWithPage:(OGTKWidget*)page position:(int)position
{
	int returnValue = gtk_assistant_insert_page([self castedGObject], [page castedGObject], position);

	return returnValue;
}

- (void)nextPage
{
	gtk_assistant_next_page([self castedGObject]);
}

- (int)prependPage:(OGTKWidget*)page
{
	int returnValue = gtk_assistant_prepend_page([self castedGObject], [page castedGObject]);

	return returnValue;
}

- (void)previousPage
{
	gtk_assistant_previous_page([self castedGObject]);
}

- (void)removeActionWidget:(OGTKWidget*)child
{
	gtk_assistant_remove_action_widget([self castedGObject], [child castedGObject]);
}

- (void)removePage:(int)pageNum
{
	gtk_assistant_remove_page([self castedGObject], pageNum);
}

- (void)setCurrentPage:(int)pageNum
{
	gtk_assistant_set_current_page([self castedGObject], pageNum);
}

- (void)setForwardPageFuncWithPageFunc:(GtkAssistantPageFunc)pageFunc data:(gpointer)data destroy:(GDestroyNotify)destroy
{
	gtk_assistant_set_forward_page_func([self castedGObject], pageFunc, data, destroy);
}

- (void)setPageCompleteWithPage:(OGTKWidget*)page complete:(bool)complete
{
	gtk_assistant_set_page_complete([self castedGObject], [page castedGObject], complete);
}

- (void)setPageTitleWithPage:(OGTKWidget*)page title:(OFString*)title
{
	gtk_assistant_set_page_title([self castedGObject], [page castedGObject], [title UTF8String]);
}

- (void)setPageTypeWithPage:(OGTKWidget*)page type:(GtkAssistantPageType)type
{
	gtk_assistant_set_page_type([self castedGObject], [page castedGObject], type);
}

- (void)updateButtonsState
{
	gtk_assistant_update_buttons_state([self castedGObject]);
}


@end