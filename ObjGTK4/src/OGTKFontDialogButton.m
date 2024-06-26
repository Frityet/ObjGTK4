/*
 * SPDX-FileCopyrightText: 2015-2017 Tyler Burton <software@tylerburton.ca>
 * SPDX-FileCopyrightText: 2015-2024 The ObjGTK authors, see AUTHORS file
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#import "OGTKFontDialogButton.h"

#import "OGTKFontDialog.h"

@implementation OGTKFontDialogButton

- (instancetype)init:(OGTKFontDialog*)dialog
{
	GtkFontDialogButton* gobjectValue = GTK_FONT_DIALOG_BUTTON(gtk_font_dialog_button_new([dialog castedGObject]));

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

- (GtkFontDialogButton*)castedGObject
{
	return GTK_FONT_DIALOG_BUTTON([self gObject]);
}

- (OGTKFontDialog*)dialog
{
	GtkFontDialog* gobjectValue = GTK_FONT_DIALOG(gtk_font_dialog_button_get_dialog([self castedGObject]));

	OGTKFontDialog* returnValue = [OGTKFontDialog withGObject:gobjectValue];
	return returnValue;
}

- (PangoFontDescription*)fontDesc
{
	PangoFontDescription* returnValue = gtk_font_dialog_button_get_font_desc([self castedGObject]);

	return returnValue;
}

- (OFString*)fontFeatures
{
	const char* gobjectValue = gtk_font_dialog_button_get_font_features([self castedGObject]);

	OFString* returnValue = ((gobjectValue != NULL) ? [OFString stringWithUTF8StringNoCopy:(char * _Nonnull)gobjectValue freeWhenDone:false] : nil);
	return returnValue;
}

- (PangoLanguage*)language
{
	PangoLanguage* returnValue = gtk_font_dialog_button_get_language([self castedGObject]);

	return returnValue;
}

- (GtkFontLevel)level
{
	GtkFontLevel returnValue = gtk_font_dialog_button_get_level([self castedGObject]);

	return returnValue;
}

- (bool)useFont
{
	bool returnValue = gtk_font_dialog_button_get_use_font([self castedGObject]);

	return returnValue;
}

- (bool)useSize
{
	bool returnValue = gtk_font_dialog_button_get_use_size([self castedGObject]);

	return returnValue;
}

- (void)setDialog:(OGTKFontDialog*)dialog
{
	gtk_font_dialog_button_set_dialog([self castedGObject], [dialog castedGObject]);
}

- (void)setFontDesc:(const PangoFontDescription*)fontDesc
{
	gtk_font_dialog_button_set_font_desc([self castedGObject], fontDesc);
}

- (void)setFontFeatures:(OFString*)fontFeatures
{
	gtk_font_dialog_button_set_font_features([self castedGObject], [fontFeatures UTF8String]);
}

- (void)setLanguage:(PangoLanguage*)language
{
	gtk_font_dialog_button_set_language([self castedGObject], language);
}

- (void)setLevel:(GtkFontLevel)level
{
	gtk_font_dialog_button_set_level([self castedGObject], level);
}

- (void)setUseFont:(bool)useFont
{
	gtk_font_dialog_button_set_use_font([self castedGObject], useFont);
}

- (void)setUseSize:(bool)useSize
{
	gtk_font_dialog_button_set_use_size([self castedGObject], useSize);
}


@end