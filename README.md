Role Name
=========

A brief description of the role goes here.

Requirements
------------

1. If the parameter `vault.app_role` is set, then:
   1. The Vault `AppRole` auth method must be mounted as `approle`.
   1. An AppRole must exist for the Workspace, as specified in the `vault.app_role` parameter.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
  roles:
    - role: vault_agent
      vars:
        vault_server: https://vault:8200/
        vault_app_role: workspace-approle
        vault_pki_engine: pki-int-ca
        vault_certificates:
          - name: "host"
            common_name: "{{ inventory_hostname }}"
            alt_names: "{{ inventory_hostname }}"
            ip_sans: "{{ ansible_default_ipv4.address }}"
            cert_file: "/etc/vault.d/"
            key_file: "/etc/vault.d/"
            ca_file: "/etc/vault.d/"
            ttl: "1h"
        vault_tokens:
          - name: test
            token_file: "/etc/vault.d/test-token"
```

License
-------

Copyright 2023 Mark Hanford

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
