vagrant-nexus
=============

Project to set up Sonatype Nexus via Vagrant / Puppet.

Quick start
-----------

* `git clone git@github.com:skempken/vagrant-nexus.git`
* `cd vagrant-nexus`
* `git submodule init`
* `git submodule update`
* `vagrant up`
* ...wait...
* Nexus should be available on `http://localhost:9000`

Working folder
--------------
By default, Nexus' working folder is synchronized to the host machine. This allows for some flexibility - for instance, you can recreate the Vagrant VM without losing all artifacts. If you do not want this, remove the corresponding line in `Vagrantfile`. 