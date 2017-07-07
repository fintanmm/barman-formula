# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barman-name:
  service.running:
    - name: {{ barman.service.name }}
    - enable: True
