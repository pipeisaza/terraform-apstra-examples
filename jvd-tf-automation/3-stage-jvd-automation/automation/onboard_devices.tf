# define mgmt addresses for each device to be onboarded

locals {
    devices = {
        leaf1 = {
            label = "dc1_single_001_leaf1", 
            mgmt_ip = "10.31.100.93"
        },
        leaf2 = {
            label = "dc1_esi_esxi_001_leaf1", 
            mgmt_ip = "10.31.100.94"
        },
        leaf3 = {
            label = "dc1_esi_esxi_001_leaf2", 
            mgmt_ip = "10.31.100.95"
        },   
        leaf4 = {
            label = "dc1_border_001_leaf1", 
            mgmt_ip = "10.31.100.96"
        },  
        leaf5 = {
            label = "dc1_border_001_leaf2", 
            mgmt_ip = "10.31.100.97"
        },
        spine1 = {
            label = "spine1", 
            mgmt_ip = "10.31.100.91"
        },
        spine2 = {
            label = "spine2", 
            mgmt_ip = "10.31.100.92"
        } 
    }
}

# retrieve agent profile ID for Junos devices 

data "apstra_agent_profile" "junos-profile" {
  name = "junos-agent-profile"
}

# create off-box agents for all Junos devices without ack'ing them 

resource "apstra_managed_device" "device" {
    for_each = local.devices
    agent_profile_id = data.apstra_agent_profile.junos-profile.id
    management_ip = each.value.mgmt_ip
    off_box = true
}