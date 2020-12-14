# =================== #
# Deploying VMware VM #
# =================== #
# Connect to VMware vSphere vCenter
provider "vsphere" {
    user = var.vsphere-user
    password = var.vsphere-password
    vsphere_server = var.vsphere-vcenter
# self-signed cert
    allow_unverified_ssl = var.vsphere-unverified-ssl
}
# Define VMware vSphere
data "vsphere_datacenter" "dc" {
    name = var.vsphere-datacenter
}

# Folders aanmaken: (Geen permissie)
#https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/folder


# https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/folder
data "vsphere_folder" "folder" {
  path = var.vsphere-folder
}
data "vsphere_datastore" "datastore" {
    name = var.vm-datastore
    datacenter_id = data.vsphere_datacenter.dc.id
}
/*
data "vsphere_compute_cluster" "cluster" {
    name = var.vsphere-cluster
    datacenter_id = data.vsphere_datacenter.dc.id
}
*/
data "vsphere_resource_pool" "pool" {                             
    name          = var.vsphere-resource-pool
    datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
    name = var.vm-network
    datacenter_id = data.vsphere_datacenter.dc.id
}
/*
data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-16.04"
  datacenter_id = data.vsphere_datacenter.dc.id
}
*/

data "vsphere_virtual_machine" "template" {
name = "/${var.vsphere-folder}/${var.vm-template-name}"
datacenter_id = data.vsphere_datacenter.dc.id
}


# Create VMs
resource "vsphere_virtual_machine" "vm" {
count = var.vm-count
name = "${var.vm-name}-${count.index + 1}"
resource_pool_id = data.vsphere_resource_pool.pool.id
datastore_id = data.vsphere_datastore.datastore.id
num_cpus = var.vm-cpu
memory = var.vm-ram
guest_id = var.vm-guest-id
network_interface {
  network_id = data.vsphere_network.network.id
}
disk {
  label = "${var.vm-name}-${count.index + 1}-disk"
  size  = 55
}
clone {
  template_uuid = data.vsphere_virtual_machine.template.id
  customize {
    timeout = 0
    
    linux_options {
      host_name = "node-${count.index + 1}"
      domain = var.vm-domain
    }
    
    network_interface {}
  }
 }
}

#Virtual Machine Resource
/*
resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 1024
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }
}
*/

