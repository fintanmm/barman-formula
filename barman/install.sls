# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

include:
  - barman.repo

barman-pkg:
  pkg.installed:
    - name: {{ barman.pkg }}
