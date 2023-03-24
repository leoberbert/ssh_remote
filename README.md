# ssh_remote
Script for executing remote commands between linux servers using ssh.

Prerequisites:

There must be a trust relationship between the source server where the script will be executed and the destination servers.

**Execution mode:**

```
ssh_remote.pl

        Use ssh_remote.pl -u USER -c COMMAND -m HOST

        Options are:

        -u USER. (Mandatory)
        -m MACHINE. For more than one argument use comma. Ex: -m myhost1,myhost2. (Mandatory)
        -c COMMAND. Command to be executed.
        -h This help

        Example: ssh_remote.pl -u tcserver -c uptime -m myhost1,myhost2
```

**Example:**

```
ssh_remote.pl -u tcserver -c "nproc" -m myhost1,myhost2

SERVER: myhost1
6
SERVER: myhost2
6
```
