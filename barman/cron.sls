# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "barman/map.jinja" import barman with context %}

barman_cron_job:
  cron:
    - {{ barman.cron.ensure }}
    - name: "/usr/bin/barman cron"
    - user: {{ barman.user }}

{% for host, cfg in barman.hosts.iteritems() %}
cron_job_{{ host }}:
  cron:
    - {{ cfg.cron.ensure }}
    - name: /usr/bin/barman backup {{ host }}
    - minute: '{{ cfg.cron.minute }}'
    - hour: '{{ cfg.cron.hour }}'
    - daymonth: '*'
    - month: '*'
    - dayweek: '*'
    - user: {{ barman.user }}
{% endfor %}