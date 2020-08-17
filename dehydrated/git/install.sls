# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import dehydrated with context %}

dehydrated-git-package-install-pkg-installed:
  pkg.installed:
    - name: {{ dehydrated.git.pkg.name }}
