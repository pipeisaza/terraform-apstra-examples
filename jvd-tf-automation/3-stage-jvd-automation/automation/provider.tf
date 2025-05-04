terraform {
    required_providers {
        apstra = {
            source = "Juniper/apstra"
        }
    }
}

## provider details

provider "apstra" {
    url = "https://admin:N0m10$Lab_2025@10.31.100.58:443"
    tls_validation_disabled = true
    blueprint_mutex_enabled = false
    # experimental = true
}

