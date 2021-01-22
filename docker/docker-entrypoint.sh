#!/bin/bash


sed  -i 's/${TB_HOST}/'"$TB_HOST"'/g' "$configs"/tb_gateway.yaml

sed  -i 's/${TB_PORT}/'"$TB_PORT"'/g' "$configs"/tb_gateway.yaml

if [[ $TB_CREDENTIALS ]]; then
  sed  -i 's/${TB_CREDENTIALS}/'"$TB_CREDENTIALS"'/g' "$configs"/tb_gateway.yaml
else
  sed  -i '/${TB_CREDENTIALS}/d' "$configs"/tb_gateway.yaml
fi
sed   -i 's/${GATEWAY_TOKEN\}/'"$GATEWAY_TOKEN"'/g' "$configs"/tb_gateway.yaml
sed  -i 's/${CONFIG_FILE\}/'"$CONFIG_FILE"'/g' "$configs"/tb_gateway.yaml
echo --------------show gateway config -------------------------------------
echo --------------show gateway config -------------------------------------
cat "$configs"/tb_gateway.yaml

#change mqtt.file


sed -i 's/${CB_HOST}/'"$CB_HOST"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_PORT}/'"$CB_PORT"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${GATEWAY_CLIENT_ID}/'"$GATEWAY_CLIENT_ID"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CA_PATH\}/'"$CA_PATH"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_USERNAME}/'"$CB_USERNAME"'/g' "$configs/$CONFIG_FILE"
sed -i 's/${CB_PASSWORD}/'"$CB_PASSWORD"'/g' "$configs/$CONFIG_FILE"
sed -i 's!${TOPIC_PREFIX}!'"$TOPIC_PREFIX"'!g' "$configs/$CONFIG_FILE"
sed -i 's!${DEVICE_PATTEN}!'"$DEVICE_PATTEN"'!g' "$configs/$CONFIG_FILE"

echo -----------------show mqtt config -------------------------------------
echo -----------------show mqtt config -------------------------------------
echo -----------------show mqtt config -------------------------------------
cat "$configs/$CONFIG_FILE"

exec "$@"