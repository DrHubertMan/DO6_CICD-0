#!/bin/bash
if [ -f status ]; then
    STATUS="$(cat status)"
else
    STATUS="failed"
fi

TELEGRAM_BOT_TOKEN="5909097325:AAFE4udjV2lrF7qK6SoA23XVs-2sx8Mx6og"
TELEGRAM_USER_ID="172581661"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null 
