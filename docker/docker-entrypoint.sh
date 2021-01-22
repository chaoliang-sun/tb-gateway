#!/bin/bash

if [[ $TB_HOST ]]; then
	sed   's/\$\{TB_HOST\}/'"$TB_HOST"'/g' "$configs"/tb_gateway.yaml
fi
if [[ $TB_PORT ]]; then
	sed   's/\$\{TB_HOST\}/'"$TB_PORT"'/g' "$configs"/tb_gateway.yaml
fi
sed  's/\$\{TB_CREDENTIALS\}/'"$TB_CREDENTIALS"'/g' "$configs"/tb_gateway.yaml
sed   's/\$\{GATEWAY_TOKEN\}/'"$GATEWAY_TOKEN"'/g' "$configs"/tb_gateway.yaml
sed   's/\$\{CONFIG_FILE\}/'"$GATEWAY_TOKEN"'/g' "$configs"/tb_gateway.yaml

#change mqtt.file
cat "$configs"/tb_gateway.yaml
sed  's/\$\{IB_HOST\}/'"$IB_HOST"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{IB_PORT\}/'"$IB_PORT"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{GATEWAY_CLIENT_ID\}/'"$GATEWAY_CLIENT_ID"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{CA_PATH\}/'"$CA_PATH"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{CB_USERNAME\}/'"$CB_USERNAME"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{CB_PASSWORD\}/'"$CB_PASSWORD"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{TOPIC_PREFIX\}/'"$TOPIC_PREFIX"'/g' "$configs/$CONFIG_FILE"
sed  's/\$\{DEVICE_PATTEN\}/'"$DEVICE_PATTEN"'/g' "$configs/$CONFIG_FILE"

cat "$configs/$CONFIG_FILE"

exec "$@"