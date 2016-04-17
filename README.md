# Vagrant

Prerequirements:
- You need VirtualBox as provider initialy installed
- You need ansible installed, as it's used as provisioning for the VMs

The vagrant folder contains the necessity to start two VM configured with puppet and ansible, one running nginx and errbit and the other running MongoDB. You can start them by running: 

`vagrant up`

This will install:

* MondoDB server with version of mongodb: `2.6.12`

* Errbit application server with: 
- Nginx
- Gem version: `2.4.8`
- Ruby version: `2.1.9`
- Errbit application

* After successfull installation, the application server can be accessed at http://192.168.10.2 from the vagrant host.
