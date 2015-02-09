
Background
==========
* pentabot

a stylish xmpp-based bot serving pentamedia with your data and pentamedia data for you.

First of all, it shall be able to receive news for our monthly pentaradio show (supposed format: "!add <url> <your text> <#yourtag>").

Later features commands like "!latest #[radio|cast|music]" could serve you with the latest links available.

Comments (for registered users) could be added as well.

Also stats could be offered: "!stats $showname"

But first of all: News adding. Because via pentasubmitter, it's a pain in the arse.
Hopefully this will be done by the end of the weekend.

The bot will be (hopefully) available soon, just make friends with pentabot@hq.c3d2.de

For comments (either mail or xmpp): koeart <at - remove this> zwoelfelf <dot - this too> net.

Dependencies
============
* python-jabberbot (requires python-xmpp)
* python-feedparser
* python-pywapi

install PentaBot on FreeBSD inside Jail
=======================================
* pkg install net-im/py-jabberbot
* pkg install textproc/py-feedparser
* pkg install devel/git
* pkg install devel/py-pip
* pip install requests

FreeBSD Jail RCTL example
=========================
cat /etc/rctl.conf 

### pentabot // ###
jail:pentabot:pseudoterminals:log=3
jail:pentabot:pseudoterminals:deny=5
jail:pentabot:pcpu:deny=15/jail
jail:pentabot:nthr:log=100
jail:pentabot:nthr:deny=124
jail:pentabot:memoryuse:log=1887436800 
jail:pentabot:memoryuse:sigkill=2044723200
jail:pentabot:memoryuse:deny=2147483648  
jail:pentabot:vmemoryuse:log=9663676416
jail:pentabot:vmemoryuse:sigkill=10485760000
jail:pentabot:vmemoryuse:deny=10737418240
jail:pentabot:swapuse:log=1887436800
jail:pentabot:swapuse:sigkill=2044723200
jail:pentabot:swapuse:deny=2147483648
jail:pentabot:maxproc:log=1000
jail:pentabot:maxproc:deny=1024
jail:pentabot:openfiles:log=25000
jail:pentabot:openfiles:deny=30000
### // pentabot ###

