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
    - {{ cfg.cron.ensure|'present' }}
    - name: /usr/bin/barman backup {{ host }}
    - minute: '{{ cfg.cron.minute|'30' }}'
    - hour: '{{ cfg.cron.hour|'23' }}'
    - daymonth: '*'
    - month: '*'
    - dayweek: '*'
    - user: {{ barman.user }}
{% endfor %}