# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barmanapi:
  pip.installed:
    - name: barmanapi >= {{ barman.api.version }}
    - require:
      - pkg: python-pip

/var/lib/barmanapi:
    file.directory:
        - user: {{ barman.user }}
        - group: {{ barman.user }}
        - dir_mode: 755
        - file_mode: 644
        - recurse:
            - user
            - group
        - makedirs: True
        - clean: False

barman-api-config:
  file.managed:
    - name: {{ barman.api.config }}
    - source: salt://barman/files/api.conf
    - mode: 644
    - user: {{ barman.user }}
    - group: {{ barman.user }}
    - template: jinja
    - defaults:
        config: {{ barman.api.config }}
        secret: {{ barman.api.secret }}
        host: {{ barman.api.host }}
        port: {{ barman.api.port }}
        debug: {{ barman.api.debug }}
        remote: {{ barman.api.remote }}
        remote_ssh: {{ barman.api.remote_ssh }}    
        async_command: {{ barman.api.async_command }}    
        backup_count: {{ barman.api.backup_count }}    
        max_bytes: {{ barman.api.max_bytes }}    
        auth_token_secret: {{ barman.api.auth_token.secret }}    
        auth_token_algorithm: {{ barman.api.auth_token.algorithm }}    
        auth_token_token_life: {{ barman.api.auth_token.token_life }}
        client_config: {{ barman.api.client.config }}

/usr/share/barmanapi/:
    file.directory:
        - user: {{ barman.user }}
        - group: {{ barman.user }}
        - dir_mode: 755
        - file_mode: 644
        - recurse:
            - user
            - group
        - makedirs: True
        - clean: False

barman-api-client-config:
  file.managed:
    - name: {{ barman.api.client.config }}
    - source: salt://barman/files/api-client.conf
    - mode: 644
    - user: {{ barman.user }}
    - group: {{ barman.user }}
    - template: jinja
    - defaults:
        user: {{ barman.api.client.username }}
        config: {{ barman.api.client.config }}
        password: {{ barman.api.client.password }}
        access: {{ barman.api.client.access }}
        deny: {{ barman.api.client.deny }}

barmanapi_start:
  cmd.run:
    - name: barmanapi runserver
    - runas: {{ barman.user }}
    - bg: True