![tenable-generic](https://github.com/onierahman/Tenable/assets/40553057/e13e9fb1-f852-495b-b28b-918a0400c5ab)
# Install Docker on Linux (AlmaLinux)

**Prerequisites:**
  Operating system and version: AlmaLinux OS 8.
  
  Use the sudo command as root to log into the AlmaLinux 8 system or log in as a user with admin rights.
  
  Kernel version: 3.10 or higher
  
**Update System:**
````
sudo dnf --refresh update
sudo dnf upgrade
````

**Enable Docker Repository**
````
sudo dnf install yum-utils
````

Then, you can add the Docker repository using yum-config-manager:

````
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
````

**Install Docker on Linux (AlmaLinux) with the dnf Command:**
````
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
````

Here is the output:
````
~]# sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin
Docker CE Stable - x86_64                                                                                                                740 kB/s |  49 kB     00:00    
Dependencies resolved.
=========================================================================================================================================================================
 Package                                       Architecture            Version                                                   Repository                         Size
=========================================================================================================================================================================
Installing:
 containerd.io                                 x86_64                  1.6.22-3.1.el8                                            docker-ce-stable                   34 M
 docker-ce                                     x86_64                  3:24.0.5-1.el8                                            docker-ce-stable                   24 M
 docker-ce-cli                                 x86_64                  1:24.0.5-1.el8                                            docker-ce-stable                  7.2 M
 docker-compose-plugin                         x86_64                  2.20.2-1.el8                                              docker-ce-stable                   13 M
Installing dependencies:
 container-selinux                             noarch                  2:2.205.0-2.module_el8.8.0+3557+7ba9cc13                  appstream                          63 k
 docker-ce-rootless-extras                     x86_64                  24.0.5-1.el8                                              docker-ce-stable                  4.9 M
 fuse-common                                   x86_64                  3.3.0-16.el8                                              baseos                             21 k
 fuse-overlayfs                                x86_64                  1.11-1.module_el8.8.0+3557+7ba9cc13                       appstream                          73 k
 fuse3                                         x86_64                  3.3.0-16.el8                                              baseos                             53 k
 fuse3-libs                                    x86_64                  3.3.0-16.el8                                              baseos                             94 k
 iptables                                      x86_64                  1.8.4-24.el8                                              baseos                            585 k
 libcgroup                                     x86_64                  0.41-19.el8                                               baseos                             69 k
 libnetfilter_conntrack                        x86_64                  1.0.6-5.el8                                               baseos                             65 k
 libnfnetlink                                  x86_64                  1.0.1-13.el8                                              baseos                             33 k
 libnftnl                                      x86_64                  1.1.5-5.el8                                               baseos                             82 k
 libslirp                                      x86_64                  4.4.0-1.module_el8.7.0+3407+95aa0ca9                      appstream                          69 k
 policycoreutils-python-utils                  noarch                  2.9-24.el8                                                baseos                            253 k
 slirp4netns                                   x86_64                  1.2.0-2.module_el8.7.0+3407+95aa0ca9                      appstream                          53 k
Installing weak dependencies:
 docker-buildx-plugin                          x86_64                  0.11.2-1.el8                                              docker-ce-stable                   13 M
Enabling module streams:
 container-tools                                                       rhel8                                                                                            

Transaction Summary
=========================================================================================================================================================================
Install  19 Packages
—-
—-

Importing GPG key 0x621E9F35:
 Userid     : "Docker Release (CE rpm) <docker@docker.com>"
 Fingerprint: 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35
 From       : https://download.docker.com/linux/centos/gpg
Is this ok [y/N]: y
Key imported successfully
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
—-
—-
Installed:
  container-selinux-2:2.205.0-2.module_el8.8.0+3557+7ba9cc13.noarch                            containerd.io-1.6.22-3.1.el8.x86_64                                      
  docker-buildx-plugin-0.11.2-1.el8.x86_64                                                     docker-ce-3:24.0.5-1.el8.x86_64                                          
  docker-ce-cli-1:24.0.5-1.el8.x86_64                                                          docker-ce-rootless-extras-24.0.5-1.el8.x86_64                            
  docker-compose-plugin-2.20.2-1.el8.x86_64                                                    fuse-common-3.3.0-16.el8.x86_64                                          
  fuse-overlayfs-1.11-1.module_el8.8.0+3557+7ba9cc13.x86_64                                    fuse3-3.3.0-16.el8.x86_64                                                
  fuse3-libs-3.3.0-16.el8.x86_64                                                               iptables-1.8.4-24.el8.x86_64                                             
  libcgroup-0.41-19.el8.x86_64                                                                 libnetfilter_conntrack-1.0.6-5.el8.x86_64                                
  libnfnetlink-1.0.1-13.el8.x86_64                                                             libnftnl-1.1.5-5.el8.x86_64                                              
  libslirp-4.4.0-1.module_el8.7.0+3407+95aa0ca9.x86_64                                         policycoreutils-python-utils-2.9-24.el8.noarch                           
  slirp4netns-1.2.0-2.module_el8.7.0+3407+95aa0ca9.x86_64                                     

Complete!
````
**Start & Enable Docker Service**
Once Docker and its dependencies are installed, start and enable its service using the following commands:
````
sudo systemctl start docker
sudo systemctl enable docker
````
By using the following command, you can see if the Docker service is running:
````
sudo systemctl status docker
````
Here is the output:
````
~]# sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Thu 2023-08-17 07:50:43 UTC; 4min 40s ago
     Docs: https://docs.docker.com
 Main PID: 24759 (dockerd)
    Tasks: 9
   Memory: 34.7M
   CGroup: /system.slice/docker.service
           └─24759 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal systemd[1]: Starting Docker Application Container Engine...
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.206086907Z" level=info msg="Starting up"
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.235174640Z" level=info msg="Loading containers: start."
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.897941682Z" level=info msg="Loading containers: done."
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.921892106Z" level=info msg="Docker daemon" commit=a61e2b4 graphdri>
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.922270417Z" level=info msg="Daemon has completed initialization"
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal dockerd[24759]: time="2023-08-17T07:50:43.972878879Z" level=info msg="API listen on /run/docker.sock"
Aug 17 07:50:43 ip-172-31-20-172.us-east-2.compute.internal systemd[1]: Started Docker Application Container Engine.
````

**Check Docker Version**
Next, use either of the following commands to check the Docker version:
````
sudo docker version
docker --version
````
Here is the output:
````
~]# sudo docker version
Client: Docker Engine - Community
 Version:           24.0.5
 API version:       1.43
 Go version:        go1.20.6
 Git commit:        ced0996
 Built:             Fri Jul 21 20:36:32 2023
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          24.0.5
  API version:      1.43 (minimum version 1.12)
  Go version:       go1.20.6
  Git commit:       a61e2b4
  Built:            Fri Jul 21 20:35:32 2023
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.6.22
  GitCommit:        8165feabfdfe38c65b599c4993d227328c231fca
 runc:
  Version:          1.1.8
  GitCommit:        v1.1.8-0-g82f18fe
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0

~]# docker --version
Docker version 24.0.5, build ced0996
````

**Test Docker Installation**
To test the installation, start a docker container with the hello-world image:
````
sudo docker run hello-world
````
Here is the output:
````
~]# sudo docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
719385e32844: Pull complete 
Digest: sha256:dcba6daec718f547568c562956fa47e1b03673dd010fe6ee58ca806767031d1c
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 ````
You have successfully completed the steps to Install Docker on Linux (AlmaLinux).

**Add User to Docker User Group**
You will be able to add your local user to the docker group so that the user can use docker commands without sudo:
 ````
sudo usermod -aG docker $USER
 ````
Replace $USER as per your requirement. You can use the following command to see if your user is a member of the docker group:
 ````
id $USER
 ````
Here is the output:
````
~]# sudo usermod -aG docker root
~]# id root
uid=0(root) gid=0(root) groups=0(root),991(docker)
````

**Uninstall Docker on AlmaLinux**
You can use the following command to uninstall Docker from your AlmaLinux:
````
sudo dnf remove docker-ce docker-ce-cli containerd.io docker-compose-plugin
````
Here is the output:
````
~]# sudo dnf remove docker-ce docker-ce-cli containerd.io docker-compose-plugin
Dependencies resolved.
=========================================================================================================================================================================
 Package                                      Architecture           Version                                                     Repository                         Size
=========================================================================================================================================================================
Removing:
 containerd.io                                x86_64                 1.6.22-3.1.el8                                              @docker-ce-stable                 114 M
 docker-ce                                    x86_64                 3:24.0.5-1.el8                                              @docker-ce-stable                  98 M
 docker-ce-cli                                x86_64                 1:24.0.5-1.el8                                              @docker-ce-stable                  28 M
 docker-compose-plugin                        x86_64                 2.20.2-1.el8                                                @docker-ce-stable                  58 M
Removing unused dependencies:
 container-selinux                            noarch                 2:2.205.0-2.module_el8.8.0+3557+7ba9cc13                    @appstream                         62 k
 docker-buildx-plugin                         x86_64                 0.11.2-1.el8                                                @docker-ce-stable                  59 M
 docker-ce-rootless-extras                    x86_64                 24.0.5-1.el8                                                @docker-ce-stable                  15 M
 fuse-common                                  x86_64                 3.3.0-16.el8                                                @baseos                           5.1 k
 fuse-overlayfs                               x86_64                 1.11-1.module_el8.8.0+3557+7ba9cc13                         @appstream                        145 k
 fuse3                                        x86_64                 3.3.0-16.el8                                                @baseos                           100 k
 fuse3-libs                                   x86_64                 3.3.0-16.el8                                                @baseos                           274 k
 iptables                                     x86_64                 1.8.4-24.el8                                                @baseos                           1.9 M
 libcgroup                                    x86_64                 0.41-19.el8                                                 @baseos                           136 k
 libnetfilter_conntrack                       x86_64                 1.0.6-5.el8                                                 @baseos                           161 k
 libnfnetlink                                 x86_64                 1.0.1-13.el8                                                @baseos                            51 k
 libnftnl                                     x86_64                 1.1.5-5.el8                                                 @baseos                           217 k
 libslirp                                     x86_64                 4.4.0-1.module_el8.7.0+3407+95aa0ca9                        @appstream                        134 k
 policycoreutils-python-utils                 noarch                 2.9-24.el8                                                  @baseos                           138 k
 slirp4netns                                  x86_64                 1.2.0-2.module_el8.7.0+3407+95aa0ca9                        @appstream                        103 k

Transaction Summary
=========================================================================================================================================================================
Remove  19 Packages

---
---

Removed:
  container-selinux-2:2.205.0-2.module_el8.8.0+3557+7ba9cc13.noarch                            containerd.io-1.6.22-3.1.el8.x86_64                                      
  docker-buildx-plugin-0.11.2-1.el8.x86_64                                                     docker-ce-3:24.0.5-1.el8.x86_64                                          
  docker-ce-cli-1:24.0.5-1.el8.x86_64                                                          docker-ce-rootless-extras-24.0.5-1.el8.x86_64                            
  docker-compose-plugin-2.20.2-1.el8.x86_64                                                    fuse-common-3.3.0-16.el8.x86_64                                          
  fuse-overlayfs-1.11-1.module_el8.8.0+3557+7ba9cc13.x86_64                                    fuse3-3.3.0-16.el8.x86_64                                                
  fuse3-libs-3.3.0-16.el8.x86_64                                                               iptables-1.8.4-24.el8.x86_64                                             
  libcgroup-0.41-19.el8.x86_64                                                                 libnetfilter_conntrack-1.0.6-5.el8.x86_64                                
  libnfnetlink-1.0.1-13.el8.x86_64                                                             libnftnl-1.1.5-5.el8.x86_64                                              
  libslirp-4.4.0-1.module_el8.7.0+3407+95aa0ca9.x86_64                                         policycoreutils-python-utils-2.9-24.el8.noarch                           
  slirp4netns-1.2.0-2.module_el8.7.0+3407+95aa0ca9.x86_64                                     

Complete!
````
Docker images, containers, volumes, or customized configuration files on your AlmaLinux system are not deleted automatically. You should manually delete all images, containers, and volumes using the following commands:
````
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
````
