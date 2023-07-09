# Creating CloudBees CD/RO

Use *Ubuntu* VM to set up the server. With Debian - it just simply doesnt work well with the httpd/apache2 service out-of-the-box. I dont want to create an alias or something to get it to work. So, just stick to Ubuntu

## Installing

Download Apache web server
```
sudo apt install apache2
```

Download the CloudBees CD/RO installer file and install it
```
wget https://downloads.cloudbees.com/cloudbees-cd/Release_2023.06/2023.06.0.164409/linux/CloudBeesFlow-x64-2023.06.0.164409
chmod +x CloudBeesFlow-x64-2023.06.0.164409
sudo ./CloudBeesFlow-x64-2023.06.0.164409
```

Make sure you create a symlink named `credentials.json` since that is used the TF provider to authenticate itself with GCP

## Setup

Ensure ports 80 and 443 are open. First time username is `admin` and password is `changeme`. If you're using my instance, the password now is `mwkkvy4MYB3uqfery`

Install terrform by following instructions https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli



# Creating CloudBees CI (not important)

We are going to install both the operations center and the client management portal on the same machine because this is a quick PoC anyway. We will have another VM as a build agent that runs Docker containers. 

You might need a bigger instance such as ec2-medium for this since the micro/small instances cannot handle running both at the same time.

# Installing

Install Java 11. No, you cannot use Java 17 LTS since Cloudbees does not support that :( 

```
sudo apt install -y  ca-certificates-java openjdk-11-jdk
```

Run the following:
```
wget -q -O - https://downloads.cloudbees.com/cloudbees-core/traditional/operations-center/rolling/debian/cloudbees.com.key | sudo apt-key add -
wget -q -O - https://downloads.cloudbees.com/cloudbees-core/traditional/client-master/rolling/debian/cloudbees.com.key | sudo apt-key add -
```

Add the following to your `/etc/apt/sources.list`
```

deb https://downloads.cloudbees.com/cloudbees-core/traditional/client-master/rolling/debian binary/
deb https://downloads.cloudbees.com/cloudbees-core/traditional/operations-center/rolling/debian binary/
```

Update your apt repos and install both
```
sudo apt-get update
sudo apt-get install -y cloudbees-core-oc cloudbees-core-cm
```

Validate that both services are running by using the following commands
```
sudo systemctl status cloudbees-core-cm.service
sudo systemctl status cloudbees-core-oc.service
```

# Setting up

Username: `varun_admin`
Password: `mbvjzh2ayc9qdv1WKA`

## Docker Nodes

Install "Docker Pipeline" plugin by going to the Plugins page on Cloudbees' Settings. This will allow us to use Docker containers to run on the same VM


