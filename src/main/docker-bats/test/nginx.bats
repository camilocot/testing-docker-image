#!/usr/bin/env bats

@test "A request for an existing resource in the backend should succeed" {

  code="$(curl -s -o /dev/null -w "%{http_code}" http://${NGINX_HOST}/existing)"
  content="$(curl -s -o /dev/null -w "%{content_type}" http://${NGINX_HOST}/existing)"
  body="$(curl -s http://${NGINX_HOST}/existing)"
  [ "$code" -eq 200 ]
  [ "$content" = "application/text" ]
  [ "$body" = "OK" ]
}

@test "Request for a non-existent local resource should fail" {
  code="$(curl -s -o /dev/null -w "%{http_code}" http://${NGINX_HOST}/css/test.css)"
  [ "$code" -eq 404 ]
}

@test "Expire header of a static resource should be 30d" {
  run bash -c "curl -s --fail -I http://${NGINX_HOST}/css/ghost.css | grep 'Cache-Control: max-age=2592000'"
  [ "$status" -eq 0 ]
}
