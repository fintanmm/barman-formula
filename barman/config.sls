# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barman-config:
  file.managed:
    - name: {{ barman.config }}
    - source: salt://barman/files/example.tmpl
    - mode: 644
    - user: root
    - group: root
