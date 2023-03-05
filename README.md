Vault Agent
===========

This role will deploy a HashiCorp Vault agent onto the target server. It will
then deploy an AppRole secret ID and secret key onto the server.

In combination with the `vault_agent_templates` role will make deploying
certificates and tokens from Vault easy.

Requirements
------------

1. A working and accessible HashiCorp Vault server
2. If the parameter `vault.app_role` is set, then:
   1. Ansible configured to be able to use `lookup(community.hashi_vault.vault_read)`
   2. The Vault `AppRole` auth method must be mounted as `approle`.
   3. An AppRole must exist for the Workspace, as specified in the `vault.app_role` parameter.

Role Variables
--------------

* `vault_server`  
  Should point at the Vault server URL.  
  default "`https://vault:8200`"

* `vault_app_role`  
  The AppRole to use to generate a Secret ID and Key file.  
  default "`workspace-approle`"

* `vault_source_url`  
  The download URL for the Vault binary.  
   default "`https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_amd64.zip`"

* `vault_source_checksum`  
  The checksum for the downloaded Vault zip, to prevent unecessary redownloads.  
  default "`sha256:f4825bad06e77687b407eff7423acb9238adfd545d7345f2a0bb9e81b0c4b1eb`"

Dependencies
------------

This role makes use of `community.hashi_vault.vault_read` to retrieve secrets from Vault.

`requirements.yml`:
```yaml
collections:
- name: community.hashi_vault
  version: ">=4.1.0"
```
Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
  roles:
    - role: vault_agent
      become: yes
      vars:
        vault_server: https://vault:8200/
        vault_app_role: workspace-approle
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
