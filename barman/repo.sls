# Setup Elastic Repo
{% from "barman/map.jinja" import barman with context %}

barman-repo:
  pkgrepo.managed:
    - humanname: barman Repo
    - name: deb {{ barman.repo_url }} stable main
    - file: /etc/apt/sources.list.d/barman.list
    - gpgcheck: 1
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: barman
    - clean_file: true