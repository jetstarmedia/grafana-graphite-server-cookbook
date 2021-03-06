grafana_repo = 'grafana/grafana'
grafana_version = '4.2.0'

docker_image grafana_repo do
  tag grafana_version
end

docker_container 'grafana' do
  repo grafana_repo
  tag grafana_version
  port '80:3000'
  binds [
    '/var/grafana:/var/lib/grafana',
    '/var/log/grafana:/var/log/grafana'
  ]
  env [
    'GF_AUTH_ANONYMOUS_ENABLED=false',
    'GF_AUTH_ANONYMOUS_ORG_ROLE=Admin'
  ]
  links ['graphite-statsd']
  restart_policy 'always'
end
