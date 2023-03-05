exit_after_auth = false
pid_file = "/opt/vault/{{ vault_service_name }}.pid"

vault {
    address = "{{ vault_server }}"
}

// listener "tcp" {
//     address = "127.0.0.1:8100"
//     tls_disable = true
// }

{% if vault_app_role|length %}
// cache {
//     use_auto_auth_token = true
// }

auto_auth {
    method "approle" {
        config = {
            role_id_file_path = "/etc/vault.d/role-id"
            secret_id_file_path = "/etc/vault.d/secret-id"  
            remove_secret_id_file_after_reading = false
        }
    }
}
{% endif %}

{% for cert in vault_certificates %}
template {
    source      = "/etc/vault.d/cert-{{ cert.name }}.tmpl"
    destination = "{{ cert.cert_file }}"
}
{% endfor %}

{% for token in vault_tokens %}
template {
    source      = "/etc/vault.d/token-{{ token.name }}.tmpl"
    destination = "{{ token.token_file }}"
}
{% endfor %}
