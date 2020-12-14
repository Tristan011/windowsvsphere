# VMware VMs configuration #
/*vm-count = "2"
vm-name = "kopik8snode"
vm-template-name = "CentOS7-Template"
vm-cpu = "2"
vm-ram = "4096"
vm-guest-id = "centos7_64Guest"
*/
# VMware vSphere configuration #
# VMware vCenter IP/FQDN
vsphere-vcenter = "vcsa-pxl-it.pxl.local"
# VMware vSphere username used to deploy the infrastructure
vsphere-user = "project4"
# VMware vSphere password used to deploy the infrastructure
vsphere-password = "Twotheacs2"
# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"
# vSphere datacenter name where the infrastructure will be deployed 
vsphere-datacenter = "PXL-IT"
# vshere folder locatie datastore is een gegeven variable
vsphere-folder = "PXL-IT/vm/Project/Project 4" # https://paulgrevink.wordpress.com/2019/01/26/about-vcenter-server-folders-and-how-to-copy-them/
# vSphere cluster name where the infrastructure will be deployed
####vsphere-cluster = "Project/Project 4"
# vSphere resource name where the infrastructure will be deployed
vsphere-resource-pool = "Project 4 compute1"
# vSphere Datastore used to deploy VMs 
vm-datastore = "project4"
# vSphere Network used to deploy VMs 
vm-network = "Local Network 4-1"
# Linux virtual machine domain name
####vm-domain = "kopicloud.local"
# ID-Guest
vm-guest-id = "otherLinux64Guest"