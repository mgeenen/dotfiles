OS X install
============

1. UEFI settings:
  - Load optimized defaults
  - VT-d: disable
  - XHCI: Auto statt "Smart auto"
  - EHCI: enable
2. Stick booten
  - Falls nicht bootet: Im bootloader zu den BootArgs hinzufügen: nv_disable=1
3. Utilities -> Disk Utility -> SSD komplett löschen:
  - Name: OS X
  - GUID partitionstabelle
  - OS X Extended (Journaled)
4. Installieren auf Platte

Post OS X install
=================

1. Von Stick booten
1. Benutzer anlegen:
  - Voller Name: Niklas Wulf
  - Nutzername: nwulf
  - iCloud jeder wie er möchte
1. Multibeast vom Stick starten
  - Quickstart UEFI boot mode anklicken -> Build -> Install
1. Booten ohne stick
1. Falls er nicht bootet:
  - Von Stick booten
  - NVidia web driver installieren (ist aufm stick) -> reboot ohne stick
1. Falls netzwerk nicht mehr functioniert:
  - RealtekRTL8111 aus Multibeast installieren (je nach Mainboard am besten prüfen, ob anderer Treiber)

Post post install
=================

1. sudo trimforce enable -> restart -> checken ob TRIM enabled ist (Apfel Menü -> Über diesen Mac -> Systemreport -> SATA -> TRIM Unterstützung: Ja)
1. Systemeinstellungen wie gewünscht
  - Maus -> Scrollrichtung natürlich aus
  - Mission Control -> Programme gruppieren + MissionControl:Maustaste 4 + Desktop:Maustaste 5
  - Sicherheit -> Schloss öffnen -> Apps keine Einschränkungen
  - Tastatur: Sondertasten -> Caps-lock "No action" ist nett
1. git ausführen -> command line tools werden installiert -> sudo git -> agree to AGB
1. AppStore apps installieren (XCode, Telegram, The Unarchiver)
1. dotfiles:
````
  mkdir -p ~/Developer/Misc
  cd ~/Developer/Misc
  git clone https://github.com/Kampfgnom/dotfiles
  cd dotfiles
  git submodule update --init
  source bootstrap.sh
  source .osx
  bin/brew-setup.sh
  bin/brew-cli-tools.sh
  bin/brew-casks.sh
  bin/brew-node-setup.sh
````

6. Software vom Stick
  1. iStat Menus
    - iStat Uhr einrichten (mit ordentlichem Format etc) und Systemuhr unter Systemeinstellungen -> Datum&Uhrzeit ausblenden
  1. Tower
    - Einstellungen: always offer to stash -> false, always update submodules -> true, git binary: /usr/local/bin/git, username+email
1. TimeMachine backup mounten + daten rausholen:
  - zum production-server-osx connecten -> timemachine mounten -> sparsebundle des rechners öffnen
  - Eure eigenen daten rausholen, muss jeder selber wissen
1. `ssh-keygen -t rsa -b 4096` # (Stash does not support ed25519)
  - [In Stash eintrage](https://confluence.atlassian.com/bitbucketserver/ssh-user-keys-for-personal-use-776639793.html)
1. Install Qt nach ~/Developer/Qt (online installer)
  1. Nur Qt 5.5 clang_64 + Qt Creator, sonst alles abwählen
  1. beautifier:
    - Qt Creator starten
    - Menü -> QtCreator -> About Plugins -> C++ -> Beautifier anhaken
    - Qt Creator neustarten
    - Qt Creator -> Einstellungen -> Beautifier -> clang-format:
      - Pfad: /usr/local/bin/clang-format, 
      - Use predifined Style: File
      - Apply
    - ShortCut einrichten
      - QtCreator Einstellungen -> Environment -> Keyboard -> clang-format -> Format File
      - Cmd + Ä machen wir da
  1. sort tool (See init/sort-tool-screenshot.png) + Keyboadshortcut CTRL+CMD+SHIFT+S
1. email einstellungen
  1. GPG Keychain aus TimeMachineBackup wiederherstellen
    `rsync -avx /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/.gnupg .`
    - Hat bei mir erst nach einem Neustart auch in Mail funktioniert
  1. Mail Signatur (das hier lesen!: http://matt.coneybeare.me/how-to-make-an-html-signature-in-apple-mail-for-mavericks-os-x-10-dot-9/)
    1. Signatur vom TimeMachine holen: `open /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/Library/Mail/V2/MailData/Signatures/`
      - signatur in Sublime oder so öffnen
    1. Signatur INHALT (ab `<style ...`) in eine aus mail heraus NEU ERSTELLTE signatur pasten (dabei header stehen lassen) und die signatur locken: `open Library/Mail/V3/MailData/Signatures/`
1. docker-machine create -d virtualbox default
1. Falls Spotlight im Arsch ist: `sudo mdutil -E /` oder in Systemeinstellungen -> spotlight -> haken an und abwählen oder komplette festplatte zu ausnahmen hinzufügen und direkt wieder löschen

sublime-text packages
=====================

1. https://packagecontrol.io/installation#st3
1. Packages:
  - DocBlockr
  - Dockerfile Syntax
  - EditorConfig
  - GitGutter
  - JsFormat
  - MarkdownEditing
  - Markdown Preview
  - nginx
  - QMakeProject
  - SideBarEnhancements
  - Theme - Soda
  - Seti_UI
  - SublimeLinter
  - SublimeLinter-jshint
  - SublimeLinter-json
  - Swift for F*king Sublime
  - SyncedSidebar
1. SublimeText menu - Preferences - Settings - User
````
{
  "caret_extra_bottom": 1,
  "caret_extra_top": 1,
  "caret_extra_width": 1,
  "color_scheme": "Packages/User/SublimeLinter/Monokai (SL).tmTheme",
  "detect_indentation": false,
  "draw_white_space": "all",
  "font_face": "Hack",
  "font_size": 14,
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "hot_exit": false,
  "ignored_packages":
  [
    "Markdown",
    "Vintage"
  ],
  "line_padding_bottom": 5,
  "match_brackets": true,
  "match_brackets_angle": true,
  "overlay_scroll_bars": "enabled",
  "rulers":
  [
    180
  ],
  "show_encoding": true,
  "show_line_endings": true,
  "soda_classic_tabs": true,
  "theme": "Soda Dark 3.sublime-theme"
}
````
1. SublimeText menu - Preferences - Package Settings - JsFormat - User
````
{
  // jsformat options
  "format_on_save": true,
  "format_selection": false,
  "jsbeautifyrc_files": true,
  "ignore_sublime_settings": true,
  "format_on_save_extensions": ["js", "json"]
}
````
1. Und jetzt kommt der Clou :)
  - In ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
    Seti_UI nach "Theme - Soda" umbenennen
  -> Sidebar Icons!
1. SublimeText menu - Preferences - Package Settings - MarkdownEditing - Markdown (Standard settings) - User
````
{
  "extensions":
  [
    "mmd",
    "md",
    "markdown"
  ],
  "color_scheme": "Packages/MarkdownEditing/MarkdownEditor-Dark.tmTheme",
  "line_numbers": true,
  "highlight_line": true
}
````

