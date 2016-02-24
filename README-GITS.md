1. sudo trimforce enable -> restart
1. AppStore apps installieren (XCode aus dmg ist mist)
1. Systemeinstellungen wie gewünscht
1. git ausführen -> command line tools werden installiert -> sudo git -> agree to AGB
1. iStat Menus installiert
1. dotfiles

````
  source bootstrap.sh
  source .osx
  bin/brew-setup.sh
  bin/brew-cli-tools.sh
  bin/brew-casks.sh
  bin/brew-node-setup.sh
````

1. TimeMachine backup wiederherstellen:
  1. zum production-server-osx connecten, timemachine mounten
  1. ~/Developer vom TimeMachine geholt
  1. GPG Keychain aus TimeMachineBackup:
    `rsync -avx /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/.gnupg .`
  1. Mail Signatur (nach: http://matt.coneybeare.me/how-to-make-an-html-signature-in-apple-mail-for-mavericks-os-x-10-dot-9/)
    1. Signatur vom TimeMachine holen: `open /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/Library/Mail/V2/MailData/Signatures/`
      - signatur in Sublime oder so öffnen
    1. Signatur INHALT in eine aus mail heraus NEU ERSTELLTE signatur pasten und locken: `open Library/Mail/V3/MailData/Signatures/`
1. `ssh-keygen -t rsa -b 4096` # (Stash does not support ed25519)
  Ab nach Stash, github, etc damit (alte keys womöglich entfernen)
1. Install Qt (online installer)
  1. beautifier aktivieren + clang-format konfigurieren (Use predifined Style: File)
1. email einstellungen
1. docker-machine create -d virtualbox default
1. docker-machine ip nach /etc/hosts

sublime-text packages
=====================

1. https://packagecontrol.io/installation#st3
1. Packages:
  - DocBlockr
  - Dockerfile Syntax
  - EditorConfig
  - GitGutter
  - JsFormat
  - Markdown Extended
  - Markdown Preview
  - nginx
  - QMakeProject
  - SideBarEnhancements
  - Theme - Soda
  - Theme - Seti_UI
  - SublimeLinter
  - SublimeLinter-jshint
  - SublimeLinter-json
  - Swift for F*king Sublime
1. Preferences - User
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
1. Preferences - Package Settings - JsFormat - User
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
  - In /Users/nwulf/Library/Application\ Support/Sublime\ Text\ 3/Packages
    Seti_UI nach "Theme - Soda" umbenennen
  -> Sidebar Icons!
1. Preferences - Package Settings - MarkdownEditing - User
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

