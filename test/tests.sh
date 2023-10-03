#!/usr/bin/env bash

set -o errexit
set -o pipefail

base_dir="$(cd `dirname ${0}` && pwd)"
source "${base_dir}/utils.sh"

start_test

# It successfully delivers the home page
url=$(get_url "/")
expected_status=200

http_status=$(get_http_status "${url}")

assert_http_status "${http_status}" "${expected_status}"

# It successfully delivers the legal notice page
url=$(get_url "/impressum.html")
expected_status=200

http_status=$(get_http_status "${url}")

assert_http_status "${http_status}" "${expected_status}"

# It successfully delivers the legal notice page
url=$(get_url "/datenschutz.html")
expected_status=200

http_status=$(get_http_status "${url}")

assert_http_status "${http_status}" "${expected_status}"

end_test
exit 0
