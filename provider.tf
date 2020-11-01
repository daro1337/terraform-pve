provider "proxmox" {
    pm_api_url = "https://192.168.168.192:8006/api2/json"
    pm_user = "root@pam"
    #pm_password  = password | or "export PM_PASS=password"
    pm_tls_insecure = "true"
    pm_parallel = 8
    pm_timeout = 600
}
