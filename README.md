samba-ad-keytab-joiner
======================

A simple and generic Ansible role to create an simple SAMBA 4 Active Directory deployment with a generic user linked to a keytab.

Requirements
------------

Tested with Fedora 28 and CentOS 7 inside LXC containers. Should work in a VM or physical host, too.

Role Variables
--------------

```yaml
vars:
  samba-ad-keytab-joiner:
    ad_joiner_user:		# name of the AD joiner user to be created; default to "ad-joiner"
    ad_joiner_pass:		# password for the AD joiner user; defaults to "FakePass 123"
    ad_admin_pass:		# AD 'Administrator' user password; defaults to "FakePass 123"
    ad_domain:			# AD domain name; defaults to "c7"
    ad_tld:				# AD top level domain; defaults to "priv"
    ad_realm:			# AD realm; built with ad_domain and ad_tld; defaults to "c7.priv"
```

Dependencies
------------

None at this moment.

Example Playbook
----------------

Basic AD deployed on localhost using defaults passwords and AD joiner user name and ad.test.priv as realm name:

```sh
# cat inventories/hosts 
[all]
localhost	ansible_connection=local
```

```yaml
- name: Basic ad.test.priv AD 
  hosts: localhost
  become: true
  roles:
    - role: samba-ad-keytab-joiner
```

License
-------

BSD

Author Information
------------------

https://github.com/mahoul
