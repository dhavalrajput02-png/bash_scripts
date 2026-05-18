#!/bin/bash

# Test SCTE-35 Marker Availability

CHANNEL_URLS=(
"https://ds37poyi3xm8n.cloudfront.net/v1/master/071c0467fcd02420cdf0d8a1ca3524b96c27a151/mahuaa_play/mahuaplayjio/index.m3u8",
"https://d1yak0wyh733r.cloudfront.net/v1/master/071c0467fcd02420cdf0d8a1ca3524b96c27a151/mahuaa_khabar/mahuakhabarjio/index.m3u8",
"https://d1lxslxfgt5l3u.cloudfront.net/v1/master/071c0467fcd02420cdf0d8a1ca3524b96c27a151/mahaa_news/mahaanews/index.m3u8"
)

echo "===== SCTE-35 Marker Test ====="

for url in "${CHANNEL_URLS[@]}"
do
    echo ""
    echo "Checking: $url"

    content=$(curl -s "$url")

    if echo "$content" | grep -q "SCTE35\|EXT-X-CUE"; then
        echo "SCTE-35 markers found"
    else
        echo "No SCTE-35 markers found"
    fi
done

echo ""
echo "===== Test Completed ====="