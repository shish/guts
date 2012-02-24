Philosophy
==========
The Gut protocol is basically just the internal API of sparkleshare, exposed
as a command line instead of .NET function calls. This means that it's really
easy to write a sync tool in any language and have sparkleshare use it as a
back-end.

Shish's reference implementation is called guts; if you want to use that one,
create a symbolic link from guts to /usr/bin/gut. If you want to create your
own back-end and your name is ted, maybe call it GutTed and link that to
/usr/bin/gut instead.

My hope is that there won't be competition for the gut name as it'll only be
used by developers locally, and any clients which are good enough for public
release can be given their own entry in sparkleshare's plugin table. Another
possibility would be to extend sparkleshare to automatically use /usr/bin/XY
with the gut protocol for a repository called /home/foo/myrepo.XY; or maybe
/usr/lib/sparkleshare/backends/XY?

For the original .NET based API, see -->
https://github.com/hbons/SparkleShare/wiki/Implementing-a-backend
<-- the gut protocol should always be a command line version of this, so look
there for updates.

Anyway, on to the protocol.


The Protocol
------------
The use is standard "<binary name> <command> [parameters]". Binary name is
whatever you want to develop with, symlinked to "gut" so sparkleshare can
find it.

Return values are strings printed to stdout. Boolean values are "true" and
"false".

Other than "fetch", all commands are assumed to be run with the root of the
working tree as the current directory.

Commands are:


fetch <repository URL> <target directory>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Downloads a previously-unknown repository, "clone" in git terms

identifier
~~~~~~~~~~
Return a unique ID for the repository

Git and Gut both use a 40-byte hex string

size
~~~~
Return the size of the working tree in bytes (history subfolder included?)

history-size
~~~~~~~~~~~~
Return the size of the metadata subfolder (.git in git terms)

current-revision
~~~~~~~~~~~~~~~~
Return the current revision ID of the local repository

git and gut both use a 40-byte hex string

has-remote-changes
~~~~~~~~~~~~~~~~~~
Return a boolean for whether the remote repository has updates that we haven't
dealt with locally yet

has-local-changes
~~~~~~~~~~~~~~~~~
Return a boolean for whether there are local files that we haven't pushed to
the remote repository yet

sync-up
~~~~~~~
Push local changes to the remote repository. Percentages printed to stderr
will be interpreted as progress reports to be shown in the GUI.

Return a boolean for success.

sync-down
~~~~~~~~~
Pull remote changes to the local working tree. Print progress as above.

Return a boolean for success.

get-change-sets <n>
~~~~~~~~~~~~~~~~~~~
Return some recent repository change sets

Format to be finalised. Currently it uses the "git --raw --date=iso" format,
but a more tool-agnostic format might be devised.

init <directory>
~~~~~~~~~~~~~~~~
Not part of the protocol per se, but it makes sense to have an init command
to create a blank repository for sparkleshare to be pointed to ("init" in
git terms)

unsynced-file-paths
~~~~~~~~~~~~~~~~~~~
The SS Git back-end has this function, but it's not in the back-end
documentation and it seems unused...
