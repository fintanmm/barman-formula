# Setup Elastic Repo
{% from "barman/map.jinja" import barman with context %}

barman-repo:
  pkgrepo.managed:
    - humanname: barman Repo
    - name: deb {{ barman.repo_url }} {{ salt['grains.get']('oscodename') }}-pgdg main
    - file: /etc/apt/sources.list.d/barman.list
    - gpgcheck: 1
    - key_url: {{ barman.repo_key }}
    - require_in:
      - pkg: barman
    - clean_file: true