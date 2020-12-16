#---------------------------
# VMware VMs configuration #
#---------------------------
#vm-count = "1"
vm-name-prefix = "DCcompany"
#vm-template-name = "CentOS7-Template"
vm-cpu = "1"
vm-ram = "2048"
#vm-guest-id = "centos7_64Guest"
iso-path = "ISO/en_windows_server_2019_x64_dvd_199664ce.iso"
#-------------------------------
# VMware vSphere configuration #
#-------------------------------
# VMware vCenter IP/FQDN
vsphere-vcenter = "172.16.60.118"
# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@groep13.local"
# VMware vSphere password used to deploy the infrastructure
vsphere-password = "Groep13=domain"
# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"
# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "Datacenter"
# vshere folder locatie datastore is een gegeven variable
#vsphere-folder = "PXL-IT/vm/Project/Project 4" # https://paulgrevink.wordpress.com/2019/01/26/about-vcenter-server-folders-and-how-to-copy-them/
# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "Clustergrp13"
# vSphere resource name where the infrastructure will be deployed
#vsphere-resource-pool = "Project 4 compute1"
# vSphere Datastore used to deploy VMs 
vm-datastore = "Freenas Datastore 2"
vm-datastore1 = "Freenas Datastore 1 (1)"
# vSphere Network used to deploy VMs 
vm-network = "VM Network"
# Linux virtual machine domain name
####vm-domain = "kopicloud.local"
# ID-Guest
vm-guest-id = "windows9Server64Guest"