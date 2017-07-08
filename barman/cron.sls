# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barman_cron_job:
  cron:
    - {{ barman.cron.status }}
    - name: "/usr/bin/barman cron"
    - user: {{ barman.user }}
