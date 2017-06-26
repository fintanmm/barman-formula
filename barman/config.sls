# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barman-config:
  file.managed:
    - name: {{ barman.config }}
    - source: salt://barman/files/barman.conf
    - mode: 644
    - user: {{ barman.user }}
    - group: {{ barman.user }}
    - template: jinja
    - defaults:
        user: {{ barman.user }}
        config_dir: {{ barman.config_dir }}
        home: {{ barman.home }}
        log_file: {{ barman.log_file }}
        log_level: {{ barman.log_level }}
        compression: {{ barman.compression }}

{% for host in barman.hosts %}
{{ barman.config_dir }}/{{host}}.conf:
  file.managed:
    - source: salt://barman/files/host-template.conf
    - user: {{ barman.user }}
    - group: {{ barman.user }}
    - mode: 644
    - require:
      - pkg: {{ barman.pkg }}
    - template: jinja
    - defaults:
        custom_var: "default value"

{% endfor %}
