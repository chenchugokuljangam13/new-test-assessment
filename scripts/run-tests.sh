#!/bin/bash
set -e

echo "Downloading test case..."
mkdir -p tests

# Hide curl output unless there's an error
curl -sS -o tests/test-case-private.test.js 'https://work-flow-bucket-3.s3.us-east-1.amazonaws.com/post_hidden.test.js?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIQCZYd662CLxZCIU6wwGROoa%2Fu%2FwrVatltYZiBoUOUCVdAIgVooVNU4vOF%2F%2Fz7xMkVbJ17qCItVNFIqWh1ZFSBPW9U0q1AQIk%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgw4MTc5MDEyMTIyMTciDK05RrUXtHyGIjHYJCqoBA4gLROTQpxhXZcpFvchem7tLqojDwf9%2FZvXLsMvWMkPNbJeSNNpKtz9y9sMR0eQ3E9yiLQruE6%2BcGAo8W5Niu4Ew8wlkYU%2B2dIU4wsU4MlA8tWx4Iv8rDqJi1k8RPsMSMUExFRq4HaS%2FeIPU6%2FZepH%2BkyiDckIpzXWdz1%2FZrn04uYRd9Eo0BiJNaNZ1iKDgqPzTtaaa5OwLpiaAwEWqE1qySQBxbPZecsKRY6gtBHxn7CSZw4HtuUGYBJQzsobjrvsnF%2B4JF1xpB2Ju84A4p%2BtAL9%2Bf%2FOsWR%2BgWZnZ%2FMl3h%2Fwz6EGEPwrwUpfmuISG0%2B0Q6AY7mmnDXY31m0JAU72hDpSJyk47Dj37hIAwjyQ79iRp0IPl5r5kY6lhNF4iqkZ8r%2BjCz%2Fju2eMVsxQKVfONq8WXIH7j0nV7bxDhfpn33h8hkbnDcwzySrME9D72iCBWZTF6QAmiwZfgq3H0UzxxgTdnwoNIXmUe5HH1wLrzGWeiVuJaVNTDdMeGaNb4%2F%2BUB5zUlzg%2FhIsDob0%2B21GW8bbrBzB8LDpkl4nksI5S53eg0WAZWoAQANgVQK%2BJZTy0cF%2FbQJH13YkBQbtFqXNUbOizT8wWtd84r5cXHKXZA5da6mH40hdNI7TJm1xUac4OXYUM0CYEfLWfV2idUsrKj73Ge8CoX2epY%2FaKMZ55F28IAi7Mt2ia6LBoV%2BGEfDngPqNH9q9XKPLuNYw4wy9dzmdOAjCY45BjDG4K3BBjrFAoSwRF1UStZONSMjaVDrUfYPnmNbLpUNELr%2BG8iAFMQ4efucep2%2BeWSZzfy%2BhZ566owk3F%2FxAHEOdH4wdHZi%2FMyd42mZ3pO3zTW7YKRYNNBzvfJoBTy8lW%2BQmGEYv0nhX6tPqg3oCiRvpxksh0vkp7WHCyW8%2BXan0r27q%2BPTktHFwvazKwTmULO%2FfkSOMEwQkt6p%2BVXA5F%2BTlT5w1iB5MDT%2BAL0EitUCOKd6afRhnUx%2FBeUb7LBl8GqwvQhRXPD1JXFcd6RfPj%2Fn%2Bry0hD6VDVRTBhebWRvID08Hmyksaoz7l13j%2FBdgEqX25HbB1eXzucdbb6ldSeOP6Rum9D6r1p6l36S2vV3L8PSCmcbgDNp3NXlG2fojZHbF3oOUihWAiGeq4x%2FLR%2BiRyabr53xaWRHjiULXClLC1puGnwATOqGLDT35h6Y%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA343VWCI4Z2H3CYLE%2F20250519%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250519T175835Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=6680aa07186ecf9754042a7d174919ec9164f858699e835ab86dbb403d65c684' || {
  echo "Failed to download test case file"
  exit 1
}

echo "✅ Running unit tests..."
# Run test, capture output silently
npm run unit > /dev/null 2>&1
TEST_EXIT_CODE=$?
# Print summary part only
echo ""
echo "----- 🧪 Test Summary (from results.json) -----"
jq '
  passed: .numPassedTests,
  failed: .numFailedTests,
  total: .numTotalTests
' results.json


exit 0