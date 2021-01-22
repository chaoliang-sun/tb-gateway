#!/bin/bash

echo show gateway config -------------------------------------
echo will change "$configs"/tb_gateway.yaml
echo env are: $TB_HOST  $TB_PORT $TB_CREDENTIALS $GATEWAY_TOKEN   $CONFIG_FILE

sed  -i 's/${TB_HOST}/'"$TB_HOST"'/g' "$configs"/tb_gateway.yaml

sed  -i 's/${TB_PORT}/'"$TB_PORT"'/g' "$configs"/tb_gateway.yaml

sed  -i 's/${TB_CREDENTIALS}/'"$TB_CREDENTIALS"'/g' "$configs"/tb_gateway.yaml
sed   -i 's/${GATEWAY_TOKEN\}/'"$GATEWAY_TOKEN"'/g' "$configs"/tb_gateway.yaml
sed  -i 's/${CONFIG_FILE\}/'"$CONFIG_FILE"'/g' "$configs"/tb_gateway.yaml

#change mqtt.file
echo show mqtt config -------------------------------------
echo $CB_HOST $CB_PORT $CA_PATH $CB_USERNAME $CB_PASSWORD

sed -i 's/${CB_HOST}/'"$CB_HOST"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_PORT}/'"$CB_PORT"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${GATEWAY_CLIENT_ID}/'"$GATEWAY_CLIENT_ID"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CA_PATH\}/'"$CA_PATH"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_USERNAME}/'"$CB_USERNAME"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_PASSWORD}/'"$CB_PASSWORD"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${TOPIC_PREFIX}/'"$TOPIC_PREFIX"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${DEVICE_PATTEN}/'"$DEVICE_PATTEN"'/g' "$configs/$CONFIG_FILE"



cat "$configs/$CONFIG_FILE"

exec "$@"