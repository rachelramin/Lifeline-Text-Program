//TODO

[Lifeline](http://i.imgur.com/ItQ03be.png)

Lifeline is a panic button built into a widget on your phone. If you're in any danger, and cannot contact 911, you're provided a method of which to silently reach out to your emergency contacts, to ask them to call 911 or otherwise send help on your behalf.

Lifeline is written using Objective C, Python, HTML, SQL, Cydia Substrate, and Bash.

The major components and structure are as follows. NOTE: This project is in pre-alpha stages. Nowhere near fully complete.

- iOS Jailbreak Tweak: LifelineWidget. Compatible iOS 7-9. Enables user interaction with panic button with a swipe to the right on the lock screen.
- Python: Twilio SMS API running from a Raspberry Pi 3 under FreeBSD 12
- HTML: Website which manages user account information for medical card feature of widget
- SQL: Database to store user's medical info for medical card feature of widget
- Cydia Substrate: iOS Widget uses substrate and the LockPages API to display the widget on the right of the lock screen.
- Bash: Cross-communication and aliases between various project components. Uses iplist by @NotAlexNoyle

NOTE: send_sms.py requires twilio account and library. More info here: https://www.twilio.com/docs/quickstart/python/sms#faq
NOTE: Not all components of the project are hosted on this repository due to licencing conflicts. Will be worked out eventually.
