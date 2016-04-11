# Vagrant

Prerequirements:
- You need VirtualBox as provider initialy installed
- You need ansible installed, as it's used as provisioning for the VMs

The vagrant folder contains the necessity to start two VM configured with puppet and ansible, one running nginx and errbit and the other running MongoDB. You can start them by running: 

`vagrant up`

This will install MondoDB server with version of mongodb: `2.6.12`

The other server will be installed with: 
Gem version:
`2.2.5`
Ruby inition version:
`2.0.0`
Ruby updated version:
`2.1.0`
Errbit application 
