```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "loadBalancers_LB_name": {
            "defaultValue": "LB",
            "type": "String"
        },
        "availabilitySets_AV_name": {
            "defaultValue": "AV",
            "type": "String"
        },
        "virtualMachines_VM1_name": {
            "defaultValue": "VM1",
            "type": "String"
        },
        "virtualMachines_VM2_name": {
            "defaultValue": "VM2",
            "type": "String"
        },
        "sshPublicKeys_VM1_key_name": {
            "defaultValue": "VM1_key",
            "type": "String"
        },
        "sshPublicKeys_VM2_key_name": {
            "defaultValue": "VM2_key",
            "type": "String"
        },
        "publicIPAddresses_LPipp_name": {
            "defaultValue": "LPipp",
            "type": "String"
        },
        "networkInterfaces_vm1504_name": {
            "defaultValue": "vm1504",
            "type": "String"
        },
        "networkInterfaces_vm2797_name": {
            "defaultValue": "vm2797",
            "type": "String"
        },
        "publicIPAddresses_VM1_ip_name": {
            "defaultValue": "VM1-ip",
            "type": "String"
        },
        "publicIPAddresses_VM2_ip_name": {
            "defaultValue": "VM2-ip",
            "type": "String"
        },
        "virtualNetworks_DEV_vnet_name": {
            "defaultValue": "DEV-vnet",
            "type": "String"
        },
        "networkSecurityGroups_VM1_nsg_name": {
            "defaultValue": "VM1-nsg",
            "type": "String"
        },
        "networkSecurityGroups_VM2_nsg_name": {
            "defaultValue": "VM2-nsg",
            "type": "String"
        }
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Compute/sshPublicKeys",
            "apiVersion": "2022-08-01",
            "name": "[parameters('sshPublicKeys_VM1_key_name')]",
            "location": "francecentral",
            "properties": {
                "publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHt+j12YAoTv1igFnSdGLbtxYEuPSRaO8soSNKePI+7nFoMu769zi62YPR5zQ6Z20dZD9PKEiwfeKXlLckr9/vdTSxvetcmWNk+geuHsZSaaqwtZ3lLkQ/6fsD584/yOAfQrFd7T7uiigcxumeBq1nB0ovPAFtF3ifiQb7rbmVKrtZhUeVjEghzbVBsjOKuCqqhjbIPxq8dPO6ATWXZ6NbQ1e5Dkubi+c3fAgpWyXobNmrparw6G/ulxaOPj8gPLQnKLBe1tICNZSnygLaoeaLrGLAkm/pemBMMge4+89D8NmY5PLJzrrv5zgnphDsYwokI/X9lSNGMBbrtDDZKeneI9AfNifXo/ENSBxVKFS/NVx4K/KvbzeMxkI5bmuKEzkWHdXnUzVtdJaBnssPCcHxT/3ECpBeehEN7dniy33fnoinWGP4LTqFgL5p8tPwBcdSV56C9L6prwHodny3d/cnIsFfxo1PTLk7Gme5xZdfruG4nhuAuB9tyUitHW/DcqE= generated-by-azure"
            }
        },
        {
            "type": "Microsoft.Compute/sshPublicKeys",
            "apiVersion": "2022-08-01",
            "name": "[parameters('sshPublicKeys_VM2_key_name')]",
            "location": "francecentral",
            "properties": {
                "publicKey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCimZjGKG46cYc9E6tG0WGQVze+7pHaiSIKtIYHXCHpY513XkCWv1Tx3XkaixdNvrD38B5Zv1JnVv52i/zJhmWU0sn4my6nmJ1z/T95ugRW4TejRYhhiGimVgHcVn0OAxhJaa4WN+15Ys2R9wvPoPxG17nytYWgNLr2wWNejeTkLVcIs+mTe4FSq4JA2Mablm618OCA8oLF60GqRLsXRqy8FHL33+uBYLozklI1OgIQ7SDn8z8uOsUeJh1+lXBlpQpRFB7AMXFgjKXOdeU6KLrdLF3IXeg/c37bNN1zGXHrICieWEI2NfBZrJA9kCx71yI5jPCKko8FCAY+8WBnQpsCfbhmGtYRdbuhxhBsl1eWImPSA4HUS9RTxQBJpQTWwNo6+wcflv6BoiQ9zz1SdVGAQBz34u7d0abMnhZIwM1sVxdaJNQxo13GiTXlEs6xV1hHuytfwHp30qERlVouUgGSvAKYr+PXT11BG9d9xcaIoGcKG3/rGtqv/2n0bSnLWFU= generated-by-azure"
            }
        },
        {
            "type": "Microsoft.Network/publicIPAddresses",
            "apiVersion": "2022-05-01",
            "name": "[parameters('publicIPAddresses_LPipp_name')]",
            "location": "francecentral",
            "sku": {
                "name": "Standard",
                "tier": "Regional"
            },
            "zones": [
                "3",
                "1",
                "2"
            ],
            "properties": {
                "ipAddress": "20.74.112.227",
                "publicIPAddressVersion": "IPv4",
                "publicIPAllocationMethod": "Static",
                "idleTimeoutInMinutes": 4,
                "ipTags": []
            }
        },
        {
            "type": "Microsoft.Network/publicIPAddresses",
            "apiVersion": "2022-05-01",
            "name": "[parameters('publicIPAddresses_VM1_ip_name')]",
            "location": "francecentral",
            "sku": {
                "name": "Standard",
                "tier": "Regional"
            },
            "properties": {
                "ipAddress": "20.199.97.53",
                "publicIPAddressVersion": "IPv4",
                "publicIPAllocationMethod": "Static",
                "idleTimeoutInMinutes": 4,
                "ipTags": []
            }
        },
        {
            "type": "Microsoft.Network/publicIPAddresses",
            "apiVersion": "2022-05-01",
            "name": "[parameters('publicIPAddresses_VM2_ip_name')]",
            "location": "francecentral",
            "sku": {
                "name": "Standard",
                "tier": "Regional"
            },
            "properties": {
                "ipAddress": "20.199.103.78",
                "publicIPAddressVersion": "IPv4",
                "publicIPAllocationMethod": "Static",
                "idleTimeoutInMinutes": 4,
                "ipTags": []
            }
        },
        {
            "type": "Microsoft.Network/loadBalancers/backendAddressPools",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('loadBalancers_LB_name'), '/', parameters('loadBalancers_LB_name'), 'VM')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name'))]"
            ],
            "properties": {
                "loadBalancerBackendAddresses": [
                    {
                        "name": "DEV_vm1504ipconfig1",
                        "properties": {}
                    },
                    {
                        "name": "DEV_vm2797ipconfig1",
                        "properties": {}
                    }
                ]
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM1_nsg_name'), '/HTTP')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM1_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "80",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 320,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM2_nsg_name'), '/HTTP')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM2_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "80",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 340,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM1_nsg_name'), '/HTTPS')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM1_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "443",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 340,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM2_nsg_name'), '/HTTPS')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM2_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "443",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 320,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM1_nsg_name'), '/SSH')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM1_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "22",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 300,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups/securityRules",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('networkSecurityGroups_VM2_nsg_name'), '/SSH')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM2_nsg_name'))]"
            ],
            "properties": {
                "protocol": "TCP",
                "sourcePortRange": "*",
                "destinationPortRange": "22",
                "sourceAddressPrefix": "*",
                "destinationAddressPrefix": "*",
                "access": "Allow",
                "priority": 300,
                "direction": "Inbound",
                "sourcePortRanges": [],
                "destinationPortRanges": [],
                "sourceAddressPrefixes": [],
                "destinationAddressPrefixes": []
            }
        },
        {
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2022-05-01",
            "name": "[parameters('virtualNetworks_DEV_vnet_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]"
            ],
            "properties": {
                "addressSpace": {
                    "addressPrefixes": [
                        "10.0.0.0/16"
                    ]
                },
                "subnets": [
                    {
                        "name": "default",
                        "id": "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]",
                        "properties": {
                            "addressPrefix": "10.0.0.0/24",
                            "delegations": [],
                            "privateEndpointNetworkPolicies": "Disabled",
                            "privateLinkServiceNetworkPolicies": "Enabled"
                        },
                        "type": "Microsoft.Network/virtualNetworks/subnets"
                    }
                ],
                "virtualNetworkPeerings": [],
                "enableDdosProtection": false
            }
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "apiVersion": "2022-05-01",
            "name": "[concat(parameters('virtualNetworks_DEV_vnet_name'), '/default')]",
            "dependsOn": [
                "[resourceId('Microsoft.Network/virtualNetworks', parameters('virtualNetworks_DEV_vnet_name'))]"
            ],
            "properties": {
                "addressPrefix": "10.0.0.0/24",
                "delegations": [],
                "privateEndpointNetworkPolicies": "Disabled",
                "privateLinkServiceNetworkPolicies": "Enabled"
            }
        },
        {
            "type": "Microsoft.Compute/availabilitySets",
            "apiVersion": "2022-08-01",
            "name": "[parameters('availabilitySets_AV_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachines_VM1_name'))]",
                "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachines_VM2_name'))]"
            ],
            "sku": {
                "name": "Aligned"
            },
            "properties": {
                "platformUpdateDomainCount": 5,
                "platformFaultDomainCount": 2,
                "virtualMachines": [
                    {
                        "id": "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachines_VM1_name'))]"
                    },
                    {
                        "id": "[resourceId('Microsoft.Compute/virtualMachines', parameters('virtualMachines_VM2_name'))]"
                    }
                ]
            }
        },
        {
            "type": "Microsoft.Compute/virtualMachines",
            "apiVersion": "2022-08-01",
            "name": "[parameters('virtualMachines_VM1_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Compute/availabilitySets', parameters('availabilitySets_AV_name'))]",
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm1504_name'))]"
            ],
            "properties": {
                "availabilitySet": {
                    "id": "[resourceId('Microsoft.Compute/availabilitySets', parameters('availabilitySets_AV_name'))]"
                },
                "hardwareProfile": {
                    "vmSize": "Standard_B1s"
                },
                "storageProfile": {
                    "imageReference": {
                        "publisher": "canonical",
                        "offer": "0001-com-ubuntu-server-focal",
                        "sku": "20_04-lts-gen2",
                        "version": "latest"
                    },
                    "osDisk": {
                        "osType": "Linux",
                        "name": "[concat(parameters('virtualMachines_VM1_name'), '_OsDisk_1_2260f82834bf4eab894ce21e4f3b442f')]",
                        "createOption": "FromImage",
                        "caching": "ReadWrite",
                        "managedDisk": {
                            "storageAccountType": "Premium_LRS",
                            "id": "[resourceId('Microsoft.Compute/disks', concat(parameters('virtualMachines_VM1_name'), '_OsDisk_1_2260f82834bf4eab894ce21e4f3b442f'))]"
                        },
                        "deleteOption": "Delete",
                        "diskSizeGB": 30
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('virtualMachines_VM1_name')]",
                    "adminUsername": "azureuser",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": true,
                        "ssh": {
                            "publicKeys": [
                                {
                                    "path": "/home/azureuser/.ssh/authorized_keys",
                                    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHt+j12YAoTv1igFnSdGLbtxYEuPSRaO8soSNKePI+7nFoMu769zi62YPR5zQ6Z20dZD9PKEiwfeKXlLckr9/vdTSxvetcmWNk+geuHsZSaaqwtZ3lLkQ/6fsD584/yOAfQrFd7T7uiigcxumeBq1nB0ovPAFtF3ifiQb7rbmVKrtZhUeVjEghzbVBsjOKuCqqhjbIPxq8dPO6ATWXZ6NbQ1e5Dkubi+c3fAgpWyXobNmrparw6G/ulxaOPj8gPLQnKLBe1tICNZSnygLaoeaLrGLAkm/pemBMMge4+89D8NmY5PLJzrrv5zgnphDsYwokI/X9lSNGMBbrtDDZKeneI9AfNifXo/ENSBxVKFS/NVx4K/KvbzeMxkI5bmuKEzkWHdXnUzVtdJaBnssPCcHxT/3ECpBeehEN7dniy33fnoinWGP4LTqFgL5p8tPwBcdSV56C9L6prwHodny3d/cnIsFfxo1PTLk7Gme5xZdfruG4nhuAuB9tyUitHW/DcqE= generated-by-azure"
                                }
                            ]
                        },
                        "provisionVMAgent": true,
                        "patchSettings": {
                            "patchMode": "ImageDefault",
                            "assessmentMode": "ImageDefault"
                        },
                        "enableVMAgentPlatformUpdates": false
                    },
                    "secrets": [],
                    "allowExtensionOperations": true,
                    "requireGuestProvisionSignal": true
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm1504_name'))]",
                            "properties": {
                                "deleteOption": "Detach"
                            }
                        }
                    ]
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true
                    }
                }
            }
        },
        {
            "type": "Microsoft.Compute/virtualMachines",
            "apiVersion": "2022-08-01",
            "name": "[parameters('virtualMachines_VM2_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Compute/availabilitySets', parameters('availabilitySets_AV_name'))]",
                "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm2797_name'))]"
            ],
            "properties": {
                "availabilitySet": {
                    "id": "[resourceId('Microsoft.Compute/availabilitySets', parameters('availabilitySets_AV_name'))]"
                },
                "hardwareProfile": {
                    "vmSize": "Standard_B1s"
                },
                "storageProfile": {
                    "imageReference": {
                        "publisher": "canonical",
                        "offer": "0001-com-ubuntu-server-focal",
                        "sku": "20_04-lts-gen2",
                        "version": "latest"
                    },
                    "osDisk": {
                        "osType": "Linux",
                        "name": "[concat(parameters('virtualMachines_VM2_name'), '_OsDisk_1_934208ee6ffc401fb7a837e6e450e0d4')]",
                        "createOption": "FromImage",
                        "caching": "ReadWrite",
                        "managedDisk": {
                            "storageAccountType": "Premium_LRS",
                            "id": "[resourceId('Microsoft.Compute/disks', concat(parameters('virtualMachines_VM2_name'), '_OsDisk_1_934208ee6ffc401fb7a837e6e450e0d4'))]"
                        },
                        "deleteOption": "Delete",
                        "diskSizeGB": 30
                    },
                    "dataDisks": []
                },
                "osProfile": {
                    "computerName": "[parameters('virtualMachines_VM2_name')]",
                    "adminUsername": "azureuser",
                    "linuxConfiguration": {
                        "disablePasswordAuthentication": true,
                        "ssh": {
                            "publicKeys": [
                                {
                                    "path": "/home/azureuser/.ssh/authorized_keys",
                                    "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCimZjGKG46cYc9E6tG0WGQVze+7pHaiSIKtIYHXCHpY513XkCWv1Tx3XkaixdNvrD38B5Zv1JnVv52i/zJhmWU0sn4my6nmJ1z/T95ugRW4TejRYhhiGimVgHcVn0OAxhJaa4WN+15Ys2R9wvPoPxG17nytYWgNLr2wWNejeTkLVcIs+mTe4FSq4JA2Mablm618OCA8oLF60GqRLsXRqy8FHL33+uBYLozklI1OgIQ7SDn8z8uOsUeJh1+lXBlpQpRFB7AMXFgjKXOdeU6KLrdLF3IXeg/c37bNN1zGXHrICieWEI2NfBZrJA9kCx71yI5jPCKko8FCAY+8WBnQpsCfbhmGtYRdbuhxhBsl1eWImPSA4HUS9RTxQBJpQTWwNo6+wcflv6BoiQ9zz1SdVGAQBz34u7d0abMnhZIwM1sVxdaJNQxo13GiTXlEs6xV1hHuytfwHp30qERlVouUgGSvAKYr+PXT11BG9d9xcaIoGcKG3/rGtqv/2n0bSnLWFU= generated-by-azure"
                                }
                            ]
                        },
                        "provisionVMAgent": true,
                        "patchSettings": {
                            "patchMode": "ImageDefault",
                            "assessmentMode": "ImageDefault"
                        },
                        "enableVMAgentPlatformUpdates": false
                    },
                    "secrets": [],
                    "allowExtensionOperations": true,
                    "requireGuestProvisionSignal": true
                },
                "networkProfile": {
                    "networkInterfaces": [
                        {
                            "id": "[resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm2797_name'))]",
                            "properties": {
                                "deleteOption": "Detach"
                            }
                        }
                    ]
                },
                "diagnosticsProfile": {
                    "bootDiagnostics": {
                        "enabled": true
                    }
                }
            }
        },
        {
            "type": "Microsoft.Network/loadBalancers",
            "apiVersion": "2022-05-01",
            "name": "[parameters('loadBalancers_LB_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_LPipp_name'))]",
                "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]"
            ],
            "sku": {
                "name": "Standard",
                "tier": "Regional"
            },
            "properties": {
                "frontendIPConfigurations": [
                    {
                        "name": "LPipp",
                        "id": "[concat(resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name')), '/frontendIPConfigurations/LPipp')]",
                        "properties": {
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIPAddress": {
                                "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_LPipp_name'))]"
                            }
                        }
                    }
                ],
                "backendAddressPools": [
                    {
                        "name": "[concat(parameters('loadBalancers_LB_name'), 'VM')]",
                        "id": "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]",
                        "properties": {
                            "loadBalancerBackendAddresses": [
                                {
                                    "name": "DEV_vm1504ipconfig1",
                                    "properties": {}
                                },
                                {
                                    "name": "DEV_vm2797ipconfig1",
                                    "properties": {}
                                }
                            ]
                        }
                    }
                ],
                "loadBalancingRules": [
                    {
                        "name": "[concat(parameters('loadBalancers_LB_name'), 'rule')]",
                        "id": "[concat(resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name')), concat('/loadBalancingRules/', parameters('loadBalancers_LB_name'), 'rule'))]",
                        "properties": {
                            "frontendIPConfiguration": {
                                "id": "[concat(resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name')), '/frontendIPConfigurations/LPipp')]"
                            },
                            "frontendPort": 80,
                            "backendPort": 80,
                            "enableFloatingIP": false,
                            "idleTimeoutInMinutes": 4,
                            "protocol": "Tcp",
                            "enableTcpReset": false,
                            "loadDistribution": "Default",
                            "disableOutboundSnat": true,
                            "backendAddressPool": {
                                "id": "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]"
                            },
                            "backendAddressPools": [
                                {
                                    "id": "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]"
                                }
                            ],
                            "probe": {
                                "id": "[concat(resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name')), concat('/probes/', parameters('loadBalancers_LB_name'), 'prob'))]"
                            }
                        }
                    }
                ],
                "probes": [
                    {
                        "name": "[concat(parameters('loadBalancers_LB_name'), 'prob')]",
                        "id": "[concat(resourceId('Microsoft.Network/loadBalancers', parameters('loadBalancers_LB_name')), concat('/probes/', parameters('loadBalancers_LB_name'), 'prob'))]",
                        "properties": {
                            "protocol": "Http",
                            "port": 80,
                            "requestPath": "/",
                            "intervalInSeconds": 5,
                            "numberOfProbes": 1,
                            "probeThreshold": 1
                        }
                    }
                ],
                "inboundNatRules": [],
                "outboundRules": [],
                "inboundNatPools": []
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups",
            "apiVersion": "2022-05-01",
            "name": "[parameters('networkSecurityGroups_VM1_nsg_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'SSH')]",
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'HTTP')]",
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'HTTPS')]"
            ],
            "properties": {
                "securityRules": [
                    {
                        "name": "SSH",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'SSH')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "22",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 300,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    },
                    {
                        "name": "HTTP",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'HTTP')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "80",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 320,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    },
                    {
                        "name": "HTTPS",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM1_nsg_name'), 'HTTPS')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "443",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 340,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    }
                ]
            }
        },
        {
            "type": "Microsoft.Network/networkSecurityGroups",
            "apiVersion": "2022-05-01",
            "name": "[parameters('networkSecurityGroups_VM2_nsg_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'SSH')]",
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'HTTPS')]",
                "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'HTTP')]"
            ],
            "properties": {
                "securityRules": [
                    {
                        "name": "SSH",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'SSH')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "22",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 300,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    },
                    {
                        "name": "HTTPS",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'HTTPS')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "443",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 320,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    },
                    {
                        "name": "HTTP",
                        "id": "[resourceId('Microsoft.Network/networkSecurityGroups/securityRules', parameters('networkSecurityGroups_VM2_nsg_name'), 'HTTP')]",
                        "type": "Microsoft.Network/networkSecurityGroups/securityRules",
                        "properties": {
                            "protocol": "TCP",
                            "sourcePortRange": "*",
                            "destinationPortRange": "80",
                            "sourceAddressPrefix": "*",
                            "destinationAddressPrefix": "*",
                            "access": "Allow",
                            "priority": 340,
                            "direction": "Inbound",
                            "sourcePortRanges": [],
                            "destinationPortRanges": [],
                            "sourceAddressPrefixes": [],
                            "destinationAddressPrefixes": []
                        }
                    }
                ]
            }
        },
        {
            "type": "Microsoft.Network/networkInterfaces",
            "apiVersion": "2022-05-01",
            "name": "[parameters('networkInterfaces_vm1504_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_VM1_ip_name'))]",
                "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]",
                "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]",
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM1_nsg_name'))]"
            ],
            "kind": "Regular",
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "id": "[concat(resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm1504_name')), '/ipConfigurations/ipconfig1')]",
                        "etag": "W/\"0b201355-b605-467d-9fe9-9216481b849e\"",
                        "type": "Microsoft.Network/networkInterfaces/ipConfigurations",
                        "properties": {
                            "provisioningState": "Succeeded",
                            "privateIPAddress": "10.0.0.4",
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIPAddress": {
                                "name": "VM1-ip",
                                "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_VM1_ip_name'))]",
                                "properties": {
                                    "provisioningState": "Succeeded",
                                    "resourceGuid": "4fdccbde-c9a0-4511-a550-1568004baa6a",
                                    "publicIPAddressVersion": "IPv4",
                                    "publicIPAllocationMethod": "Dynamic",
                                    "idleTimeoutInMinutes": 4,
                                    "ipTags": [],
                                    "ipConfiguration": {
                                        "id": "[concat(resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm1504_name')), '/ipConfigurations/ipconfig1')]"
                                    },
                                    "deleteOption": "Detach"
                                },
                                "type": "Microsoft.Network/publicIPAddresses",
                                "sku": {
                                    "name": "Basic",
                                    "tier": "Regional"
                                }
                            },
                            "subnet": {
                                "id": "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]"
                            },
                            "primary": true,
                            "privateIPAddressVersion": "IPv4",
                            "loadBalancerBackendAddressPools": [
                                {
                                    "id": "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]"
                                }
                            ]
                        }
                    }
                ],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableAcceleratedNetworking": false,
                "enableIPForwarding": false,
                "disableTcpStateTracking": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM1_nsg_name'))]"
                },
                "nicType": "Standard"
            }
        },
        {
            "type": "Microsoft.Network/networkInterfaces",
            "apiVersion": "2022-05-01",
            "name": "[parameters('networkInterfaces_vm2797_name')]",
            "location": "francecentral",
            "dependsOn": [
                "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_VM2_ip_name'))]",
                "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]",
                "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]",
                "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM2_nsg_name'))]"
            ],
            "kind": "Regular",
            "properties": {
                "ipConfigurations": [
                    {
                        "name": "ipconfig1",
                        "id": "[concat(resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm2797_name')), '/ipConfigurations/ipconfig1')]",
                        "etag": "W/\"97ace76c-d466-40d0-a2d4-894cdc2ba052\"",
                        "type": "Microsoft.Network/networkInterfaces/ipConfigurations",
                        "properties": {
                            "provisioningState": "Succeeded",
                            "privateIPAddress": "10.0.0.5",
                            "privateIPAllocationMethod": "Dynamic",
                            "publicIPAddress": {
                                "name": "VM2-ip",
                                "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIPAddresses_VM2_ip_name'))]",
                                "properties": {
                                    "provisioningState": "Succeeded",
                                    "resourceGuid": "8a959cb1-b181-4d7e-a697-a992c299b44d",
                                    "publicIPAddressVersion": "IPv4",
                                    "publicIPAllocationMethod": "Dynamic",
                                    "idleTimeoutInMinutes": 4,
                                    "ipTags": [],
                                    "ipConfiguration": {
                                        "id": "[concat(resourceId('Microsoft.Network/networkInterfaces', parameters('networkInterfaces_vm2797_name')), '/ipConfigurations/ipconfig1')]"
                                    },
                                    "deleteOption": "Detach"
                                },
                                "type": "Microsoft.Network/publicIPAddresses",
                                "sku": {
                                    "name": "Basic",
                                    "tier": "Regional"
                                }
                            },
                            "subnet": {
                                "id": "[resourceId('Microsoft.Network/virtualNetworks/subnets', parameters('virtualNetworks_DEV_vnet_name'), 'default')]"
                            },
                            "primary": true,
                            "privateIPAddressVersion": "IPv4",
                            "loadBalancerBackendAddressPools": [
                                {
                                    "id": "[resourceId('Microsoft.Network/loadBalancers/backendAddressPools', parameters('loadBalancers_LB_name'), concat(parameters('loadBalancers_LB_name'), 'VM'))]"
                                }
                            ]
                        }
                    }
                ],
                "dnsSettings": {
                    "dnsServers": []
                },
                "enableAcceleratedNetworking": false,
                "enableIPForwarding": false,
                "disableTcpStateTracking": false,
                "networkSecurityGroup": {
                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', parameters('networkSecurityGroups_VM2_nsg_name'))]"
                },
                "nicType": "Standard"
            }
        }
    ]
}
```
