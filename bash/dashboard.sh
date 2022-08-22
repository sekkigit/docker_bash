#!/bin/bash

cat <<EOF > /home/"${SUDO_USER:-$USER}"/docker/grafana/dashboards/dashboard_cadvisor.json
{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "Prometheus as the datasource is obligatory",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "7.4.5"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": ""
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "table",
      "name": "Table",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": 14282,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1617715580880,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 8,
      "panels": [],
      "title": "CPU",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 1
      },
      "hiddenSeries": false,
      "id": 15,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null as zero",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.5",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_cpu_usage_seconds_total{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"}[5m])) by (name) *100",
          "hide": false,
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "CPU Usage",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "\$\$hashKey": "object:606",
          "format": "percent",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "\$\$hashKey": "object:607",
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 8
      },
      "id": 11,
      "panels": [],
      "title": "Memory",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 9
      },
      "hiddenSeries": false,
      "id": 9,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null as zero",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.5",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(container_memory_rss{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"}) by (name)",
          "hide": false,
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Memory Usage",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "\$\$hashKey": "object:606",
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "\$\$hashKey": "object:607",
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 9
      },
      "hiddenSeries": false,
      "id": 14,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null as zero",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.5",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": true,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(container_memory_cache{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"}) by (name)",
          "hide": false,
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Memory Cached",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "\$\$hashKey": "object:606",
          "format": "bytes",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "\$\$hashKey": "object:607",
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "id": 2,
      "panels": [],
      "title": "Network",
      "type": "row"
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 0,
        "y": 18
      },
      "hiddenSeries": false,
      "id": 4,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "hideEmpty": false,
        "hideZero": false,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "sideWidth": null,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.5",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_network_receive_bytes_total{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"}[5m])) by (name)",
          "hide": false,
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Received Network Traffic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "\$\$hashKey": "object:674",
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "\$\$hashKey": "object:675",
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {}
        },
        "overrides": []
      },
      "fill": 1,
      "fillGradient": 0,
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 18
      },
      "hiddenSeries": false,
      "id": 6,
      "legend": {
        "alignAsTable": true,
        "avg": true,
        "current": false,
        "max": true,
        "min": false,
        "rightSide": true,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "nullPointMode": "null",
      "options": {
        "alertThreshold": true
      },
      "percentage": false,
      "pluginVersion": "7.4.5",
      "pointradius": 2,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "expr": "sum(rate(container_network_transmit_bytes_total{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"}[5m])) by (name)",
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeRegions": [],
      "timeShift": null,
      "title": "Sent Network Traffic",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "\$\$hashKey": "object:832",
          "format": "Bps",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "\$\$hashKey": "object:833",
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "collapsed": false,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 26
      },
      "id": 19,
      "panels": [],
      "title": "Misc",
      "type": "row"
    },
    {
      "datasource": "Prometheus",
      "fieldConfig": {
        "defaults": {
          "custom": {
            "align": null,
            "filterable": false
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": [
          {
            "matcher": {
              "id": "byName",
              "options": "id"
            },
            "properties": [
              {
                "id": "custom.width",
                "value": 260
              }
            ]
          },
          {
            "matcher": {
              "id": "byName",
              "options": "Running"
            },
            "properties": [
              {
                "id": "unit",
                "value": "d"
              },
              {
                "id": "decimals",
                "value": 1
              },
              {
                "id": "custom.displayMode",
                "value": "color-text"
              },
              {
                "id": "color",
                "value": {
                  "fixedColor": "dark-green",
                  "mode": "fixed"
                }
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 10,
        "w": 24,
        "x": 0,
        "y": 27
      },
      "id": 17,
      "options": {
        "showHeader": true,
        "sortBy": []
      },
      "pluginVersion": "7.4.5",
      "targets": [
        {
          "expr": "(time() - container_start_time_seconds{instance=~\"\$host\",name=~\"\$container\",name=~\".+\"})/86400",
          "format": "table",
          "instant": true,
          "interval": "",
          "legendFormat": "{{name}}",
          "refId": "A"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Containers Info",
      "transformations": [
        {
          "id": "filterFieldsByName",
          "options": {
            "include": {
              "names": [
                "container_label_com_docker_compose_project",
                "container_label_com_docker_compose_project_working_dir",
                "image",
                "instance",
                "name",
                "Value",
                "container_label_com_docker_compose_service"
              ]
            }
          }
        },
        {
          "id": "organize",
          "options": {
            "excludeByName": {},
            "indexByName": {},
            "renameByName": {
              "Value": "Running",
              "container_label_com_docker_compose_project": "Label",
              "container_label_com_docker_compose_project_working_dir": "Working dir",
              "container_label_com_docker_compose_service": "Service",
              "image": "Registry Image",
              "instance": "Instance",
              "name": "Name"
            }
          }
        }
      ],
      "type": "table"
    }
  ],
  "schemaVersion": 27,
  "style": "dark",
  "tags": [
    "cadvisor",
    "docker"
  ],
  "templating": {
    "list": [
      {
        "allValue": ".*",
        "current": {},
        "datasource": "Prometheus",
        "definition": "label_values({__name__=~\"container.*\"},instance)",
        "description": null,
        "error": null,
        "hide": 0,
        "includeAll": true,
        "label": "Host",
        "multi": false,
        "name": "host",
        "options": [],
        "query": {
          "query": "label_values({__name__=~\"container.*\"},instance)",
          "refId": "Prometheus-host-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 5,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": ".*",
        "current": {},
        "datasource": "Prometheus",
        "definition": "label_values({__name__=~\"container.*\", instance=~\"\$host\"},name)",
        "description": null,
        "error": null,
        "hide": 0,
        "includeAll": true,
        "label": "Container",
        "multi": false,
        "name": "container",
        "options": [],
        "query": {
          "query": "label_values({__name__=~\"container.*\", instance=~\"\$host\"},name)",
          "refId": "Prometheus-container-Variable-Query"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      }
    ]
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Cadvisor exporter",
  "uid": "pMEd7m0Mz",
  "version": 1,
  "description": "Simple exporter for cadvisor only"
}
EOF

cat <<EOF > /home/"${SUDO_USER:-$USER}"/docker/grafana/dashboards/dashboard_node_exporter.json
{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__requires": [
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "6.7.4"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": ""
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "singlestat",
      "name": "Singlestat",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "\$\$hashKey": "object:19",
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "Complete Prometheus Node Exporter dashboard",
  "editable": true,
  "gnetId": 12486,
  "graphTooltip": 0,
  "id": null,
  "iteration": 1592401951667,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 261,
      "panels": [],
      "repeat": null,
      "title": "Quick CPU / Mem / Disk",
      "type": "row"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Busy state of all CPU cores together",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 0,
        "y": 1
      },
      "id": 20,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "id": 0,
                "op": "=",
                "text": "N/A",
                "type": 1,
                "value": "null"
              }
            ],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 85
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 95
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "(((count(count(node_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}) by (cpu))) - avg(sum by (mode)(irate(node_cpu_seconds_total{mode='idle',instance=\"\$node\",job=\"\$job\"}[5m])))) * 100) / count(count(node_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}) by (cpu))",
          "hide": false,
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 900
        }
      ],
      "title": "CPU Busy",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Busy state of all CPU cores together (5 min average)",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 3,
        "y": 1
      },
      "id": 155,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "id": 0,
                "op": "=",
                "text": "N/A",
                "type": 1,
                "value": "null"
              }
            ],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 85
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 95
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "avg(node_load5{instance=\"\$node\",job=\"\$job\"}) /  count(count(node_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}) by (cpu)) * 100",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "title": "Sys Load (5m avg)",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Busy state of all CPU cores together (15 min average)",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 6,
        "y": 1
      },
      "id": 19,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "id": 0,
                "op": "=",
                "text": "N/A",
                "type": 1,
                "value": "null"
              }
            ],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 85
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 95
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "avg(node_load15{instance=\"\$node\",job=\"\$job\"}) /  count(count(node_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}) by (cpu)) * 100",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "title": "Sys Load (15m avg)",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Non available RAM memory",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 9,
        "y": 1
      },
      "hideTimeOverride": false,
      "id": 16,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "decimals": 0,
            "mappings": [],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 80
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 90
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "((node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_MemFree_bytes{instance=\"\$node\",job=\"\$job\"}) / (node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"} )) * 100",
          "format": "time_series",
          "hide": true,
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        },
        {
          "expr": "100 - ((node_memory_MemAvailable_bytes{instance=\"\$node\",job=\"\$job\"} * 100) / node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"})",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "B",
          "step": 900
        }
      ],
      "title": "RAM Used",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Used Swap",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 12,
        "y": 1
      },
      "id": 21,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "id": 0,
                "op": "=",
                "text": "N/A",
                "type": 1,
                "value": "null"
              }
            ],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 10
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 25
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "((node_memory_SwapTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_SwapFree_bytes{instance=\"\$node\",job=\"\$job\"}) / (node_memory_SwapTotal_bytes{instance=\"\$node\",job=\"\$job\"} )) * 100",
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "title": "SWAP Used",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "datasource": "Prometheus",
      "description": "Used Root FS",
      "gridPos": {
        "h": 4,
        "w": 3,
        "x": 15,
        "y": 1
      },
      "id": 154,
      "links": [],
      "options": {
        "fieldOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "defaults": {
            "color": {
              "mode": "thresholds"
            },
            "mappings": [
              {
                "id": 0,
                "op": "=",
                "text": "N/A",
                "type": 1,
                "value": "null"
              }
            ],
            "max": 100,
            "min": 0,
            "nullValueMode": "null",
            "thresholds": {
              "mode": "absolute",
              "steps": [
                {
                  "color": "rgba(50, 172, 45, 0.97)",
                  "value": null
                },
                {
                  "color": "rgba(237, 129, 40, 0.89)",
                  "value": 80
                },
                {
                  "color": "rgba(245, 54, 54, 0.9)",
                  "value": 90
                }
              ]
            },
            "unit": "percent"
          },
          "overrides": [],
          "values": false
        },
        "orientation": "horizontal",
        "showThresholdLabels": false,
        "showThresholdMarkers": true
      },
      "pluginVersion": "6.7.4",
      "targets": [
        {
          "expr": "100 - ((node_filesystem_avail_bytes{instance=\"\$node\",job=\"\$job\",mountpoint=\"/\",fstype!=\"rootfs\"} * 100) / node_filesystem_size_bytes{instance=\"\$node\",job=\"\$job\",mountpoint=\"/\",fstype!=\"rootfs\"})",
          "format": "time_series",
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "title": "Root FS Used",
      "type": "gauge"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "description": "Total number of CPU cores",
      "format": "short",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 18,
        "y": 1
      },
      "id": 14,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "maxPerRow": 6,
      "nullPointMode": "null",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "count(count(node_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}) by (cpu))",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A",
          "step": 900
        }
      ],
      "thresholds": "",
      "title": "CPU Cores",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "decimals": 1,
      "description": "System uptime",
      "format": "s",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 4,
        "x": 20,
        "y": 1
      },
      "hideTimeOverride": true,
      "id": 15,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "nullPointMode": "null",
      "nullText": null,
      "postfix": "s",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "node_time_seconds{instance=\"\$node\",job=\"\$job\"} - node_boot_time_seconds{instance=\"\$node\",job=\"\$job\"}",
          "intervalFactor": 2,
          "refId": "A",
          "step": 1800
        }
      ],
      "thresholds": "",
      "title": "Uptime",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(50, 172, 45, 0.97)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(245, 54, 54, 0.9)"
      ],
      "datasource": "Prometheus",
      "decimals": 0,
      "description": "Total RootFS",
      "format": "bytes",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 18,
        "y": 3
      },
      "id": 23,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "maxPerRow": 6,
      "nullPointMode": "null",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "50%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "node_filesystem_size_bytes{instance=\"\$node\",job=\"\$job\",mountpoint=\"/\",fstype!=\"rootfs\"}",
          "format": "time_series",
          "hide": false,
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "thresholds": "70,90",
      "title": "RootFS Total",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "decimals": 0,
      "description": "Total RAM",
      "format": "bytes",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 20,
        "y": 3
      },
      "id": 75,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "maxPerRow": 6,
      "nullPointMode": "null",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "70%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"}",
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "thresholds": "",
      "title": "RAM Total",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "cacheTimeout": null,
      "colorBackground": false,
      "colorValue": false,
      "colors": [
        "rgba(245, 54, 54, 0.9)",
        "rgba(237, 129, 40, 0.89)",
        "rgba(50, 172, 45, 0.97)"
      ],
      "datasource": "Prometheus",
      "decimals": 0,
      "description": "Total SWAP",
      "format": "bytes",
      "gauge": {
        "maxValue": 100,
        "minValue": 0,
        "show": false,
        "thresholdLabels": false,
        "thresholdMarkers": true
      },
      "gridPos": {
        "h": 2,
        "w": 2,
        "x": 22,
        "y": 3
      },
      "id": 18,
      "interval": null,
      "links": [],
      "mappingType": 1,
      "mappingTypes": [
        {
          "name": "value to text",
          "value": 1
        },
        {
          "name": "range to text",
          "value": 2
        }
      ],
      "maxDataPoints": 100,
      "maxPerRow": 6,
      "nullPointMode": "null",
      "nullText": null,
      "postfix": "",
      "postfixFontSize": "70%",
      "prefix": "",
      "prefixFontSize": "50%",
      "rangeMaps": [
        {
          "from": "null",
          "text": "N/A",
          "to": "null"
        }
      ],
      "sparkline": {
        "fillColor": "rgba(31, 118, 189, 0.18)",
        "full": false,
        "lineColor": "rgb(31, 120, 193)",
        "show": false
      },
      "tableColumn": "",
      "targets": [
        {
          "expr": "node_memory_SwapTotal_bytes{instance=\"\$node\",job=\"\$job\"}",
          "intervalFactor": 1,
          "refId": "A",
          "step": 900
        }
      ],
      "thresholds": "",
      "title": "SWAP Total",
      "type": "singlestat",
      "valueFontSize": "50%",
      "valueMaps": [
        {
          "op": "=",
          "text": "N/A",
          "value": "null"
        }
      ],
      "valueName": "current"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 5
      },
      "id": 263,
      "panels": [
        {
          "aliasColors": {
            "Busy": "#EAB839",
            "Busy Iowait": "#890F02",
            "Busy other": "#1F78C1",
            "Idle": "#052B51",
            "Idle - Waiting for something to happen": "#052B51",
            "guest": "#9AC48A",
            "idle": "#052B51",
            "iowait": "#EAB839",
            "irq": "#BF1B00",
            "nice": "#C15C17",
            "softirq": "#E24D42",
            "steal": "#FCE2DE",
            "system": "#508642",
            "user": "#5195CE"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "description": "Basic CPU info",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 6
          },
          "hiddenSeries": false,
          "id": 77,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sideWidth": 250,
            "sort": null,
            "sortDesc": null,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": true,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "Busy Iowait",
              "color": "#890F02"
            },
            {
              "alias": "Idle",
              "color": "#7EB26D"
            },
            {
              "alias": "Busy System",
              "color": "#EAB839"
            },
            {
              "alias": "Busy User",
              "color": "#0A437C"
            },
            {
              "alias": "Busy Other",
              "color": "#6D1F62"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "sum by (instance)(irate(node_cpu_seconds_total{mode=\"system\",instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Busy System",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "sum by (instance)(irate(node_cpu_seconds_total{mode='user',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Busy User",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "sum by (instance)(irate(node_cpu_seconds_total{mode='iowait',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Busy Iowait",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "sum by (instance)(irate(node_cpu_seconds_total{mode=~\".*irq\",instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Busy IRQs",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "sum (irate(node_cpu_seconds_total{mode!='idle',mode!='user',mode!='system',mode!='iowait',mode!='irq',mode!='softirq',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Busy Other",
              "refId": "E",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='idle',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Idle",
              "refId": "F",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "CPU Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "SWAP Used": "#BF1B00",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap Used": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "description": "Basic memory usage",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 6
          },
          "hiddenSeries": false,
          "id": 78,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "RAM Total",
              "color": "#E0F9D7",
              "fill": 0,
              "stack": false
            },
            {
              "alias": "RAM Cache + Buffer",
              "color": "#052B51"
            },
            {
              "alias": "RAM Free",
              "color": "#7EB26D"
            },
            {
              "alias": "Avaliable",
              "color": "#DEDAF7",
              "fill": 0,
              "stack": false
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "RAM Total",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_MemFree_bytes{instance=\"\$node\",job=\"\$job\"} - (node_memory_Cached_bytes{instance=\"\$node\",job=\"\$job\"} + node_memory_Buffers_bytes{instance=\"\$node\",job=\"\$job\"})",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "RAM Used",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_Cached_bytes{instance=\"\$node\",job=\"\$job\"} + node_memory_Buffers_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "RAM Cache + Buffer",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_memory_MemFree_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "RAM Free",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "(node_memory_SwapTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_SwapFree_bytes{instance=\"\$node\",job=\"\$job\"})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "SWAP Used",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Recv_bytes_eth2": "#7EB26D",
            "Recv_bytes_lo": "#0A50A1",
            "Recv_drop_eth2": "#6ED0E0",
            "Recv_drop_lo": "#E0F9D7",
            "Recv_errs_eth2": "#BF1B00",
            "Recv_errs_lo": "#CCA300",
            "Trans_bytes_eth2": "#7EB26D",
            "Trans_bytes_lo": "#0A50A1",
            "Trans_drop_eth2": "#6ED0E0",
            "Trans_drop_lo": "#E0F9D7",
            "Trans_errs_eth2": "#BF1B00",
            "Trans_errs_lo": "#CCA300",
            "recv_bytes_lo": "#0A50A1",
            "recv_drop_eth0": "#99440A",
            "recv_drop_lo": "#967302",
            "recv_errs_eth0": "#BF1B00",
            "recv_errs_lo": "#890F02",
            "trans_bytes_eth0": "#7EB26D",
            "trans_bytes_lo": "#0A50A1",
            "trans_drop_eth0": "#99440A",
            "trans_drop_lo": "#967302",
            "trans_errs_eth0": "#BF1B00",
            "trans_errs_lo": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Basic network info per interface",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 13
          },
          "hiddenSeries": false,
          "id": 74,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "hideEmpty": false,
            "hideZero": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])*8",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "recv {{device}}",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "irate(node_network_transmit_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])*8",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "trans {{device}} ",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bps",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "pps",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 3,
          "description": "Disk space used of all filesystems mounted",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 13
          },
          "height": "",
          "hiddenSeries": false,
          "id": 152,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": false,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "100 - ((node_filesystem_avail_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'} * 100) / node_filesystem_size_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'})",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk Space Used Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "percent",
              "label": null,
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Basic CPU / Mem / Net / Disk",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 6
      },
      "id": 265,
      "panels": [
        {
          "aliasColors": {
            "Idle - Waiting for something to happen": "#052B51",
            "guest": "#9AC48A",
            "idle": "#052B51",
            "iowait": "#EAB839",
            "irq": "#BF1B00",
            "nice": "#C15C17",
            "softirq": "#E24D42",
            "steal": "#FCE2DE",
            "system": "#508642",
            "user": "#5195CE"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "description": "",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 3,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 250,
            "sort": null,
            "sortDesc": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": true,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode=\"system\",instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "interval": "10s",
              "intervalFactor": 2,
              "legendFormat": "System - Processes executing in kernel mode",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='user',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "User - Normal processes executing in user mode",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='nice',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Nice - Niced processes executing in user mode",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='idle',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Idle - Waiting for something to happen",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='iowait',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Iowait - Waiting for I/O to complete",
              "refId": "E",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='irq',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Irq - Servicing interrupts",
              "refId": "F",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='softirq',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Softirq - Servicing softirqs",
              "refId": "G",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='steal',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Steal - Time spent in other operating systems when running in a virtualized environment",
              "refId": "H",
              "step": 240
            },
            {
              "expr": "sum by (mode)(irate(node_cpu_seconds_total{mode='guest',instance=\"\$node\",job=\"\$job\"}[5m])) * 100",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Guest - Time spent running a virtual CPU for a guest operating system",
              "refId": "I",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "CPU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "percentage",
              "logBase": 1,
              "max": "100",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap - Swap memory usage": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839",
            "Unused - Free memory unassigned": "#052B51"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "description": "",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 24,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "sort": null,
            "sortDesc": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Hardware Corrupted - *./",
              "stack": false
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_MemFree_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_Buffers_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_Cached_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_Slab_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_PageTables_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_SwapCached_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Apps - Memory used by user-space applications",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_memory_PageTables_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "PageTables - Memory used to map between virtual and physical memory addresses",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_memory_SwapCached_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "SwapCache - Memory that keeps track of pages that have been fetched from swap but not yet been modified",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_memory_Slab_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Slab - Memory used by the kernel to cache data structures for its own use (caches like inode, dentry, etc)",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_memory_Cached_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Cache - Parked file data (file content) cache",
              "refId": "E",
              "step": 240
            },
            {
              "expr": "node_memory_Buffers_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Buffers - Block device (e.g. harddisk) cache",
              "refId": "F",
              "step": 240
            },
            {
              "expr": "node_memory_MemFree_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Unused - Free memory unassigned",
              "refId": "G",
              "step": 240
            },
            {
              "expr": "(node_memory_SwapTotal_bytes{instance=\"\$node\",job=\"\$job\"} - node_memory_SwapFree_bytes{instance=\"\$node\",job=\"\$job\"})",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Swap - Swap space used",
              "refId": "H",
              "step": 240
            },
            {
              "expr": "node_memory_HardwareCorrupted_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working",
              "refId": "I",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Stack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "receive_packets_eth0": "#7EB26D",
            "receive_packets_lo": "#E24D42",
            "transmit_packets_eth0": "#7EB26D",
            "transmit_packets_lo": "#E24D42"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 19
          },
          "hiddenSeries": false,
          "id": 84,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])*8",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "irate(node_network_transmit_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])*8",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bps",
              "label": "bits out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 3,
          "description": "",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 19
          },
          "height": "",
          "hiddenSeries": false,
          "id": 156,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": false,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_size_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'} - node_filesystem_avail_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk Space Used",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 229,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_reads_completed_total{instance=\"\$node\",job=\"\$job\",device=~\"\$diskdevices\"}[5m])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - Reads completed",
              "refId": "A",
              "step": 480
            },
            {
              "expr": "irate(node_disk_writes_completed_total{instance=\"\$node\",job=\"\$job\",device=~\"\$diskdevices\"}[5m])",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Writes completed",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk IOps",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "IO read (-) / write (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "io time": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 3,
          "description": "",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 12,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 42,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": null,
            "sortDesc": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read*./",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde.*/",
              "color": "#E24D42"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_read_bytes_total{instance=\"\$node\",job=\"\$job\",device=~\"\$diskdevices\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Successfully read bytes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "irate(node_disk_written_bytes_total{instance=\"\$node\",job=\"\$job\",device=~\"\$diskdevices\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Successfully written bytes",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "I/O Usage Read / Write",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": false,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes read (-) / write (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "ms",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "io time": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 3,
          "description": "",
          "fill": 4,
          "fillGradient": 0,
          "gridPos": {
            "h": 12,
            "w": 12,
            "x": 0,
            "y": 43
          },
          "hiddenSeries": false,
          "id": 127,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": null,
            "sortDesc": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_time_seconds_total{instance=\"\$node\",job=\"\$job\",device=~\"\$diskdevices\"} [5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Time spent doing I/Os",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "I/O Usage Times",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": false,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "time",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "s",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "CPU / Memory / Net / Disk",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 7
      },
      "id": 266,
      "panels": [
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 136,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Inactive_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Inactive - Memory which has been less recently used.  It is more eligible to be reclaimed for other purposes",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Active_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Active - Memory that has been used more recently and usually not reclaimed unless absolutely necessary",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Active / Inactive",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 8
          },
          "hiddenSeries": false,
          "id": 135,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Committed_AS - *./"
            },
            {
              "alias": "/.*CommitLimit - *./",
              "color": "#BF1B00",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Committed_AS_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Committed_AS - Amount of memory presently allocated on the system",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_CommitLimit_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "CommitLimit - Amount of  memory currently available to be allocated on the system",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Commited",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 18
          },
          "hiddenSeries": false,
          "id": 191,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Inactive_file_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Inactive_file - File-backed memory on inactive LRU list",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Inactive_anon_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Inactive_anon - Anonymous and swap cache on inactive LRU list, including tmpfs (shmem)",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_Active_file_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Active_file - File-backed memory on active LRU list",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "node_memory_Active_anon_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Active_anon - Anonymous and swap cache on active least-recently-used (LRU) list, including tmpfs",
              "refId": "D",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Active / Inactive Detail",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "bytes",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 18
          },
          "hiddenSeries": false,
          "id": 130,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Writeback_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Writeback - Memory which is actively being written back to disk",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_WritebackTmp_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "WritebackTmp - Memory used by FUSE for temporary writeback buffers",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_Dirty_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Dirty - Memory which is waiting to get written back to the disk",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Writeback and Dirty",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 138,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "fill": 0
            },
            {
              "alias": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Mapped_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Mapped - Used memory in mapped pages files which have been mmaped, such as libraries",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Shmem_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Shmem - Used shared memory (shared between several processes, thus including RAM disks)",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_ShmemHugePages_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "ShmemHugePages - Memory used by shared memory (shmem) and tmpfs allocated  with huge pages",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "node_memory_ShmemPmdMapped_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "ShmemPmdMapped - Ammount of shared (shmem/tmpfs) memory backed by huge pages",
              "refId": "D",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Shared and Mapped",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 131,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_SUnreclaim_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "SUnreclaim - Part of Slab, that cannot be reclaimed on memory pressure",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_SReclaimable_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "SReclaimable - Part of Slab, that might be reclaimed, such as caches",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Slab",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 38
          },
          "hiddenSeries": false,
          "id": 70,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_VmallocChunk_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocChunk - Largest contigious block of vmalloc area which is free",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_VmallocTotal_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocTotal - Total size of vmalloc memory area",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_VmallocUsed_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocUsed - Amount of vmalloc area which is used",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Vmalloc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 38
          },
          "hiddenSeries": false,
          "id": 159,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Bounce_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Bounce - Memory used for block device bounce buffers",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Bounce",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 48
          },
          "hiddenSeries": false,
          "id": 129,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Inactive *./",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_AnonHugePages_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "AnonHugePages - Memory in anonymous huge pages",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_AnonPages_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "AnonPages - Memory in user pages not backed by files",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Anonymous",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 48
          },
          "hiddenSeries": false,
          "id": 160,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_KernelStack_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "KernelStack - Kernel memory stack. This is not reclaimable",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Percpu_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "PerCPU - Per CPU memory allocated dynamically by loadable modules",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Kernel / CPU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#806EB7",
            "Total RAM + Swap": "#806EB7",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 58
          },
          "hiddenSeries": false,
          "id": 140,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_HugePages_Free{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "HugePages_Free - Huge pages in the pool that are not yet allocated",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_HugePages_Rsvd{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "HugePages_Rsvd - Huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_HugePages_Surp{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "HugePages_Surp - Huge pages in the pool above the value in /proc/sys/vm/nr_hugepages",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory HugePages Counter",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#806EB7",
            "Total RAM + Swap": "#806EB7",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 58
          },
          "hiddenSeries": false,
          "id": 71,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 2,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_HugePages_Total{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "HugePages - Total size of the pool of huge pages",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Hugepagesize_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Hugepagesize - Huge Page size",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory HugePages Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 68
          },
          "hiddenSeries": false,
          "id": 128,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": false,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_DirectMap1G_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "DirectMap1G - Amount of pages mapped as this size",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_DirectMap2M_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "DirectMap2M - Amount of pages mapped as this size",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_DirectMap4k_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "DirectMap4K - Amount of pages mapped as this size",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory DirectMap",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 68
          },
          "hiddenSeries": false,
          "id": 137,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Unevictable_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Unevictable - Amount of unevictable memory that can't be swapped out for a variety of reasons",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Mlocked_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "MLocked - Size of pages locked to memory using the mlock() system call",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Unevictable and MLocked",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 78
          },
          "hiddenSeries": false,
          "id": 132,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_NFS_Unstable_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "NFS Unstable - Memory in NFS pages sent to the server, but not yet commited to the storage",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory NFS",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Memory Meminfo",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 8
      },
      "id": 267,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 9
          },
          "hiddenSeries": false,
          "id": 176,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*out/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_vmstat_pgpgin{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pagesin - Page in operations",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_vmstat_pgpgout{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pagesout - Page out operations",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Pages In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 9
          },
          "hiddenSeries": false,
          "id": 22,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*out/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_vmstat_pswpin{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pswpin - Pages swapped in",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_vmstat_pswpout{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pswpout - Pages swapped out",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Pages Swap In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "pages out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Hardware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
            "Inactive": "#584477",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "RAM_Free": "#E0F9D7",
            "Slab": "#806EB7",
            "Slab_Cache": "#E0752D",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Swap_Free": "#2F575E",
            "Unused": "#EAB839"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 19
          },
          "hiddenSeries": false,
          "id": 175,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 350,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "Pgfault - Page major and minor fault operations",
              "fill": 0,
              "stack": false
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_vmstat_pgfault{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pgfault - Page major and minor fault operations",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_vmstat_pgmajfault{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pgmajfault - Major page fault operations",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_vmstat_pgfault{instance=\"\$node\",job=\"\$job\"}[5m])  - irate(node_vmstat_pgmajfault{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Pgminfault - Minor page fault operations",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Memory Page Faults",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "faults",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "Active": "#99440A",
            "Buffers": "#58140C",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Dirty": "#6ED0E0",
            "Free": "#B7DBAB",
            "Inactive": "#EA6460",
            "Mapped": "#052B51",
            "PageTables": "#0A50A1",
            "Page_Tables": "#0A50A1",
            "Slab_Cache": "#EAB839",
            "Swap": "#BF1B00",
            "Swap_Cache": "#C15C17",
            "Total": "#511749",
            "Total RAM": "#052B51",
            "Total RAM + Swap": "#052B51",
            "Total Swap": "#614D93",
            "VmallocUsed": "#EA6460"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 2,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 19
          },
          "hiddenSeries": false,
          "id": 307,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": null,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_vmstat_oom_kill{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "oom killer invocations ",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "OOM Killer",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Memory Vmstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 9
      },
      "id": 293,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 260,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Variation*./",
              "color": "#890F02"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_estimated_error_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Estimated error in seconds",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_offset_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Time offset in between local system and reference clock",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_timex_maxerror_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Maximum error in seconds",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Time Syncronized Drift",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 291,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_loop_time_constant{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Phase-locked loop time adjust",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Time PLL Adjust",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 20
          },
          "hiddenSeries": false,
          "id": 168,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Variation*./",
              "color": "#890F02"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_sync_status{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Is clock synchronized to a reliable server (1 = yes, 0 = no)",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_frequency_adjustment_ratio{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Local clock frequency adjustment",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Time Syncronized Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 20
          },
          "hiddenSeries": false,
          "id": 294,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_timex_tick_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Seconds between clock ticks",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_timex_tai_offset_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "International Atomic Time (TAI) offset",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Time Misc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "title": "System Timesync",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "id": 312,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 62,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_procs_blocked{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Processes blocked waiting for I/O to complete",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_procs_running{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Processes in runnable state",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Processes Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Requires --collector.processes",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 11
          },
          "hiddenSeries": false,
          "id": 315,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_state{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ state }}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Processes State",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 21
          },
          "hiddenSeries": false,
          "id": 148,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_forks_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Processes forks second",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Processes  Forks",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "forks / sec",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 21
          },
          "hiddenSeries": false,
          "id": 149,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Max.*/",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(process_virtual_memory_bytes{instance=\"\$node\",job=\"\$job\"}[5m])",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Processes virtual memory size in bytes",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "process_resident_memory_max_bytes{instance=\"\$node\",job=\"\$job\"}",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Maximum amount of virtual memory available in bytes",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "irate(process_virtual_memory_bytes{instance=\"\$node\",job=\"\$job\"}[5m])",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Processes virtual memory size in bytes",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "irate(process_virtual_memory_max_bytes{instance=\"\$node\",job=\"\$job\"}[5m])",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Maximum amount of virtual memory available in bytes",
              "refId": "D",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Processes Memory",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "decbytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Requires --collector.processes",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 313,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "PIDs limit",
              "color": "#F2495C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_pids{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Number of PIDs",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_processes_max_processes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "PIDs limit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "PIDs Number and Limit",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 31
          },
          "hiddenSeries": false,
          "id": 305,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*waiting.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_schedstat_running_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{ cpu }} - seconds spent running a process",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "irate(node_schedstat_waiting_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{ cpu }} - seconds spent by processing waiting for this CPU",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Process schdeule stats Running / Waiting",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 41
          },
          "hiddenSeries": false,
          "id": 314,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "Threads limit",
              "color": "#F2495C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_processes_threads{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Allocated threads",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_processes_max_threads{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Threads limit",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Threads Number and Limit",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "title": "System Processes",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 11
      },
      "id": 269,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 52
          },
          "hiddenSeries": false,
          "id": 8,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_context_switches_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Context switches",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "irate(node_intr_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Interrupts",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Context Switches / Interrupts",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 52
          },
          "hiddenSeries": false,
          "id": 7,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_load1{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 1m",
              "refId": "A",
              "step": 480
            },
            {
              "expr": "node_load5{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 5m",
              "refId": "B",
              "step": 480
            },
            {
              "expr": "node_load15{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Load 15m",
              "refId": "C",
              "step": 480
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "System Load",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Requires --collector.interrupts",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 62
          },
          "hiddenSeries": false,
          "id": 259,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Critical*./",
              "color": "#E24D42",
              "fill": 0
            },
            {
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_interrupts_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ type }} - {{ info }}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Interrupts Detail",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 62
          },
          "hiddenSeries": false,
          "id": 306,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_schedstat_timeslices_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{ cpu }}",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Schedule timeslices executed by each cpu",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 72
          },
          "hiddenSeries": false,
          "id": 151,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_entropy_available_bits{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Entropy available to random number generators",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Entropy",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 72
          },
          "hiddenSeries": false,
          "id": 308,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(process_cpu_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Time spent",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "CPU time spent in user and system contexts",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 82
          },
          "hiddenSeries": false,
          "id": 64,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Max*./",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "process_max_fds{instance=\"\$node\",job=\"\$job\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Maximum open file descriptors",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "process_open_fds{instance=\"\$node\",job=\"\$job\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Open file descriptors",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "File Descriptors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "System Misc",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 12
      },
      "id": 304,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 13
          },
          "hiddenSeries": false,
          "id": 158,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Critical*./",
              "color": "#E24D42",
              "fill": 0
            },
            {
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_hwmon_temp_celsius{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ chip }} {{ sensor }} temp",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_alarm_celsius{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ chip }} {{ sensor }} Critical Alarm",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_celsius{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ chip }} {{ sensor }} Critical",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_crit_hyst_celsius{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ chip }} {{ sensor }} Critical Historical",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_hwmon_temp_max_celsius{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ chip }} {{ sensor }} Max",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Hardware temperature monitor",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "celsius",
              "label": "temperature",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Requires --collector.thermal_zone",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 13
          },
          "hiddenSeries": false,
          "id": 300,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Max*./",
              "color": "#EF843C",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_cooling_device_cur_state{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Current {{ name }} in {{ type }}",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_cooling_device_max_state{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Max {{ name }} in {{ type }}",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Throttle cooling device",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "Requires --collector.powersupplyclass",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 23
          },
          "hiddenSeries": false,
          "id": 302,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_power_supply_online{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ power_supply }} online",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Power supply",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "title": "Hardware Misc",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 13
      },
      "id": 296,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 14
          },
          "hiddenSeries": false,
          "id": 297,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_systemd_socket_accepted_connections_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{ name }} Connections",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Systemd Sockets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 14
          },
          "hiddenSeries": false,
          "id": 298,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "Failed",
              "color": "#F2495C"
            },
            {
              "alias": "Inactive",
              "color": "#FF9830"
            },
            {
              "alias": "Active",
              "color": "#73BF69"
            },
            {
              "alias": "Deactivating",
              "color": "#FFCB7D"
            },
            {
              "alias": "Activating",
              "color": "#C8F2C2"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_systemd_units{instance=\"\$node\",job=\"\$job\",state=\"activating\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Activating",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"\$node\",job=\"\$job\",state=\"active\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Active",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"\$node\",job=\"\$job\",state=\"deactivating\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Deactivating",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"\$node\",job=\"\$job\",state=\"failed\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Failed",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_systemd_units{instance=\"\$node\",job=\"\$job\",state=\"inactive\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Inactive",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Systemd Units State",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "title": "Systemd",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 14
      },
      "id": 270,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 15
          },
          "hiddenSeries": false,
          "id": 9,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_reads_completed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - Reads completed",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "irate(node_disk_writes_completed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Writes completed",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk IOps Completed",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "IO read (-) / write (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 15
          },
          "hiddenSeries": false,
          "id": 33,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_read_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - Read bytes",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "irate(node_disk_written_bytes_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Written bytes",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk R/W Data",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "Bps",
              "label": "bytes read (-) / write (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 3,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 25
          },
          "hiddenSeries": false,
          "id": 37,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_read_time_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "hide": false,
              "intervalFactor": 4,
              "legendFormat": "{{device}} - Read time",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "irate(node_disk_write_time_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Write time",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk R/W Time",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "time. read (-) / write (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 25
          },
          "hiddenSeries": false,
          "id": 35,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_time_weighted_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - IO time weighted",
              "refId": "A",
              "step": 8
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk IOs Weighted",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "time",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 133,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_reads_merged_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Read merged",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_disk_writes_merged_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Write merged",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk R/W Merged",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "I/Os",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 3,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 35
          },
          "hiddenSeries": false,
          "id": 36,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_time_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - IO time",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "irate(node_disk_discard_time_seconds_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - discard time",
              "refId": "B",
              "step": 8
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Time Spent Doing I/Os",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "time",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 45
          },
          "hiddenSeries": false,
          "id": 34,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_now{instance=\"\$node\",job=\"\$job\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - IO now",
              "refId": "A",
              "step": 8
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk IOs Current in Progress",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "I/Os",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 45
          },
          "hiddenSeries": false,
          "id": 301,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null as zero",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*sda_.*/",
              "color": "#7EB26D"
            },
            {
              "alias": "/.*sdb_.*/",
              "color": "#EAB839"
            },
            {
              "alias": "/.*sdc_.*/",
              "color": "#6ED0E0"
            },
            {
              "alias": "/.*sdd_.*/",
              "color": "#EF843C"
            },
            {
              "alias": "/.*sde_.*/",
              "color": "#E24D42"
            },
            {
              "alias": "/.*sda1.*/",
              "color": "#584477"
            },
            {
              "alias": "/.*sda2_.*/",
              "color": "#BA43A9"
            },
            {
              "alias": "/.*sda3_.*/",
              "color": "#F4D598"
            },
            {
              "alias": "/.*sdb1.*/",
              "color": "#0A50A1"
            },
            {
              "alias": "/.*sdb2.*/",
              "color": "#BF1B00"
            },
            {
              "alias": "/.*sdb3.*/",
              "color": "#E0752D"
            },
            {
              "alias": "/.*sdc1.*/",
              "color": "#962D82"
            },
            {
              "alias": "/.*sdc2.*/",
              "color": "#614D93"
            },
            {
              "alias": "/.*sdc3.*/",
              "color": "#9AC48A"
            },
            {
              "alias": "/.*sdd1.*/",
              "color": "#65C5DB"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#F9934E"
            },
            {
              "alias": "/.*sdd3.*/",
              "color": "#EA6460"
            },
            {
              "alias": "/.*sde1.*/",
              "color": "#E0F9D7"
            },
            {
              "alias": "/.*sdd2.*/",
              "color": "#FCEACA"
            },
            {
              "alias": "/.*sde3.*/",
              "color": "#F9E2D2"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_discards_completed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "intervalFactor": 4,
              "legendFormat": "{{device}} - Discards completed",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "irate(node_disk_discards_merged_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Discards merged",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Disk IOps Discards completed / merged",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "IOs",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Storage Disk",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 15
      },
      "id": 271,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": 3,
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 16
          },
          "hiddenSeries": false,
          "id": 43,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_avail_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - Available",
              "metric": "",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_filesystem_free_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - Free",
              "refId": "B",
              "step": 2
            },
            {
              "expr": "node_filesystem_size_bytes{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - Size",
              "refId": "C",
              "step": 2
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Filesystem space available",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 16
          },
          "hiddenSeries": false,
          "id": 41,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_files_free{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - Free file nodes",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "File Nodes Free",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "file nodes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 26
          },
          "hiddenSeries": false,
          "id": 28,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filefd_maximum{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 4,
              "legendFormat": "Max open files",
              "refId": "A",
              "step": 8
            },
            {
              "expr": "node_filefd_allocated{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "Open files",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "File Descriptor",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "files",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 26
          },
          "hiddenSeries": false,
          "id": 219,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_files{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - File nodes total",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "File Nodes Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "file Nodes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {
            "/ ReadOnly": "#890F02"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": null,
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 36
          },
          "hiddenSeries": false,
          "id": 44,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_readonly{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - ReadOnly",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_filesystem_device_error{instance=\"\$node\",job=\"\$job\",device!~'rootfs'}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} - Device error",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Filesystem in ReadOnly / Error",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": "1",
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Storage Filesystem",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 16
      },
      "id": 272,
      "panels": [
        {
          "aliasColors": {
            "receive_packets_eth0": "#7EB26D",
            "receive_packets_lo": "#E24D42",
            "transmit_packets_eth0": "#7EB26D",
            "transmit_packets_lo": "#E24D42"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 17
          },
          "hiddenSeries": false,
          "id": 60,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_packets_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_packets_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic by Packets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 17
          },
          "hiddenSeries": false,
          "id": 142,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_errs_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive errors",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_errs_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Rransmit errors",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 143,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_drop_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive drop",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_drop_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit drop",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Drop",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 27
          },
          "hiddenSeries": false,
          "id": 141,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_compressed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive compressed",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_compressed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit compressed",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Compressed",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 37
          },
          "hiddenSeries": false,
          "id": 146,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_multicast_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive multicast",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Multicast",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 37
          },
          "hiddenSeries": false,
          "id": 144,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_fifo_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive fifo",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_fifo_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit fifo",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Fifo",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 47
          },
          "hiddenSeries": false,
          "id": 145,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_frame_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Receive frame",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Frame",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": "packets out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 47
          },
          "hiddenSeries": false,
          "id": 231,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_transmit_carrier_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Statistic transmit_carrier",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Carrier",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 57
          },
          "hiddenSeries": false,
          "id": 232,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Trans.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_transmit_colls_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{device}} - Transmit colls",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Traffic Colls",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 57
          },
          "hiddenSeries": false,
          "id": 61,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "NF conntrack limit",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_nf_conntrack_entries{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "NF conntrack entries",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_nf_conntrack_entries_limit{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "NF conntrack limit",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "NF Contrack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "entries",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 67
          },
          "hiddenSeries": false,
          "id": 230,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_arp_entries{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{ device }} - ARP entries",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "ARP Entries",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "Entries",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 67
          },
          "hiddenSeries": false,
          "id": 288,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_mtu_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{ device }} - Bytes",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "MTU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 77
          },
          "hiddenSeries": false,
          "id": 280,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_speed_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{ device }} - Speed",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Speed",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 77
          },
          "hiddenSeries": false,
          "id": 289,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 1,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_transmit_queue_length{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{ device }} -   Interface transmit queue length",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Queue Length",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "decimals": 0,
              "format": "none",
              "label": "packets",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 87
          },
          "hiddenSeries": false,
          "id": 290,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Dropped.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_softnet_processed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{cpu}} - Processed",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_softnet_dropped_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{cpu}} - Dropped",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Softnet Packets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "packetes drop (-) / process (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 87
          },
          "hiddenSeries": false,
          "id": 310,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_softnet_times_squeezed_total{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CPU {{cpu}} - Squeezed",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Softnet Out of Quota",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 97
          },
          "hiddenSeries": false,
          "id": 309,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_network_up{operstate=\"up\",instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "{{interface}} - Operational state UP",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_network_carrier{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "instant": false,
              "legendFormat": "{{device}} - Physical link state",
              "refId": "B"
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Network Operational Status",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Network Traffic",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 17
      },
      "id": 273,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 108
          },
          "hiddenSeries": false,
          "id": 63,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_TCP_alloc{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCP_alloc - Allocated sockets",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_inuse{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCP_inuse - Tcp sockets currently in use",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_mem{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCP_mem - Used memory for tcp",
              "refId": "C",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_orphan{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCP_orphan - Orphan sockets",
              "refId": "D",
              "step": 240
            },
            {
              "expr": "node_sockstat_TCP_tw{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCP_tw - Sockets wating close",
              "refId": "E",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Sockstat TCP",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 108
          },
          "hiddenSeries": false,
          "id": 124,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_UDPLITE_inuse{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "UDPLITE_inuse - Udplite sockets currently in use",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_inuse{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "UDP_inuse - Udp sockets currently in use",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_mem{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "UDP_mem - Used memory for udp",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Sockstat UDP",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 118
          },
          "hiddenSeries": false,
          "id": 126,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_sockets_used{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Sockets_used - Sockets currently in use",
              "refId": "A",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Sockstat Used",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "sockets",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 118
          },
          "hiddenSeries": false,
          "id": 220,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_TCP_mem_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "mem_bytes - TCP sockets in that state",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_UDP_mem_bytes{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "mem_bytes - UDP sockets in that state",
              "refId": "B",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Sockstat Memory Size",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "bytes",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 128
          },
          "hiddenSeries": false,
          "id": 125,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_FRAG_inuse{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "FRAG_inuse - Frag sockets currently in use",
              "refId": "A",
              "step": 240
            },
            {
              "expr": "node_sockstat_FRAG_memory{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "FRAG_memory - Used memory for frag",
              "refId": "B",
              "step": 240
            },
            {
              "expr": "node_sockstat_RAW_inuse{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "RAW_inuse - Raw sockets currently in use",
              "refId": "C",
              "step": 240
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Sockstat FRAG / RAW",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Network Sockstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 18
      },
      "id": 274,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 19
          },
          "height": "",
          "hiddenSeries": false,
          "id": 221,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_IpExt_InOctets{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InOctets - Received octets",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutOctets{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "intervalFactor": 2,
              "legendFormat": "OutOctets - Sent octets",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Netstat IP In / Out Octets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "octects out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 19
          },
          "height": "",
          "hiddenSeries": false,
          "id": 81,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sideWidth": 300,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Ip_Forwarding{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Forwarding - IP forwarding",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Netstat IP Forwarding",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": null,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 29
          },
          "height": "",
          "hiddenSeries": false,
          "id": 115,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Icmp_InMsgs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InMsgs -  Messages which the entity received. Note that this counter includes all those counted by icmpInErrors",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Icmp_OutMsgs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "OutMsgs - Messages which this entity attempted to send. Note that this counter includes all those counted by icmpOutErrors",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "ICMP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "messages out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": null,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 29
          },
          "height": "",
          "hiddenSeries": false,
          "id": 50,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Icmp_InErrors{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InErrors - Messages which the entity received but determined as having ICMP-specific errors (bad ICMP checksums, bad length, etc.)",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "ICMP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "messages out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": null,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 39
          },
          "height": "",
          "hiddenSeries": false,
          "id": 55,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*Snd.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Udp_InDatagrams{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InDatagrams - Datagrams received",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Udp_OutDatagrams{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "OutDatagrams - Datagrams sent",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "UDP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 39
          },
          "height": "",
          "hiddenSeries": false,
          "id": 109,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Udp_InErrors{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InErrors - UDP Datagrams that could not be delivered to an application",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Udp_NoPorts{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "NoPorts - UDP Datagrams received on a port with no listener",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_UdpLite_InErrors{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "legendFormat": "InErrors Lite - UDPLite Datagrams that could not be delivered to an application",
              "refId": "C"
            },
            {
              "expr": "irate(node_netstat_Udp_RcvbufErrors{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "RcvbufErrors - UDP buffer errors received",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Udp_SndbufErrors{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "SndbufErrors - UDP buffer errors send",
              "refId": "E",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "UDP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "decimals": null,
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 49
          },
          "height": "",
          "hiddenSeries": false,
          "id": 299,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Out.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*Snd.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Tcp_InSegs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "InSegs - Segments received, including those received in error. This count includes segments received on currently established connections",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Tcp_OutSegs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "OutSegs - Segments sent, including those on current connections but excluding those containing only retransmitted octets",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "TCP In / Out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "datagrams out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 49
          },
          "height": "",
          "hiddenSeries": false,
          "id": 104,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_TcpExt_ListenOverflows{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "ListenOverflows - Times the listen queue of a socket overflowed",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_TcpExt_ListenDrops{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "ListenDrops - SYNs to LISTEN sockets ignored",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSynRetrans{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "TCPSynRetrans - SYN-SYN/ACK retransmits to break down retransmissions in SYN, fast/timeout retransmits",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Tcp_RetransSegs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "legendFormat": "RetransSegs - Segments retransmitted - that is, the number of TCP segments transmitted containing one or more previously transmitted octets",
              "refId": "D"
            },
            {
              "expr": "irate(node_netstat_Tcp_InErrs{instance=\"\$node\",job=\"\$job\"}[5m])",
              "interval": "",
              "legendFormat": "InErrs - Segments received in error (e.g., bad TCP checksums)",
              "refId": "E"
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "TCP Errors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 59
          },
          "height": "",
          "hiddenSeries": false,
          "id": 85,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*MaxConn *./",
              "color": "#890F02",
              "fill": 0
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_netstat_Tcp_CurrEstab{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "CurrEstab - TCP connections for which the current state is either ESTABLISHED or CLOSE- WAIT",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_netstat_Tcp_MaxConn{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "MaxConn - Limit on the total number of TCP connections the entity can support (Dinamic is \"-1\")",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "TCP Connections",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "connections",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 59
          },
          "height": "",
          "hiddenSeries": false,
          "id": 91,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": false,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Sent.*/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesFailed{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "SyncookiesFailed - Invalid SYN cookies received",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesRecv{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "SyncookiesRecv - SYN cookies received",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesSent{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "SyncookiesSent - SYN cookies sent",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "TCP SynCookie",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "counter out (-) / in (+)",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 69
          },
          "height": "",
          "hiddenSeries": false,
          "id": 82,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideZero": false,
            "max": true,
            "min": true,
            "rightSide": false,
            "show": true,
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "maxPerRow": 12,
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Tcp_ActiveOpens{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "ActiveOpens - TCP connections that have made a direct transition to the SYN-SENT state from the CLOSED state",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Tcp_PassiveOpens{instance=\"\$node\",job=\"\$job\"}[5m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "PassiveOpens - TCP connections that have made a direct transition to the SYN-RCVD state from the LISTEN state",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "TCP Direct Transition",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "connections",
              "logBase": 1,
              "max": null,
              "min": "0",
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Network Netstat",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": "Prometheus",
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 19
      },
      "id": 279,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 20
          },
          "hiddenSeries": false,
          "id": 40,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_scrape_collector_duration_seconds{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{collector}} - Scrape duration",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Node Exporter Scrape Time",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "seconds",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": "Prometheus",
          "description": "",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 20
          },
          "hiddenSeries": false,
          "id": 157,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "options": {
            "dataLinks": []
          },
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "\$\$hashKey": "object:1085",
              "alias": "/.*error.*/",
              "color": "#F2495C",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_scrape_collector_success{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{collector}} - Scrape success",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_textfile_scrape_error{instance=\"\$node\",job=\"\$job\"}",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{collector}} - Scrape textfile error (1 = true)",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeRegions": [],
          "timeShift": null,
          "title": "Node Exporter Scrape",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "buckets": null,
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "\$\$hashKey": "object:1100",
              "format": "short",
              "label": "counter",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "\$\$hashKey": "object:1101",
              "format": "short",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ],
          "yaxis": {
            "align": false,
            "alignLevel": null
          }
        }
      ],
      "repeat": null,
      "title": "Node Exporter",
      "type": "row"
    }
  ],
  "refresh": "1m",
  "schemaVersion": 22,
  "style": "dark",
  "tags": [
    "linux"
  ],
  "templating": {
    "list": [
      {
        "current": {
          "selected": true,
          "text": "default",
          "value": "default"
        },
        "hide": 0,
        "includeAll": false,
        "label": "datasource",
        "multi": false,
        "name": "DS_PROMETHEUS",
        "options": [],
        "query": "prometheus",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "type": "datasource"
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "definition": "",
        "hide": 0,
        "includeAll": false,
        "index": -1,
        "label": "Job",
        "multi": false,
        "name": "job",
        "options": [],
        "query": "label_values(node_uname_info, job)",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {},
        "datasource": "Prometheus",
        "definition": "label_values(node_uname_info{job=\"\$job\"}, instance)",
        "hide": 0,
        "includeAll": false,
        "index": -1,
        "label": "Host:",
        "multi": false,
        "name": "node",
        "options": [],
        "query": "label_values(node_uname_info{job=\"\$job\"}, instance)",
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 1,
        "tagValuesQuery": "",
        "tags": [],
        "tagsQuery": "",
        "type": "query",
        "useTags": false
      },
      {
        "allValue": null,
        "current": {
          "selected": false,
          "text": "[a-z]+|nvme[0-9]+n[0-9]+",
          "value": "[a-z]+|nvme[0-9]+n[0-9]+"
        },
        "hide": 2,
        "includeAll": false,
        "label": null,
        "multi": false,
        "name": "diskdevices",
        "options": [
          {
            "selected": true,
            "text": "[a-z]+|nvme[0-9]+n[0-9]+",
            "value": "[a-z]+|nvme[0-9]+n[0-9]+"
          }
        ],
        "query": "[a-z]+|nvme[0-9]+n[0-9]+",
        "skipUrlSync": false,
        "type": "custom"
      }
    ]
  },
  "time": {
    "from": "now-3h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "15s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "browser",
  "title": "Node Exporter Full",
  "uid": "rYdddlPWj",
  "variables": {
    "list": []
  },
  "version": 2
}
EOF