MailReceipt
=========

Mail Receipt is a Mac OS X application which is adds two button to composing window for delivery notification and read receipt requests.

Latest supported version is macOS Monterey (12.4) Mail 16.0 (3696.100.31)

Install
-------

1. To allow bundle plugins in Mail.app type in terminal: <pre>defaults write com.apple.mail EnableBundles -bool true</pre>

2. Download latest build from the [Release page](https://github.com/scr34m/MailReceipt/releases)

3. Enabling MailReceipt plugin in Mail.app
   - Go to "Mail > Preferences > General"
   - Click "Manage Plug-ins" button
   - Check mark the "MailReceipt.mailbundle"
   - Click "Apply and Restart Mail.app" button


Usage
-----

The buttons visible in the subject line in the email compose window are:
- `D` is a request for the receiving mail server to send a DSN (delivery status notification) as soon as it receives the email (i.e. Return-Receipt-To).
- `R` is a request for the receiving email client to send a DSN as soon as the person opens the email (i.e. Disposition-Notification-To).


Support
-------

BTC 3AmU9LBHVw4zoEfuZbLikfPTnxMsgJvFdU or with Paypal [![Donate with Paypal](https://www.paypalobjects.com/webstatic/en_US/btn/btn_donate_pp_142x27.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=6EHPY7RM8A4JY)