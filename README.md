# ubuntu-backports

[![Build Status](https://travis-ci.org/osism/ubuntu-backports.svg?branch=master)](https://travis-ci.org/osism/ubuntu-backports)

## Managed repositories

* https://packages.osism.de/bionic-backports

## Usage

* ``/etc/apt/source.list.d/osism-bionic-backports``

  ```
  deb [trusted=yes] https://packages.osism.de bionic-backports/
  ```

* ``/etc/apt/preferences.d/osism-bionic-backports``

  ```
  Package: docker-compose
  Pin: release o=pbuilder
  Pin-Priority: 999

  Package: python3-requests
  Pin: release o=pbuilder
  Pin-Priority: 999
  ```
