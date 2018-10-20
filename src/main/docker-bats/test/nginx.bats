#!/usr/bin/env bats

@test "Http code should be 200" {
  result="$(curl -s -o /dev/null -w "%{http_code}" http://dockerfile/)"
  [ "$result" -eq "200" ]
}

@test "Not found" {
  result="$(curl -s -o /dev/null -w "%{http_code}" http://dockerfile/css/test.css)"
  [ "$result" -eq "404" ]
}

@test "Expires should be 30d" {
  run bash -c "curl -s --fail -I http://dockerfile/css/ghost.css | grep 'Cache-Control: max-age=2592000'"
  [ "$status" -eq 0 ]
}

@test "Access logs should be present" {
  run bash -c "grep 'access_log   logs/access.log  main;' /docker-image/nginx.conf"
  [ "$status" -eq 0 ]
}
