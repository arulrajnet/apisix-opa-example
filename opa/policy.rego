package example

import data.users
import input.request

default allow = false

allow {
  # has the name test-header with the value only-for-test request header
  request.headers["test-header"] == "only-for-test"

  # The request method is GET
  request.method == "GET"

  # The request path starts with /get
  startswith(request.path, "/get")

  # GET parameter test exists and is not equal to abcd
  request.query.test != "abcd"

  # GET parameter user exists
  request.query.user
}

reason = users[request.query.user].reason {
  not allow
  request.query.user
}

headers = users[request.query.user].headers {
  not allow
  request.query.user
}

status_code = users[request.query.user].status_code {
  not allow
  request.query.user
}
