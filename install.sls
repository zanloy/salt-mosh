#!stateconf yaml . jinja

{% if grains['os_family'] == 'Debian' %}
.mosh_repo:
  pkgrepo.managed:
    - humanname: mosh repo
    - name: deb http://ppa.launchpad.net/keithw/mosh/ubuntu {{ grains['lsb_distrib_codename'] }} main
    - dist: {{ grains['lsb_distrib_codename'] }}
    - file: /etc/apt/sources.list.d/keithw-mosh.list
    - keyid: 7BF6DFCD
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: .mosh
{% endif %}

.mosh:
  pkg.latest:
    - name: mosh
    - refresh: True
