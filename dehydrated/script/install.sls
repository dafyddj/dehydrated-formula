# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_git_install = tplroot ~ '.git.install' %}
{%- from tplroot ~ "/map.jinja" import dehydrated with context %}

include:
  - {{ sls_git_install }}

dehydrated-script-install-file-managed:
  file.managed:
    - name: {{ dehydrated.git.root_dir }}\{{ dehydrated.script.script_dir }}\{{ dehydrated.script.name }}
    - source: https://github.com/dehydrated-io/dehydrated/raw/v{{ dehydrated.script.version }}/dehydrated
    - source_hash: {{ dehydrated.script.script_hash[dehydrated.script.version] }}
    - win_owner: {{ dehydrated.file_owner }}
    - require:
      - sls: {{ sls_git_install }}
