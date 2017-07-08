================
barman-formula
================

Barman (Backup and Recovery Manager) is an open-source administration tool for disaster recovery of PostgreSQL servers written in Python. It allows your organisation to perform remote backups of multiple servers in business critical environments to reduce risk and help DBAs during the recovery phase.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``barman``
------------

Meta state for installing, setting up the config files and creating the cron entries.

``barman.install``
------------

Installs the barman package.

``barman.repo``
------------

Manages the postgres repo for barman.

``barman.config``
------------

Configures barman and the host specific files.

``barman.cron``
------------

Sets up the barman cron job and the host specific cron job.
