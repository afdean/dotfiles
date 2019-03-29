# Dotfiles

## About

Settings for firefox, including "About Config". This cannot be automated, and
should be synced, so a backup is maintained here. For every setting, create a
new boolean titled "services.sync.prefs.sync.SETTING", and set to "True".

Check preferences on a clean install, as some things cannot synced there.

Check privacytools.io for updated settings.

## Settings (About Config)

Disable WebRTC

- media.peerconnection.enabled = False
- media.peerconnection.turn.disable = true
- media.peerconnection.use_document_iceservers = false
- media.peerconnection.video.enabled = false
- media.peerconnection.identity.timeout = 1

Privacy Settings (PrivacyTools)

- privacy.firstparty.isolate = true
- privacy.resistFingerprinting = true
- privacy.trackingprotection.enabled = true
- browser.cache.offline.enable = false
- browser.safebrowsing.malware.enabled = false
- browser.safebrowsing.phishing.enabled = false
- browser.send_pings = false
- browser.sessionstore.max_tabs_undo = 0
- browser.urlbar.speculativeConnect.enabled = false
- dom.battery.enabled = false
- dom.event.clipboardevents.enabled = false
- geo.enabled = false
- media.navigator.enabled = false
- network.cookie.cookieBehavior = 1
- network.cookie.lifetimePolicy = 2
- webgl.disabled = true
- browser.sessionstore.privacy_level = 2
- network.IDN_show_punycode = true
- extensions.blocklist.url = https://blocklists.settings.services.mozilla.com/v1/blocklist/3/%20/%20/

Privacy Settings (Personal)

- browser.newtabpage.activity-stream.enable = false
- browser.sessionstore.max_windows_undo = 0
- browser.urlbar.maxRichResults = -1
- browser.urlbar.maxCharsForSearchSuggestions = -1

## Add-ons

- Privacy Badger
- uBlock Origin
- Cookie AutoDelete
- HTTPS Everywhere
- Decentraleyes
- Joplin Web Clipper
- Startpage.com
- NoScript
- uMatrix
