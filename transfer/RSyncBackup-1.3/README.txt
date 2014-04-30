RSyncBackup version 1.3
-----------------------
RSyncBackup is the Python utility that I wrote to perform automatic backups
using the rsync command.  Rsync has many different uses but is particularly
suitable for performing backups from one form of online storage to another,
either over a network or on a local machine with multiple drives.

RSyncBackup consists of two parts:
  - RSyncBackup.py is the module which contains all of the logic of how to
    use rsync to perform backups.

  - examples/backup.py is an example script showing some of the ways in which 
    RsyncBackup can be used.

By using RSyncBackup you get the following features (all of which are
optional):

 - Incremental archives containing the old versions of files.  For example
   when /backup/current/fileOne.txt has changed the old version can 
   be found in /backup/archives/2003/05/26/fileOne.txt.

 - Removal of old archives to free up space.

 - Logging results of backup to a file.

 - Send email if an error occurs.

 - Test Run mode to see what your script will try to do.

 - Can be run frequently, but only backup after a specified time has 
   elapsed since the last backup.  This is useful on machines that
   are not switched on all the time and not running Anacron.

Note on logging:
---------------
Logging is performed using the Python logging library.  This comes as
standard with Python 2.3, and is available for earlier versions from
http://www.red-dove.com/python_logging.html

See the example backup.py for an example of how to configure the logging.

API documentation can be found in documentation/html/api.html.
