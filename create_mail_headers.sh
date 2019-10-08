#!/bin/sh

OUTDIR="./MailHeaders"
ROOT="/System"

./class-dump-swift -I -H -o "$OUTDIR/MailUI" "$ROOT/Applications/Mail.app/Contents/MacOS/Mail"
./class-dump-swift -I -H -o "$OUTDIR/EmailAddressing" "$ROOT/Library/PrivateFrameworks/EmailAddressing.framework/EmailAddressing"
./class-dump-swift -I -H -o "$OUTDIR/MailCore" "$ROOT/Library/PrivateFrameworks/MailCore.framework/MailCore"
./class-dump-swift -I -H -o "$OUTDIR/MailUIFW" "$ROOT/Library/PrivateFrameworks/MailUI.framework"
./class-dump-swift -I -H -o "$OUTDIR/MailFW" "$ROOT/Library/PrivateFrameworks/Mail.framework"
