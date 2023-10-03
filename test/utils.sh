port="8000"
base_url="http://0.0.0.0:${port}/"
container_name="test-website"

start_test() {
  chmod -R 700 ./dist-newstyle
  find ./dist-newstyle -type f -executable -name "website" -exec {} \; > /dev/null 2>&1 &
  sleep 5
}

end_test() {
  local pid="$(lsof -t -i:"${port}")"

  if test -z "${pid}"
  then
    echo "No process listens to port ${pid}"
  else
    kill -9 "${pid}"
  fi
}

assert_http_status() {
  local http_status="${1}"
  local expected_status="${2}"

  if [ "${http_status}" -eq "${expected_status}" ]; then
    echo "Test successful: Received HTTP status code ${http_status}."
  else
    echo "Test failed: Expected HTTP status code ${expected_status}, but received ${http_status}."
    end_test
    exit 1
  fi
}

get_url() {
  local path="${1}"

  path="${path#/}"

  echo "${base_url}${path}"
}

get_http_status() {
  local url="${1}"

  local http_status=$(curl -s -o /dev/null -w "%{http_code}" "${url}")

  echo "${http_status}"
}
