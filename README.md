# home-grafana-victoriametrics-stack

Unsecured, minimal, Grafana + VictoriaMetrics + node_exporter stack
that should cover some your home monitoring needs.

Aims to be easy to set up and intended for small home network use.

## Usage

0. Git clone

1. Create self-signed HTTPS certificates for Grafana:
   ```bash
   $ sudo ./makecert.sh
   ```

2. Set Grafana config and username/password
   ```bash
   $ cp config/templates/grafana.template.ini config/grafana.ini
   $ editor config/grafana.ini
   ```

3. Set up Prometheus targets (you can leave this file blank if not using json_exporter)
   ```bash
   $ cp config/templates/prometheus.template.yml config/prometheus.yml
   $ editor config/prometheus.yml 
   ```

4. Start it up
   ```bash
   $ docker-compose up -d
   ```

5. Check services
    - VictoriaMetrics http://0.0.0.0:8428
    - Grafana https://0.0.0.0:9080
    - node_exporter http://0.0.0.0:9100

6. Configure Grafana
    - https://0.0.0.0:9080/datasources/new
    - Add a Prometheus data source
      - Name: VictoriaMetrics
      - URL: http://0.0.0.0:8428
    See: https://docs.victoriametrics.com/#grafana-setup

    - Add node_exporter dashboard
      - https://0.0.0.0:9080/dashboard/import
      - `13978` (node_exporter, https://grafana.com/grafana/dashboards/13978)
      - `10229` (VictoriaMetrics, https://grafana.com/grafana/dashboards/10229)

### Optional

#### Set up alerts

- https://0.0.0.0:9080/alerting/notification/

#### Set Docker networking

If you don't need host networking (to access private IPs for example), you can edit `docker-compose.yml` to remove `network_mode: host`.
