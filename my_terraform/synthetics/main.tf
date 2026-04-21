data "grafana_synthetic_monitoring_probes" "main" {}

resource "grafana_synthetic_monitoring_check" "Synthetics_BrowserCheck_login" {
  job       = "Synthetics:BrowserCheck"
  target    = "login"
  enabled   = true
  probes    = [data.grafana_synthetic_monitoring_probes.main.probes.London]
  labels    = {}
  frequency = 300000
  timeout   = 60000
  settings {
    browser {
      script = file("${path.module}/../../scripts/browser.js")
    }
  }
}