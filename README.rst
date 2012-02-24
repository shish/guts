::
                      ________        __   _________
                     /  _____/ __ ___/  |_/   _____/
                    /   \  ___|  |  \   __\_____  \ 
                    \    \_\  \  |  /|  | /        \
                     \______  /____/ |__|/_______  /
                            \/                   \/ 


GutS: Shish's SparkleShare back-end, a proof of concept implementation
of the Gut protocol.

You'd have to have a lot of guts to use it on important data.

For details of the protocol, see gut.rst

Getting Started
~~~~~~~~~~~~~~~

1) Create the repository::

    you@server:~/ $ guts init /home/you/your-repo.gut

2a) Connect with SparkleShare

	you@client:~/ $ sudo ln -s /home/you/src/guts/guts /usr/bin/gut

    Right click icon -> Add Hosted Project
	Address: you@server
	Remote Path: /home/you/your-repo.gut

2b) Use the command line client on its own::

    you@client:~/ $ guts configure local-folder --user="Your Name <you@example.com>" --url=ssh://you@server/home/you/your-repo.gut
	you@client:~/ $ cd local-folder
	you@client:~/local-folder/ $ guts fetch
	[... the server is contacted, files are downloaded, things are set up ...]
	[... wait for someone to add a new file ...]
	you@client:~/local-folder/ $ guts sync-down
	[... files download ...]
	[... edit some files ...]
	you@client:~/local-folder/ $ guts sync-up
	[... your changes are uploaded ...]
