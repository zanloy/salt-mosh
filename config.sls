#!stateconf yaml . jinja

{% if salt['pillar.get']('mosh:firewall', '') == 'iptables' %}
.iptables:
  - table: filter
  - chain: INPUT
  - jump: ACCEPT
  - match: state
  - connstate: NEW
  - dport: 60000:61000
  - proto: udp
  - save: True
{% elif salt['pillar.get']('mosh:firewall', '') == 'ufw' %}
.ufw:
  file.managed:
    - name: /etc/ufw/applications.d/mosh
    - source: salt://mosh/files/ufw.rules
{% endif %}
