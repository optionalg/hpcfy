node default { 
	#include cluster
	#include filestest
	#include ntp
	
	include nfsclient
	include virtual_groups
	include virtual_users
	#User["hpcuser"]{groups=> ["hpcuser","hadoop"]}
	realize( Group["hpcuser"],Group["hadoop"],User["hpcuser"])
	include hpcsoft
	include hadoop
	include ganglia-client
	
	#include nasbenchsoft
	#include user::virtual
	#include user::sysadmins
	#include user::developers
}
 
 
node "clusternode0" inherits default{
	nfsserver::share { "data":
	path => "/data",
	allowed => "10.80.160.0/24",
	options => "rw,sync,no_root_squash",
	} 
	include hadoop
	include ganglia-client
	include ganglia-server	
	
}
