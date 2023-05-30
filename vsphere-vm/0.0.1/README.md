
# Module `vsphere-vm`

Provider Requirements:
* **vsphere:** (any version)

## Input Variables
* `vm_cpus` (required)
* `vm_datastore` (required)
* `vm_disk_size` (required)
* `vm_guest_id` (required)
* `vm_memory` (required)
* `vm_name` (required)
* `vm_network` (required)
* `vm_template` (required)

## Managed Resources
* `vsphere_virtual_machine.vm` from `vsphere`

## Data Resources
* `data.vsphere_datacenter.dc` from `vsphere`
* `data.vsphere_datastore.datastore` from `vsphere`
* `data.vsphere_network.network` from `vsphere`

