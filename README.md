# QueueFlex

Arbitrary task distribution platform.

## Installation

QueueFlex is available as a system package for various operating systems, and can be installed as follows:

### Debian 8

```
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/benlangfeld/QueueFlex jessie master" | sudo tee /etc/apt/sources.list.d/QueueFlex.list
sudo apt-get -y update
sudo apt-get -y install queueflex
```

### Ubuntu 14.04

```
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/benlangfeld/QueueFlex trusty master" | sudo tee /etc/apt/sources.list.d/QueueFlex.list
sudo apt-get -y update
sudo apt-get -y install queueflex
```

## CentOS 7

```
sudo rpm --import https://rpm.packager.io/key
echo "[QueueFlex]
name=Repository for QueueFlex application.
baseurl=https://rpm.packager.io/gh/benlangfeld/queueflex/centos7/master
enabled=1" | sudo tee /etc/yum.repos.d/QueueFlex.repo
sudo yum install queueflex
```

QueueFlex can also be deployed to Heroku; in fact, the [QueueFlex demo](http://demo.queueflex.com) runs on Heroku and is automatically deployed from the master branch.

## More info

The project website is at http://queueflex.com and the source code repository lives [on GitHub](https://github.com/benlangfeld/QueueFlex). Futher available resources are the [community mailing list](http://groups.google.com/group/queueflex), the project [Twitter account](https://twitter.com/queueflex) and [a scrum board](https://www.pivotaltracker.com/n/projects/1496824) for planning project work, while bugs should be reported [via GitHub issues](https://github.com/benlangfeld/QueueFlex/issues).

## Contributing

See the [CONTRIBUTING.md](CONTRIBUTING.md) file for details.

## Credits

Copyright 2015 Ben Langfeld. See the LICENSE file for more information.
