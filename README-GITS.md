1. sudo trimforce enable -> restart
1. AppStore apps installieren (XCode aus dmg ist mist)
1. Systemeinstellungen wie gewünscht
1. git ausführen -> command line tools werden installiert -> sudo git -> agree to AGB
1. iStat Menus installiert
1. dotfiles (see README)
1. TimeMachine backup wiederherstellen:
  1. zum production-server-osx connecten, timemachine mounten
  1. ~/Developer vom TimeMachine geholt
  1. GPG Keychain aus TimeMachineBackup:
    rsync -avx /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/.gnupg .
  1. Mail Signatur (nach: http://matt.coneybeare.me/how-to-make-an-html-signature-in-apple-mail-for-mavericks-os-x-10-dot-9/)
    1. Signatur vom TimeMachine holen: open /Volumes/Time\ Machine\ Backups/Backups.backupdb/pc02/Latest/OS\ X/Users/niklas/Library/Mail/V2/MailData/Signatures/
      - signatur in Sublime oder so öffnen
    1. Signatur INHALT in eine aus mail heraus NEU ERSTELLTE signatur pasten und locken: open Library/Mail/V3/MailData/Signatures/
1. ssh-keygen -t rsa -b 4096 # (Stash does not support ed25519)
  Ab nach Stash, github, etc damit (alte keys womöglich entfernen)
1. Install Qt (online installer)
  1. beautifier aktivieren + clang-format konfigurieren
1. email einstellungen
1. Sublime Text package
1. docker-machine create -d virtualbox default
1. npm
  nodemon
1. docker-machine ip nach /etc/hosts
