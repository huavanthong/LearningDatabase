# Introduction
This tutorial will help summary 
# Table of Contents
* [PostgreSQL utitilies](#usage-of-psql) 
* [Monitor usage](#top-command)
* 
# Questions
### About top command
* [How to use top command](#top-command)
* [How to convert top command output to a file](#convert-top-command-to-file)
### About ps command
* [How to use ps command correctly?](#
------------------------------------------------------------------------------------------------
## Usage of psql

### Utilities on PostgreSQL
#### Windows

#### Linux
to start Postgresql service
```
sudo service postgresql start
```
to stop Postgresql service
```
sudo service postgresql stop
```
to restart Postgresql service
```
sudo service postgresql restart
```
More details: [here](https://tableplus.com/blog/2018/10/how-to-start-stop-restart-postgresql-server.html)
## Monitor usage
### Top command
to view a list of currently running processing.
```
$ top
```
Output
```
top - 10:58:21 up 20:26,  1 user,  load average: 0,52, 0,49, 0,77
Tasks: 274 total,   1 running, 273 sleeping,   0 stopped,   0 zombie
%Cpu(s): 12,3 us,  7,4 sy,  0,0 ni, 80,2 id,  0,0 wa,  0,0 hi,  0,0 si,  0,0 st
MiB Mem :  15896,2 total,   7897,6 free,   3129,3 used,   4869,4 buff/cache
MiB Swap:   2048,0 total,   2048,0 free,      0,0 used.  11865,5 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
   9866 hvthong   20   0 1605536  95500  48504 S  16,7   0,6   0:27.87 nautilus
 116181 hvthong   20   0   12016   3944   3224 R  16,7   0,0   0:00.06 top
   1559 hvthong   20   0  569172 104200  54764 S   5,6   0,6   9:36.03 Xorg
   1697 hvthong   20   0 4460724 293952 106992 S   5,6   1,8  11:06.87 gnome-shell
      1 root      20   0  167584  11316   8108 S   0,0   0,1   0:06.05 systemd
   .........
```

#### Convert top command to file
to save top command output to file
```
top -b -n 1 > top.txt
```
### ps command
to display a list of all processes.  
* -a: View processes of all users rather than just the current user.
* -u: Provide detailed information about each of the processes
* -x: Include processes that are controlled not by users by daemons.
```
ps -aux
```
Output
```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0 167584 11356 ?        Ss   Apr06   0:06 /sbin/init sp
root           2  0.0  0.0      0     0 ?        S    Apr06   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   Apr06   0:00 [rcu_gp]
```

### Manual on Database
Create a new database
```
CREATE DATABASE guru99;
```

To get a list of all databases
```
\l 
```

To connect to a new database
```
\c guru99
```
More details: [here](https://www.meisternote.com/app/note/mR_lrQdo1Ht0/usage-database)
