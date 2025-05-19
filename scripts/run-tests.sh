#!/bin/bash
set -e

echo "Downloading test case..."
mkdir -p tests

# Hide curl output unless there's an error
curl -sS -o tests/test-case-private.test.js 'https://work-flow-bucket-3.s3.us-east-1.amazonaws.com/post_hidden.test.js?response-content-disposition=inline&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDxY8o8cU3AhqUdoxTjU%2B1gykSWRyow2%2B95ohlnMPLSdwIhAOSmkPtbyiI2IHYVbbE6vYSwUap6WJfNHHlQg83wswMrKtQECIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMODE3OTAxMjEyMjE3Igz8A1xwG%2BuOKlhZXeQqqASSRTU4oyucB8%2FsDZNSrTJwg5xY9TCXcvTDauVD66BkBs9bbA3RGSO4rRu4QCVxzqSLC9CBBx7YqujsrUjnTYwCGbrYp%2BCq08CY6FcWu7umxf%2FneqrDHuEPokquOS4CjOo7DzFTVj7iBZzUKn4gTgpiMaQtjwEtCNeT8QciLodHWurGxKRnaNO4HGAwBU%2BmLAs80w2OS7HhWmYCu7X8CdWSzl2JXO4%2ByfGxlAUTZvPBz0ZUI7deCs4Cbzcn6qzldj2E4%2F11SnjWYV8CDWsJXWL8vrAFaI7SIbh1iZzhZ76KNvUsSZaIAGGF1MJ2JJ8cqd6LSj39aUp9MMP2DTZJA%2FH1N%2BvAKRKYKTIXF1Ig%2BcRlBuRENkEdcfME9MGGuTeHBMUdFn2x9yTtFYT19vTWcvG9SFQ9%2B9e2OlmQtihbC2PxWw4fDA2JD2dkh6ytAAoXxOAy54Kt5WQaLjXaO0MfWQXHwJ8X33BoP7octaGuiM9%2FIqiy2DR2hlX9krx1EGrf0C5Us5N46cxnyOgXIUqNJwgSYRNyCXAVs%2FNguAv9FzHGthnIJx395ZNaE4tUKNVE0RmNqzYcrvQxoXxXgg6xhYIlC0YDIIScaO5BocpJW6y6o54S5KfvUHopho%2BPb45%2F93XdjOA8a9kyjPMwlPD7xxfbahhHZKlOzOkJBFybN6sJ0YRO8HIwdi8ld71M3qlg6sU26jHSzjhNCobMAnVdNyjrOpr5i5rh5nMw%2FderwQY6xAKV1IE%2F5qFuxShDC57w1bHqqLusjFKj%2BY%2BfcLxsvrPsqo2xztxyvg8HOIyZI%2FGmF3xbHPQOZO5YT90sFnyBSvBeoLj2PXr0wyKMYwsXFMd8g6F1iMgFR3OJ5EDhWWqbw%2F0oqGhRRqqa6ijZxRXcwrMAtXe6sqg1w2s0xX62ZOxJzqhuWAs8%2B6yMplBAcAe%2BfOrUInKfZMTkjyYgBEOWy6gJFDabey2aGcVx3iYcCnG5rfmb7sZukPQZmHyAPlYSHMVhkYtJSamx88v29nq3C1OnLyAjJveOd5jaXA%2FZyh0juEGWR1QU6BrPwhYNl0AgcUrzYjqPv9nOHb0dITPSySPXImpWBu2bq4oM4DoTMGMy0tZtcjBOKAxBa8DHfchhrrAOHTLgW2OPv7qkSCiLGm5qTl62jftoaKBsh%2F3ti7pQBK4bf7Q%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=ASIA343VWCI4V4XCSLPL%2F20250519%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250519T083312Z&X-Amz-Expires=43200&X-Amz-SignedHeaders=host&X-Amz-Signature=07ea51a78e863535487f0aa7d5a0fc35a0c065ebcf60424fd5f93c5e5a090c5d' || {
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
jq '{
  passed: .numPassedTests,
  failed: .numFailedTests,
  total: .numTotalTests
}' results.json


exit 0