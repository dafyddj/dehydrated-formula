# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import dehydrated with context %}

dehydrated-service-clean-service-dead:
  service.dead:
    - name: {{ dehydrated.service.name }}
    - enable: False
