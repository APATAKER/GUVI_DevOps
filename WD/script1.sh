#!/bin/bash
http_code=$(curl -o /dev/null -s -w "%{http_code}\n" https://www.guvi.in)
echo "HTTP status code: $http_code"
if [ "$http_code" -eq 200 ]; then
    echo "Success: The website is reachable."
else
    echo "Failure: The website returned an error code."
fi

