




## Demo

IP address 			hostname 		postgres Version 	Role
*************		**********		**********			**********
192.168.1.71		linux2			12					Server 
192.168.1.61		linux1			12					Client




## ssh to the postgresql server host ( 192.168.1.71)
			#sudo su -postgres
			psql
			
			postgres# create role user2_remote with login password '123';
			
## How to View the role

			postgres# \l
			postgres# select rolname from pg_roles;
			

## How to login

psql -U user2_remote -W postgres -h 192.168.1.71
```
Password for user testuser1_remote:
psql: Could not connect to server: Connection refused 
			Is the server running on host "192.168.1.61" and accepting
			TCP/IP connections on port 5432?
			
```


sudo systemctl status postgresql-14



## How to find the location of pg_hba.conf file
***********************************************

			postgres# show hba_file;
			
