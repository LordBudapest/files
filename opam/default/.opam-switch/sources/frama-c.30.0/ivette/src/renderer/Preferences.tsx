/* ************************************************************************ */
/*                                                                          */
/*   This file is part of Frama-C.                                          */
/*                                                                          */
/*   Copyright (C) 2007-2024                                                */
/*     CEA (Commissariat à l'énergie atomique et aux énergies               */
/*          alternatives)                                                   */
/*                                                                          */
/*   you can redistribute it and/or modify it under the terms of the GNU    */
/*   Lesser General Public License as published by the Free Software        */
/*   Foundation, version 2.1.                                               */
/*                                                                          */
/*   It is distributed in the hope that it will be useful,                  */
/*   but WITHOUT ANY WARRANTY; without even the implied warranty of         */
/*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          */
/*   GNU Lesser General Public License for more details.                    */
/*                                                                          */
/*   See the GNU Lesser General Public License version 2.1                  */
/*   for more details (enclosed in the file licenses/LGPLv2.1).             */
/*                                                                          */
/* ************************************************************************ */

// --------------------------------------------------------------------------
// --- Main React Component rendered by './index.js'
// --------------------------------------------------------------------------

/*
   Template from $(DOME)/template/Settings.js

   This module shall export a React Component that
   will be rendered (with empty props and children)
   in the settings window of your application.

*/

import React from 'react';

import * as Settings from 'dome/data/settings';
import * as Forms from 'dome/layout/forms';
import * as Themes from 'dome/themes';
import * as IvettePrefs from 'ivette/prefs';

// --------------------------------------------------------------------------
// --- Theme Fields
// --------------------------------------------------------------------------

const themeOptions: Forms.MenuFieldOption<Themes.ColorSettings>[] = [
  { value: 'light', label: 'Light Theme' },
  { value: 'dark', label: 'Dark Theme' },
  { value: 'system', label: 'System Defaults' },
];

function ThemeFields(): JSX.Element {
  const state = Forms.useValid(Themes.useColorThemeSettings());
  return (
    <Forms.MenuField<Themes.ColorSettings>
      label="Color Theme"
      title="Select global color theme for the application"
      state={state}
      defaultValue='system'
      options={themeOptions}
    />
  );
}

// --------------------------------------------------------------------------
// --- Editor Fields
// --------------------------------------------------------------------------

function EditorFields(): JSX.Element {
  const fontsize = Forms.useValid(
    Settings.useGlobalSettings(IvettePrefs.EditorFontSize)
  );
  const cmd = Forms.useDefined(Forms.useValid(
    Settings.useGlobalSettings(IvettePrefs.EditorCommand)
  ));
  const titleCmd =
    'Command to open an external editor on Ctrl-click in the source code view.'
    + '\nUse %s for the file name, %n for the line number'
    + ' and %c for the selected character.';
  return (
    <>
      <Forms.SliderField
        state={fontsize}
        label="Font Size"
        title={`Set the font size of editors`}
        min={8}
        max={32}
        step={2}
      />
      <Forms.TextCodeField
        state={cmd}
        label="Command"
        title={titleCmd}
      />
    </>
  );
}

// --------------------------------------------------------------------------
// --- Console Scrollback Forms
// --------------------------------------------------------------------------

function ConsoleFields(): JSX.Element {
  const scrollback = Forms.useDefined(Forms.useValid(
    Settings.useGlobalSettings(IvettePrefs.ConsoleScrollback),
  ));
  return (
    <Forms.SpinnerField
      state={scrollback}
      label="Console History"
      title="Number of lines kept from Frama-C output"
      units="l"
      min={0} step={500} max={20_000}
    />
  );
}

function NotificationFields(): JSX.Element {
  const timer = Forms.useDefined(Forms.useValid(
    Settings.useGlobalSettings(IvettePrefs.NotificationTimer),
  ));
  return (
    <Forms.SpinnerField
      state={timer}
      label="Notification Timer"
      title="Time before notifications vanish (in seconds, 0 means no timer)"
      units="s"
      min={0} step={1} max={60}
    />
  );
}

// --------------------------------------------------------------------------
// --- Export Components
// --------------------------------------------------------------------------

export default function Preferences(): JSX.Element {
  return (
    <Forms.PageForm>
      <Forms.Section label="Theme" unfold>
        <ThemeFields />
      </Forms.Section>
      <Forms.Section label="Editors" unfold>
        <EditorFields />
      </Forms.Section>
      <Forms.Section label="Console" unfold>
        <ConsoleFields />
        <NotificationFields />
      </Forms.Section>
    </Forms.PageForm>
  );
}

// --------------------------------------------------------------------------
