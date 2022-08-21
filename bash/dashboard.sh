#!/bin/bash

cat <<EOF > /home/"${SUDO_USER:-$USER}"/docker/grafana/dashboards/dashboard.json
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
      "datasource": "\${DS_PROMETHEUS}",
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
        "datasource": "\${DS_PROMETHEUS}",
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
        "datasource": "\${DS_PROMETHEUS}",
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

cat <<EOF > /home/"${SUDO_USER:-$USER}"/docker/grafana/dashboards/dashboard_node.json
{
  "__inputs": [
    {
      "name": "DS_LOCALHOST",
      "label": "localhost",
      "description": "",
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
      "version": "4.1.2"
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
    },
    {
      "type": "panel",
      "id": "table",
      "name": "Table",
      "version": ""
    }
  ],
  "annotations": {
    "list": []
  },
  "editable": true,
  "gnetId": 1860,
  "graphTooltip": 0,
  "hideControls": false,
  "id": null,
  "links": [],
  "refresh": "1m",
  "rows": [
    {
      "collapse": false,
      "height": 188,
      "panels": [
        {
          "cacheTimeout": null,
          "colorBackground": false,
          "colorValue": true,
          "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "decimals": null,
          "description": "Busy state of all CPU cores together",
          "format": "percent",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "id": 20,
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
          "minSpan": 1,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": true
          },
          "targets": [
            {
              "expr": "(((count(count(node_cpu{instance=~\"\$node:.*\"}) by (cpu))) - avg(sum by (mode)(irate(node_cpu{mode='idle',instance=~\"\$node:.*\"}[5m])))) * 100) / count(count(node_cpu{instance=~\"\$node:.*\"}) by (cpu))",
              "hide": false,
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "85,95",
          "title": "CPU Busy Now",
          "type": "singlestat",
          "valueFontSize": "80%",
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
          "colorValue": true,
          "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 0,
          "description": "Used RAM Memory without swap and cache",
          "format": "percent",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "id": 16,
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": true
          },
          "targets": [
            {
              "expr": "((node_memory_MemTotal{instance=~\"\$node:.*\"} - node_memory_MemFree{instance=~\"\$node:.*\"} - node_memory_Cached{instance=~\"\$node:.*\"}) / (node_memory_MemTotal{instance=~\"\$node:.*\"} )) * 100",
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "80,90",
          "title": "Used RAM Memory",
          "type": "singlestat",
          "valueFontSize": "80%",
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
          "colorValue": true,
          "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "decimals": null,
          "description": "Used Swap",
          "format": "percent",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "id": 21,
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": true
          },
          "targets": [
            {
              "expr": "((node_memory_SwapTotal{instance=~\"\$node:.*\"} - node_memory_SwapFree{instance=~\"\$node:.*\"}) / (node_memory_SwapTotal{instance=~\"\$node:.*\"} )) * 100",
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "10,25",
          "title": "Used SWAP",
          "type": "singlestat",
          "valueFontSize": "80%",
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
          "colorValue": true,
          "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "decimals": null,
          "description": "Busy state of all CPU cores together (1 min average)",
          "format": "percent",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": true,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "id": 19,
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
          "minSpan": 1,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": true
          },
          "targets": [
            {
              "expr": "avg(node_load1{instance=~\"\$node:.*\"}) /  count(count(node_cpu{instance=~\"\$node:.*\"}) by (cpu)) * 100",
              "hide": false,
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "85, 95",
          "title": "CPU System Load (1m avg)",
          "type": "singlestat",
          "valueFontSize": "80%",
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
          "datasource": "\${DS_LOCALHOST}",
          "description": "Basic network info per interface.",
          "fill": 3,
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
            "show": false,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
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
          "span": 4,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_bytes{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "recv bytes {{device}}",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_network_transmit_bytes{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "trans bytes {{device}} ",
              "refId": "B",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Network Traffic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "transparent": false,
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
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
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Basic CPU / Mem / Net Gauge",
      "titleSize": "h6"
    },
    {
      "collapse": false,
      "height": 67,
      "panels": [
        {
          "cacheTimeout": null,
          "colorBackground": false,
          "colorValue": false,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "description": "Total number of CPU cores",
          "format": "none",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "count(count(node_cpu{instance=~\"\$node:.*\"}) by (cpu))",
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "Total RAM",
          "format": "bytes",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"}",
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "",
          "title": "Total RAM",
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "Total SWAP",
          "format": "bytes",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "node_memory_SwapTotal{instance=~\"\$node:.*\"}",
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "",
          "title": "Total SWAP",
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "System Load (1m avg)",
          "format": "none",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
          },
          "id": 17,
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
          "minSpan": 1,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "node_load1{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "",
          "title": "System Load (1m avg)",
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
          "datasource": "\${DS_LOCALHOST}",
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
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "node_time{instance=~\"\$node:.*\"} - node_boot_time{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "refId": "A",
              "step": 60
            }
          ],
          "thresholds": "",
          "title": "Uptime",
          "transparent": false,
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
          "colorValue": true,
          "colors": [
            "rgba(50, 172, 45, 0.97)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(245, 54, 54, 0.9)"
          ],
          "datasource": "\${DS_LOCALHOST}",
          "decimals": null,
          "description": "Used RootFS",
          "format": "percent",
          "gauge": {
            "maxValue": 100,
            "minValue": 0,
            "show": false,
            "thresholdLabels": false,
            "thresholdMarkers": true
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
          "span": 2,
          "sparkline": {
            "fillColor": "rgba(31, 118, 189, 0.18)",
            "full": false,
            "lineColor": "rgb(31, 120, 193)",
            "show": false
          },
          "targets": [
            {
              "expr": "((node_filesystem_size{device=~\"rootfs\",instance=~\"\$node:.*\"} - node_filesystem_free{device=~\"rootfs\",instance=~\"\$node:.*\"}) * 100 ) / (node_filesystem_size{device=~\"rootfs\",instance=~\"\$node:.*\"})",
              "hide": false,
              "intervalFactor": 1,
              "refId": "A",
              "step": 30
            }
          ],
          "thresholds": "70,90",
          "title": "Used RootFS",
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
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Basic CPU / Mem / Net Info",
      "titleSize": "h6"
    },
    {
      "collapse": false,
      "height": 341,
      "panels": [
        {
          "aliasColors": {
            "Busy": "#EAB839",
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "Basic CPU info",
          "fill": 4,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": true,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "sum ( irate(node_cpu{mode!='idle',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Busy",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='idle',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Idle",
              "refId": "C",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "CPU Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "transparent": false,
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
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
          ]
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Harware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "Basic memory usage",
          "fill": 4,
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
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*RAM Used*./",
              "stack": false
            }
          ],
          "span": 6,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "RAM Total",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"} - node_memory_MemFree{instance=~\"\$node:.*\"} - node_memory_Cached{instance=~\"\$node:.*\"} - node_memory_Buffers{instance=~\"\$node:.*\"} - node_memory_Slab{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "RAM Used",
              "refId": "B",
              "step": 10
            },
            {
              "expr": "(node_memory_SwapTotal{instance=~\"\$node:.*\"} - node_memory_SwapFree{instance=~\"\$node:.*\"})",
              "intervalFactor": 2,
              "legendFormat": "SWAP Used",
              "refId": "C",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Basic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
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
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Basic CPU / Mem Graph",
      "titleSize": "h6"
    },
    {
      "collapse": false,
      "height": 95,
      "panels": [
        {
          "columns": [
            {
              "text": "Min",
              "value": "min"
            },
            {
              "text": "Max",
              "value": "max"
            },
            {
              "text": "Current",
              "value": "current"
            }
          ],
          "description": "Local filesystem usage",
          "fontSize": "80%",
          "id": 73,
          "links": [],
          "pageSize": null,
          "scroll": true,
          "showHeader": true,
          "sort": {
            "col": 2,
            "desc": true
          },
          "span": 8,
          "styles": [
            {
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "pattern": "Time",
              "type": "date"
            },
            {
              "colorMode": "value",
              "colors": [
                "rgba(50, 172, 45, 0.97)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(245, 54, 54, 0.9)"
              ],
              "decimals": 2,
              "pattern": "Current|Max|Min",
              "thresholds": [
                "80",
                "90"
              ],
              "type": "number",
              "unit": "percent"
            }
          ],
          "targets": [
            {
              "expr": "100 - (node_filesystem_free{instance=~\"\$node:.*\",fstype=~\"xfs|ext4\"} / node_filesystem_size{instance=~\"\$node:.*\",fstype=~\"xfs|ext4\"} * 100)",
              "intervalFactor": 2,
              "legendFormat": "{{ mountpoint }}",
              "refId": "A",
              "step": 10
            }
          ],
          "title": "Filesystem Usage",
          "transform": "timeseries_aggregations",
          "type": "table"
        },
        {
          "columns": [
            {
              "text": "Current",
              "value": "current"
            }
          ],
          "description": "Local filesystem sIze info",
          "fontSize": "80%",
          "id": 72,
          "links": [],
          "pageSize": null,
          "scroll": true,
          "showHeader": true,
          "sort": {
            "col": 0,
            "desc": true
          },
          "span": 4,
          "styles": [
            {
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "pattern": "Time",
              "type": "date"
            },
            {
              "colorMode": null,
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "decimals": 2,
              "pattern": "Current",
              "thresholds": [],
              "type": "number",
              "unit": "bytes"
            }
          ],
          "targets": [
            {
              "expr": "node_filesystem_size{instance=~\"\$node:.*\",fstype=~\"xfs|ext4\"}",
              "intervalFactor": 2,
              "legendFormat": "{{ mountpoint }}",
              "refId": "A",
              "step": 20
            }
          ],
          "title": "Filesystem Size",
          "transform": "timeseries_aggregations",
          "type": "table"
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Basic Filesystem Info",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 463,
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "CPU info",
          "fill": 3,
          "id": 3,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": true,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [],
          "span": 12,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "sum by (mode)(irate(node_cpu{mode=\"system\",instance=~\"\$node:.*\"}[5m]))",
              "interval": "10s",
              "intervalFactor": 2,
              "legendFormat": "System - Processes executing in kernel mode",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='user',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "User - Normal processes executing in user mode",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='nice',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Nice - Niced processes executing in user mode",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='idle',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Idle - Waiting for something to happen",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='iowait',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Iowait - Waiting for I/O to complete",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='irq',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Irq - Servicing interrupts",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='softirq',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Softirq - Servicing softirqs",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='steal',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Steal - Time spent in other operating systems when running in a virtualized environment",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "sum by (mode)(irate(node_cpu{mode='guest',instance=~\"\$node:.*\"}[5m]))",
              "intervalFactor": 2,
              "legendFormat": "Guest - Time spent running a virtual CPU for a guest operating system",
              "refId": "I",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "CPU",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "transparent": false,
          "type": "graph",
          "xaxis": {
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
          ]
        },
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Harware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
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
            "Unused - Free memory unasigned": "#052B51"
          },
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "description": "Memory Stack",
          "fill": 3,
          "id": 24,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Committed - *./",
              "stack": false
            },
            {
              "alias": "/.*Mapped - *./",
              "stack": false
            },
            {
              "alias": "/.*Active - *./",
              "stack": false
            },
            {
              "alias": "/.*Inactive - *./",
              "stack": false
            },
            {
              "alias": "/.*VmallocUsed - *./",
              "stack": false
            },
            {
              "alias": "/.*Commit Limit - *./",
              "stack": false
            },
            {
              "alias": "/.*Dirty - *./",
              "stack": false
            },
            {
              "alias": "/.*Harware Corrupted - *./",
              "stack": false
            },
            {
              "alias": "/.*Unevictable - *./",
              "stack": false
            }
          ],
          "span": 12,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"} - node_memory_MemFree{instance=~\"\$node:.*\"} - node_memory_Buffers{instance=~\"\$node:.*\"} - node_memory_Cached{instance=~\"\$node:.*\"} - node_memory_Slab{instance=~\"\$node:.*\"} - node_memory_PageTables{instance=~\"\$node:.*\"} - node_memory_SwapCached{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Apps - Memory used by processes",
              "refId": "Q",
              "step": 4
            },
            {
              "expr": "node_memory_PageTables{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "PageTables - Memory dedicated to the lowest page table level",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "node_memory_SwapCached{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "SwapCache - Swap used as cache memory",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "node_memory_Slab{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Slab - Memory used by the kernel to cache data structures for its own use",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "node_memory_Cached{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Cache - Physical RAM used as cache memory",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "node_memory_Buffers{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Buffers - Physical RAM used for file buffers",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_memory_MemFree{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Unused - Free memory unasigned",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "(node_memory_SwapTotal{instance=~\"\$node:.*\"} - node_memory_SwapFree{instance=~\"\$node:.*\"})",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Swap - Swap memory usage",
              "refId": "I",
              "step": 4
            },
            {
              "expr": "node_memory_Committed_AS{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Committed - The amount of memory presently allocated on the system",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Mapped{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Mapped - Files which have been mmaped, such as libraries",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "node_memory_Active{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Active - Memory that has been used more recently and usually not reclaimed unless absolutely necessary",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "node_memory_Inactive{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Inactive - Memory which has been less recently used.  It is more eligible to be reclaimed for other purposes",
              "refId": "K",
              "step": 4
            },
            {
              "expr": "node_memory_VmallocUsed{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "VmallocUsed - Memory of used virtual address space",
              "refId": "L",
              "step": 4
            },
            {
              "expr": "node_memory_CommitLimit{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Commit Limit - Total amount of  memory currently available to be allocated on the system",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "node_memory_Dirty{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Dirty - Memory which is waiting to get written back to the disk",
              "refId": "N",
              "step": 4
            },
            {
              "expr": "node_memory_HardwareCorrupted{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Harware Corrupted - Amount of RAM that the kernel identified as corrupted / not working",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "node_memory_Unevictable{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Unevictable - Unevictable pages can't be swapped out for a variety of reasons",
              "refId": "P",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Stack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
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
          ]
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
          "datasource": "\${DS_LOCALHOST}",
          "description": "Network info. Need to fix https://github.com/grafana/grafana/issues/1271",
          "fill": 3,
          "id": 59,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideEmpty": false,
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
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*trans.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*errs.*/",
              "yaxis": 2
            },
            {
              "alias": "/.*drop.*/",
              "yaxis": 2
            },
            {
              "alias": "/.*bytes.*/",
              "yaxis": 1
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_bytes{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "recv bytes {{device}}",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_bytes{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "trans bytes {{device}} ",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_errs{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "recv errs {{device}} ",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_errs{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "trans err {{device}} ",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_drop{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "recv drop {{device}}",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_drop{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "trans drop {{device}} ",
              "refId": "H",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Network Traffic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "io time": "#890F02"
          },
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 3,
          "description": "Need to fix https://github.com/grafana/grafana/issues/1271",
          "fill": 3,
          "id": 42,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
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
              "alias": "/.*milliseconds*./",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_bytes_read{instance=~\"\$node:.*\",device=~\"[a-z]*[a-z]\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "successfully read bytes {{device}}",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_disk_bytes_written{instance=~\"\$node:.*\",device=~\"[a-z]*[a-z]\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "successfully written bytes {{device}}",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_disk_io_time_ms{instance=~\"\$node:.*\",device=~\"[a-z]*[a-z]\"} [5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "milliseconds spent doing I/Os {{device}}",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "I/O Usage",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": false,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 3,
          "description": "Disk space used of all filesystems mounted",
          "fill": 1,
          "height": "",
          "id": 69,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "100- ((node_filesystem_avail{instance=~\"\$node:.*\",device!~'rootfs'} * 100) / node_filesystem_size{instance=~\"\$node:.*\",device!~'rootfs'})",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}}",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk Space Used",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
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
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "CPU Memory Net Disk",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 379,
      "panels": [
        {
          "aliasColors": {
            "Apps": "#629E51",
            "Buffers": "#614D93",
            "Cache": "#6D1F62",
            "Cached": "#511749",
            "Committed": "#508642",
            "Free": "#0A437C",
            "Harware Corrupted - Amount of RAM that the kernel identified as corrupted / not working": "#CFFAFF",
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "fill": 1,
          "id": 79,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Committed - *./",
              "stack": false
            },
            {
              "alias": "/.*Mapped - *./",
              "stack": false
            },
            {
              "alias": "/.*Active - *./",
              "stack": false
            },
            {
              "alias": "/.*Inactive - *./",
              "stack": false
            },
            {
              "alias": "/.*VmallocUsed - *./",
              "stack": false
            },
            {
              "alias": "/.*Commit Limit - *./",
              "stack": false
            },
            {
              "alias": "/.*Dirty - *./",
              "stack": false
            },
            {
              "alias": "/.*Harware Corrupted - *./",
              "stack": false
            },
            {
              "alias": "/.*Unevictable - *./",
              "stack": false
            }
          ],
          "span": 12,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_Committed_AS{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Committed - The amount of memory presently allocated on the system",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_memory_Mapped{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Mapped - Files which have been mmaped, such as libraries",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "node_memory_Active{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Active - Memory that has been used more recently and usually not reclaimed unless absolutely necessary",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "node_memory_Inactive{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Inactive - Memory which has been less recently used.  It is more eligible to be reclaimed for other purposes",
              "refId": "K",
              "step": 4
            },
            {
              "expr": "node_memory_VmallocUsed{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "VmallocUsed - Memory of used virtual address space",
              "refId": "L",
              "step": 4
            },
            {
              "expr": "node_memory_CommitLimit{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Commit Limit - Total amount of  memory currently available to be allocated on the system",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "node_memory_Dirty{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Dirty - Memory which is waiting to get written back to the disk",
              "refId": "N",
              "step": 4
            },
            {
              "expr": "node_memory_HardwareCorrupted{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Harware Corrupted - Amount of RAM that the kernel identified as corrupted / not working",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "node_memory_Unevictable{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Unevictable - Unevictable pages can't be swapped out for a variety of reasons",
              "refId": "P",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Usage 0",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "cumulative"
          },
          "type": "graph",
          "xaxis": {
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
          ]
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "fill": 1,
          "id": 46,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Total RAM",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"} + (node_memory_SwapTotal{instance=~\"\$node:.*\"})",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Total RAM + Swap",
              "refId": "B",
              "step": 10
            },
            {
              "expr": "node_memory_Shmem{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Shared mem - Total memory used by shared memory (shmem) and tmpfs",
              "refId": "I",
              "step": 10
            },
            {
              "expr": "node_memory_Writeback{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Writeback - Memory which is actively being written back to disk",
              "refId": "J",
              "step": 10
            },
            {
              "expr": "node_memory_WritebackTmp{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "WritebackTmp - Memory used by FUSE for temporary writeback buffers",
              "refId": "K",
              "step": 10
            },
            {
              "expr": "node_memory_NFS_Unstable{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "NFS Unstable - NFS pages sent to the server, but not yet commited to the storage",
              "refId": "L",
              "step": 10
            },
            {
              "expr": "node_memory_Mlocked{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "MLocked - Pages locked to memory using the mlock() system call",
              "refId": "M",
              "step": 10
            },
            {
              "expr": "node_memory_SReclaimable{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "SReclaimable - Part of Slab, that might be reclaimed, such as caches",
              "refId": "N",
              "step": 10
            },
            {
              "expr": "node_memory_SUnreclaim{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "SUnreclaim - Part of Slab, that cannot be reclaimed on memory pressure",
              "refId": "O",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Usage 1",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "GB",
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
          ]
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "fill": 1,
          "id": 47,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Total RAM",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "node_memory_MemTotal{instance=~\"\$node:.*\"} + (node_memory_SwapTotal{instance=~\"\$node:.*\"})",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "Total RAM + Swap",
              "refId": "B",
              "step": 10
            },
            {
              "expr": "node_memory_DirectMap1G{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "DirectMap1G - Amount of pages mapped as this size",
              "refId": "J",
              "step": 10
            },
            {
              "expr": "node_memory_DirectMap2M{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "DirectMap2M - Amount of pages mapped as this size",
              "refId": "K",
              "step": 10
            },
            {
              "expr": "node_memory_DirectMap4k{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "DirectMap4K  - Amount of pages mapped as this size",
              "refId": "L",
              "step": 10
            },
            {
              "expr": "node_memory_AnonHugePages{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Anon Huge Pages - Non-file backed huge pages mapped into userspace page tables",
              "refId": "D",
              "step": 10
            },
            {
              "expr": "node_memory_AnonPages{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Anon Pages - Non-file backed pages mapped into userspace page tables",
              "refId": "G",
              "step": 10
            },
            {
              "expr": "node_memory_Active_anon{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Inactive Anon - Anonymous and swap cache on inactive LRU list, including tmpfs (shmem)",
              "refId": "H",
              "step": 10
            },
            {
              "expr": "node_memory_Active_file{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Active File - File-backed memory on active LRU list",
              "refId": "I",
              "step": 10
            },
            {
              "expr": "node_memory_Inactive_file{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Inactive File - File-backed memory on inactive LRU list",
              "refId": "M",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Usage 2",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "GB",
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
          ]
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "fill": 1,
          "id": 70,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 4,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_VmallocChunk{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocChunk - Largest contiguous block of vmalloc area which is free",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "node_memory_VmallocTotal{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocTotal - Total size of vmalloc memory area",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "node_memory_VmallocUsed{instance=~\"\$node:.*\"}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "VmallocUsed - Amount of vmalloc area which is used",
              "refId": "O",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Usage Vmalloc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "GB",
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 22,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*_out/",
              "transform": "negative-Y"
            }
          ],
          "span": 4,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_vmstat_pswpin {instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "swap_in",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_vmstat_pswpout{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "swap_out",
              "refId": "B",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Swap in/out",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "pages per second in (+) / out (-)",
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
              "show": true
            }
          ]
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
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 2,
          "fill": 1,
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
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*Number of huge pages.*/",
              "yaxis": 2
            }
          ],
          "span": 4,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_memory_HugePages_Free{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "HugePages Free - Number of huge pages in the pool that are not yet allocated",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "node_memory_HugePages_Rsvd{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "HugePages Reserved - Number of huge pages for                 which a commitment to allocate from the pool has been made,                 but no allocation has yet been made",
              "refId": "J",
              "step": 20
            },
            {
              "expr": "node_memory_HugePages_Surp{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "HugePages Surp - Number of huge pages in                 the pool above the value in /proc/sys/vm/nr_hugepages",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "node_memory_HugePages_Total{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "HugePages - Total size of the pool of huge pages",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "node_memory_Hugepagesize{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Hugepagesize - Huge Page size",
              "refId": "D",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Memory Usage HugePages",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "GB",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "none",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": false
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Memory Detail",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 268,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 8,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": "node",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_context_switches{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Context switches",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_intr{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Interrupts",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_entropy_available_bits{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Entropy",
              "refId": "C",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Context Switches / Interrupts / Entropy",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": null,
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 64,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "process_max_fds{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Max file descriptors",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "process_open_fds{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Open file descriptors",
              "refId": "B",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "File Descriptors",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": null,
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 62,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*forks*./",
              "yaxis": 2
            }
          ],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_procs_blocked{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Processes blocked waiting for I/O to complete",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "node_procs_running{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "Processes in runnable state",
              "refId": "B",
              "step": 10
            },
            {
              "expr": "increase(node_forks{instance=~\"\$node:.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "Processes forks",
              "refId": "C",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Processes State / Forks",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 65,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "process_resident_memory_bytes{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Resident memory size in bytes",
              "refId": "A",
              "step": 10
            },
            {
              "expr": "process_start_time_seconds{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Start time of the process since unix epoch in seconds",
              "refId": "B",
              "step": 10
            },
            {
              "expr": "process_virtual_memory_bytes{instance=~\"\$node:.*\"}",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Virtual memory size in bytes",
              "refId": "C",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Processes",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": null,
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 7,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": "node",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_load1{instance=~\"\$node:.*\"}",
              "intervalFactor": 4,
              "legendFormat": "Load 1m",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "node_load5{instance=~\"\$node:.*\"}",
              "intervalFactor": 4,
              "legendFormat": "Load 5m",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "node_load15{instance=~\"\$node:.*\"}",
              "intervalFactor": 4,
              "legendFormat": "Load 15m",
              "refId": "C",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "System Load",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "",
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
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "System Detail",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 304,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The total number of bytes read / write successfully.",
          "fill": 2,
          "id": 33,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read.*/",
              "transform": "negative-Y"
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_bytes_read{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 40
            },
            {
              "expr": "irate(node_disk_bytes_written{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_written",
              "refId": "B",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk Bytes R/W",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": "read (-) / write (+)",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The total number of reads / writes completed successfully.",
          "fill": 2,
          "id": 9,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "repeat": null,
          "seriesOverrides": [
            {
              "alias": "/.*read.*/",
              "transform": "negative-Y"
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_reads_completed{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 40
            },
            {
              "expr": "irate(node_disk_writes_completed{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_write",
              "refId": "B",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk IOs per Device",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": "IO/second read (-) / write (+)",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The weighted # of milliseconds spent doing I/Os. This field is incremented at each I/O start, I/O completion, I/O  merge, or read of these stats by the number of I/Os in progress times the number of milliseconds spent doing I/O since the last update of this field. This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.",
          "fill": 3,
          "id": 35,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_time_weighted{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}",
              "refId": "A",
              "step": 60
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk IOs weighted",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The total number of milliseconds spent by all reads / writes.",
          "fill": 3,
          "id": 37,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read.*/",
              "transform": "negative-Y"
            }
          ],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_read_time_ms{instance=~\"\$node:.*\"}[5m])",
              "hide": false,
              "intervalFactor": 4,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 60
            },
            {
              "expr": "irate(node_disk_write_time_ms{instance=~\"\$node:.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{device}}_write",
              "refId": "B",
              "step": 30
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk R/W miliseconds",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
              "label": "",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The number of I/Os currently in progress.",
          "fill": 3,
          "id": 34,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_now{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}",
              "refId": "A",
              "step": 60
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk IOs current in progress",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The total number of reads / writes completed successfully and the number of reads merged. See https://www.kernel.org/doc/Documentation/iostats.txt.",
          "fill": 2,
          "id": 38,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read.*/",
              "transform": "negative-Y"
            },
            {
              "alias": "/.*merged.*/",
              "yaxis": 2
            }
          ],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_reads_completed{instance=~\"\$node:.*\"}[5m])",
              "hide": false,
              "intervalFactor": 4,
              "legendFormat": "{{device}}_completed_read",
              "refId": "A",
              "step": 60
            },
            {
              "expr": "irate(node_disk_writes_completed{instance=~\"\$node:.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{device}}_completed_write",
              "refId": "B",
              "step": 30
            },
            {
              "expr": "irate(node_disk_reads_merged{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_merged_read",
              "refId": "C",
              "step": 30
            },
            {
              "expr": "irate(node_disk_writes_mergedd{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_merged_write",
              "refId": "D",
              "step": 30
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Disk R/W completed / Merged",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "",
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            },
            {
              "format": "none",
              "label": null,
              "logBase": 1,
              "max": null,
              "min": null,
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "Milliseconds spent doing I/Os.",
          "fill": 3,
          "id": 36,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_io_time_ms{instance=~\"\$node:.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}",
              "refId": "A",
              "step": 60
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Milliseconds spent doing I/Os",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "ms",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "1 if there was an error opening or reading a file, 0 otherwise",
          "fill": 2,
          "id": 66,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "hideZero": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_textfile_scrape_error{instance=~\"\$node:.*\"}",
              "intervalFactor": 4,
              "legendFormat": "read error",
              "refId": "A",
              "step": 60
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Open error file",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "The total number of sectors read successfully.",
          "fill": 2,
          "id": 80,
          "legend": {
            "alignAsTable": true,
            "avg": false,
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
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*read.*/",
              "transform": "negative-Y"
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_disk_sectors_read{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 4,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 40
            },
            {
              "expr": "irate(node_disk_sectors_written{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_written",
              "refId": "B",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Sectors read / write succesfully",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "read (-) / write (+)",
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
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Disk Detail",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 297,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 3,
          "description": "Filesystem space available to non-root users in bytes. Filesystem free space in bytes. Filesystem read-only status. Filesystem size in bytes.",
          "fill": 1,
          "id": 43,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_avail{instance=~\"\$node:.*\",device!~'rootfs'}",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} Available",
              "metric": "",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_filesystem_free{instance=~\"\$node:.*\",device!~'rootfs'}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} Free",
              "refId": "B",
              "step": 2
            },
            {
              "expr": "node_filesystem_size{instance=~\"\$node:.*\",device!~'rootfs'}",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} Size",
              "refId": "D",
              "step": 2
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Filesystem space available",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "Filesystem total file nodes.",
          "fill": 1,
          "id": 41,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": false,
            "hideZero": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": true,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_files{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "{{device}}",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "File nodes",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": null,
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "File descriptor statistics: allocated.",
          "fill": 1,
          "id": 28,
          "legend": {
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filefd_maximum{instance=~\"\$node:.*\"}",
              "intervalFactor": 4,
              "legendFormat": "max open files",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "node_filefd_allocated{instance=~\"\$node:.*\"}",
              "intervalFactor": 2,
              "legendFormat": "open files",
              "refId": "B",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "File descriptor",
          "tooltip": {
            "shared": false,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {
            "/ ReadOnly": "#890F02"
          },
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "decimals": 0,
          "description": "Filesystem read-only status.",
          "fill": 1,
          "id": 44,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": false,
            "hideEmpty": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 2,
          "nullPointMode": "connected",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 6,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_filesystem_readonly{instance=~\"\$node:.*\",device!~'rootfs'}",
              "intervalFactor": 2,
              "legendFormat": "{{mountpoint}} ReadOnly",
              "refId": "C",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Filesystem in ReadOnly",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "",
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Filesystem Detail",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 253,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 58,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_bytes{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_bytes_{{device}}",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_bytes{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_bytes_{{device}}",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_compressed{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_compressed_{{device}}",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_compressed{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_compressed_{{device}}",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_errs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_errs_{{device}}",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_errs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_errs_{{device}}",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_drop{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_drop_{{device}}",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_drop{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_drop_{{device}}",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_fifo{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_fifo_{{device}}",
              "refId": "I",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_fifo{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_fifo_{{device}}",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "irate(node_network_receive_frame{instance=~\"\$node.*\"}[5m])",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "receive_frame_{{device}}",
              "refId": "K",
              "step": 30
            },
            {
              "expr": "irate(node_network_transmit_frame{instance=~\"\$node.*\"}[5m])",
              "hide": true,
              "intervalFactor": 2,
              "legendFormat": "transmit_frame_{{device}}",
              "refId": "L",
              "step": 30
            },
            {
              "expr": "irate(node_network_receive_multicast{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_multicast_{{device}}",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_multicast{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_multicast_{{device}}",
              "refId": "N",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Network traffic Detail",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bytes",
              "label": null,
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 60,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_network_receive_packets{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "receive_packets_{{device}}",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "irate(node_network_transmit_packets{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "transmit_packets_{{device}}",
              "refId": "P",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Network traffic Packets",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "pps",
              "label": null,
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 61,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": true,
            "rightSide": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_nf_conntrack_entries{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "receive_packets_{{device}}",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "node_nf_conntrack_entries{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "transmit_packets_{{device}}",
              "refId": "P",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "NF Contrack",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Network traffic Detail",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 265,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 30,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_netstat_Tcp_CurrEstab{instance=~\"\$node..*\"}",
              "intervalFactor": 2,
              "legendFormat": "established",
              "refId": "A",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Netstat TCP Established",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "short",
              "label": null,
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "",
          "id": 49,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": null,
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Ip_InReceives{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InReceives",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_DefaultTTL{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "DefaultTTL",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_InDelivers{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InDelivers",
              "refId": "I",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_InDiscards{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InDiscards",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_InHdrErrors{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InHdrErrors",
              "refId": "K",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_InReceives{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InReceives",
              "refId": "L",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_InUnknownProtos{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InUnknownProtos",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_OutDiscards{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutDiscards",
              "refId": "N",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_OutNoRoutes{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutNoRoutes",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_OutRequests{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutRequests",
              "refId": "P",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "IP stats",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "",
          "id": 51,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_IpExt_InBcastOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InBcastOctets",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InBcastPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InBcastPkts",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InCEPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InCEPkts",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InCsumErrors{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InCsumErrors",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InECT0Pkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InECT0Pkts",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InECT1Pkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InECT1Pkt",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InMcastOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InMcastOctets",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InMcastPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InMcastPkts",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InNoECTPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InNoECTPkts",
              "refId": "I",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InNoRoutes{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InNoRoutes",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InOctets",
              "refId": "K",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_InTruncatedPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InTruncatedPkts",
              "refId": "L",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutBcastOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutBcastOctets",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutBcastPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutBcastPkts",
              "refId": "N",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutMcastOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutMcastOctets",
              "refId": "O",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutMcastPkts{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutMcastPkts",
              "refId": "P",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_IpExt_OutOctets{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutOctets",
              "refId": "Q",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "IP stats Extra",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "",
          "id": 81,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideEmpty": false,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": null,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Ip_DefaultTTL{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "DefaultTTL",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_ForwDatagrams{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ForwDatagrams",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_Forwarding{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Forwarding",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_FragCreates{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "FragCreates",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_FragFails{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "FragFails",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_FragOKs{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "FragOKs",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_ReasmFails{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ReasmFails",
              "refId": "Q",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_ReasmOKs{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ReasmOKs",
              "refId": "R",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_ReasmReqds{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ReasmReqds",
              "refId": "S",
              "step": 4
            },
            {
              "expr": "irate(node_netstat_Ip_ReasmTimeout{instance=~\"\$node..*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ReasmTimeout",
              "refId": "T",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "IP stats etc",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "id": 63,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "node_sockstat_FRAG_inuse{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "FRAG_inuse",
              "refId": "A",
              "step": 4
            },
            {
              "expr": "node_sockstat_FRAG_memory{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "FRAG_memory",
              "refId": "B",
              "step": 4
            },
            {
              "expr": "node_sockstat_RAW_inuse{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "RAW_inuse",
              "refId": "C",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_alloc{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_alloc",
              "refId": "D",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_inuse{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_inuse",
              "refId": "E",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_mem{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_mem",
              "refId": "F",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_mem_bytes{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_mem_bytes",
              "refId": "G",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_orphan{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_orphan",
              "refId": "H",
              "step": 4
            },
            {
              "expr": "node_sockstat_TCP_tw{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "TCP_tw",
              "refId": "I",
              "step": 4
            },
            {
              "expr": "node_sockstat_UDPLITE_inuse{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "UDPLITE_inuse",
              "refId": "J",
              "step": 4
            },
            {
              "expr": "node_sockstat_UDP_inuse{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "UDP_inuse",
              "refId": "K",
              "step": 4
            },
            {
              "expr": "node_sockstat_UDP_mem{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "UDP_mem",
              "refId": "L",
              "step": 4
            },
            {
              "expr": "node_sockstat_UDP_mem_bytes{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "UDP_mem_bytes",
              "refId": "M",
              "step": 4
            },
            {
              "expr": "node_sockstat_sockets_used{instance=~\"\$node.*\"}",
              "intervalFactor": 2,
              "legendFormat": "sockets_used",
              "refId": "N",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Sockstat",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "Sockets",
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Network Netstat",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 375,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 52,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Tcp_InCsumErrors{instance=~\"\$node.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "InCsumErrors",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_InErrs{instance=~\"\$node.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "InErrs",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_InSegs{instance=~\"\$node.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "InSegs",
              "refId": "G",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_OutRsts{instance=~\"\$node.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "OutRsts",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_OutSegs{instance=~\"\$node.*\"}[5m])",
              "hide": false,
              "intervalFactor": 2,
              "legendFormat": "OutSegs",
              "refId": "J",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "TCP stats",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 82,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Tcp_ActiveOpens{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ActiveOpens",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_AttemptFails{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "AttemptFails",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_CurrEstab{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "CurrEstab",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_EstabResets{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "EstabResets",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_MaxConn{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "MaxConn",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_PassiveOpens{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "PassiveOpens",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_RetransSegs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RetransSegs",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_RtoAlgorithm{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RtoAlgorithm",
              "refId": "M",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_RtoMax{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RtoMax",
              "refId": "N",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Tcp_RtoMin{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RtoMin",
              "refId": "O",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "TCP ext 1",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 53,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_TcpExt_ArpFilter{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "ArpFilter",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_BusyPollRxPackets{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "BusyPollRxPackets",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_DelayedACKLocked{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "DelayedACKLocked",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_DelayedACKLost{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "DelayedACKLost",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_DelayedACKs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_DelayedACKs",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_EmbryonicRsts{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_EmbryonicRsts",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_IPReversePathFilter{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_IPReversePathFilter",
              "refId": "G",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_ListenDrops{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_ListenDrops",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_ListenOverflows{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_ListenOverflows",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_LockDroppedIcmps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_LockDroppedIcmps",
              "refId": "J",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_OfoPruned{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_OfoPruned",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_OutOfWindowIcmps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_OutOfWindowIcmps",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_PAWSActive{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_PAWSActive",
              "refId": "M",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_PAWSEstab{instance=~'\$node'}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_PAWSEstab",
              "refId": "N",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_PAWSPassive{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_PAWSPassive",
              "refId": "O",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_PruneCalled{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_PruneCalled",
              "refId": "P",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_RcvPruned{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_RcvPruned",
              "refId": "Q",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesFailed{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_SyncookiesFailed",
              "refId": "R",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesRecv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_SyncookiesRecv",
              "refId": "S",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_SyncookiesSent{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_SyncookiesSent",
              "refId": "T",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortFailed{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "refId": "U",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortOnClose{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPAbortOnClose",
              "refId": "V",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortOnData{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_TCPAbortOnData",
              "refId": "W",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortOnLinger{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPAbortOnLinger",
              "refId": "X",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortOnMemory{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPAbortOnMemory",
              "refId": "Y",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "TCP ext 2",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 54,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_TcpExt_TCPAbortOnTimeout{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPAbortOnTimeout",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPAutoCorking{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_TCPAutoCorking",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPBacklogDrop{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPBacklogDrop",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPChallengeACK{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPChallengeACK",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKIgnoredNoUndo{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKIgnoredNoUndo",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKIgnoredOld{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKIgnoredOld",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKOfoRecv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKOfoRecv",
              "refId": "G",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKOfoSent{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKOfoSent",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKOldSent{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TcpExt_TCPDSACKOldSent",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKRecv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKRecv",
              "refId": "J",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDSACKUndo{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDSACKUndo",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDeferAcceptDrop{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDeferAcceptDrop",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDirectCopyFromBacklog{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDirectCopyFromBacklog",
              "refId": "M",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPDirectCopyFromPrequeue{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPDirectCopyFromPrequeue",
              "refId": "N",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFACKReorder{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFACKReorder",
              "refId": "O",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenActive{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenActive",
              "refId": "P",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenActiveFail{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenActiveFail",
              "refId": "Q",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenCookieReqd{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenCookieReqd",
              "refId": "R",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenListenOverflow{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenListenOverflow",
              "refId": "S",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenPassive{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenPassive",
              "refId": "T",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastOpenPassiveFail{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastOpenPassiveFail",
              "refId": "U",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFastRetrans{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFastRetrans",
              "refId": "V",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPForwardRetrans{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPForwardRetrans",
              "refId": "W",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFromZeroWindowAdv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFromZeroWindowAdv",
              "refId": "X",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPFullUndo{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPFullUndo",
              "refId": "Y",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPHPAcks{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPHPAcks",
              "refId": "Z",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPHPHits{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPHPHits",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPHPHitsToUser{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPHPHitsToUser",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPLossFailures{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPLossFailures",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPLossProbeRecovery{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPLossProbeRecovery",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "TCP ext 3",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 56,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_TcpExt_TCPSackRecovery{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSackRecovery",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSackRecoveryFail{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSackRecoveryFail",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSackShiftFallback{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSackShiftFallback",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSackShifted{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSackShifted",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSchedulerFailed{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSchedulerFailed",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSlowStartRetrans{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSlowStartRetrans",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSpuriousRTOs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSpuriousRTOs",
              "refId": "G",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSpuriousRtxHostQueues{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSpuriousRtxHostQueues",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPSynRetrans{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPSynRetrans",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPTSReorder{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPTSReorder",
              "refId": "J",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPTimeWaitOverflow{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPTimeWaitOverflow",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPTimeouts{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPTimeouts",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPToZeroWindowAdv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPToZeroWindowAdv",
              "refId": "M",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TCPWantZeroWindowAdv{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TCPWantZeroWindowAdv",
              "refId": "N",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TW{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TW",
              "refId": "O",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TWKilled{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TWKilled",
              "refId": "P",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_TcpExt_TWRecycled{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "TWRecycled",
              "refId": "Q",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "TCP ext 4",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Network Netstat TCP",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 287,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 55,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
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
              "alias": "NoPorts",
              "yaxis": 2
            }
          ],
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_Udp_InCsumErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InCsumErrors",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_InDatagrams{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InDatagrams",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_InErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InErrors",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_NoPorts{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "NoPorts",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_OutDatagrams{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutDatagrams",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_RcvbufErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RcvbufErrors",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Udp_SndbufErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "SndbufErrors",
              "refId": "G",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "UDP",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 57,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_UdpLite_InCsumErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InCsumErrors",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_InDatagrams{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InDatagrams",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_InErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InErrors",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_NoPorts{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "NoPorts",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_OutDatagrams{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutDatagrams",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_RcvbufErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "RcvbufErrors",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_UdpLite_SndbufErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "SndbufErrors",
              "refId": "G",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "UDP Lite",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        },
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "fill": 1,
          "height": "300px",
          "id": 50,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "rightSide": true,
            "show": true,
            "sort": "current",
            "sortDesc": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "minSpan": 1,
          "nullPointMode": "null",
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
          "span": 12,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_netstat_IcmpMsg_InType3{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InType3",
              "refId": "A",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_IcmpMsg_OutType3{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutType3",
              "refId": "B",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InAddrMaskReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InAddrMaskReps",
              "refId": "C",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InAddrMasks{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InAddrMasks",
              "refId": "D",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InCsumErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InCsumErrors",
              "refId": "E",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InDestUnreachs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InDestUnreachs",
              "refId": "F",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InEchoReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InEchoReps",
              "refId": "G",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InEchos{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InEchos",
              "refId": "H",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InErrors",
              "refId": "I",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InMsgs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InMsgs",
              "refId": "J",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InParmProbs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InParmProbs",
              "refId": "K",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InRedirects{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InRedirects",
              "refId": "L",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InSrcQuenchs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InSrcQuenchs",
              "refId": "M",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InTimeExcds{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InTimeExcds",
              "refId": "N",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InTimestampReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InTimestampReps",
              "refId": "O",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_InTimestamps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "InTimestamps",
              "refId": "P",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutAddrMaskReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutAddrMaskReps",
              "refId": "Q",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutAddrMasks{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutAddrMasks",
              "refId": "R",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutDestUnreachs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutDestUnreachs",
              "refId": "S",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutEchoReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutEchoReps",
              "refId": "T",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutEchos{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Icmp_OutEchos",
              "refId": "U",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutErrors{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Icmp_OutErrors",
              "refId": "V",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutMsgs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "Icmp_OutMsgs",
              "refId": "W",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutParmProbs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutParmProb",
              "refId": "X",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutRedirects{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutRedirects{",
              "refId": "Y",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutSrcQuenchs{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutSrcQuenchs",
              "refId": "Z",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutTimeExcds{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutTimeExcds",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutTimestampReps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutTimestampReps",
              "step": 20
            },
            {
              "expr": "irate(node_netstat_Icmp_OutTimestamps{instance=~\"\$node.*\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "OutTimestamps",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "ICMP stats",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "none",
              "label": "packets",
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Network Netstat UDP ICMP",
      "titleSize": "h6"
    },
    {
      "collapse": true,
      "height": 250,
      "panels": [
        {
          "aliasColors": {},
          "bars": false,
          "datasource": "\${DS_LOCALHOST}",
          "description": "node_exporter: Duration of a scrape job.",
          "fill": 1,
          "id": 40,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 2,
          "links": [],
          "nullPointMode": "null",
          "percentage": false,
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "span": 12,
          "stack": true,
          "steppedLine": false,
          "targets": [
            {
              "expr": "irate(node_exporter_scrape_duration_seconds{instance=~\"\$node.*\",result=\"success\",quantile=\"0.99\"}[5m])",
              "intervalFactor": 2,
              "legendFormat": "{{collector}}",
              "refId": "A",
              "step": 20
            }
          ],
          "thresholds": [],
          "timeFrom": null,
          "timeShift": null,
          "title": "Node Exporter scrape time",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "name": null,
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": null,
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
              "show": true
            }
          ]
        }
      ],
      "repeat": null,
      "repeatIteration": null,
      "repeatRowId": null,
      "showTitle": false,
      "title": "Node Exporter",
      "titleSize": "h6"
    }
  ],
  "schemaVersion": 14,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": [
      {
        "allValue": null,
        "current": {},
        "datasource": "\${DS_LOCALHOST}",
        "hide": 0,
        "includeAll": false,
        "label": "Host:",
        "multi": false,
        "name": "node",
        "options": [],
        "query": "label_values(node_boot_time{job=\"node-exporter\"}, instance)",
        "refresh": 1,
        "regex": "/([^:]+):.*/",
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
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
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
  "version": 11,
  "description": "Graphed values of Prometheus node exporter"
}
EOF