FROM python:3.7-slim
ADD ./ /
RUN echo '#Main start script\n\
CONF_FOLDER="./thingsboard_gateway/config"\n\
firstlaunch=${CONF_FOLDER}/.firstlaunch\n\
\n\
if [ ! -f ${firstlaunch} ]; then\n\
    cp -r /default-config/config/* /thingsboard_gateway/config/\n\
    cp -r /default-config/extensions/* /thingsboard_gateway/extensions/\n\
    touch ${firstlaunch}\n\
    echo "#Remove this file only if you want to recreate default config files! This will overwrite exesting files" > ${firstlaunch}\n\
fi\n\
echo "nameserver 8.8.8.8" >> /etc/resolv.conf\n\
\n\
python ./thingsboard_gateway/tb_gateway.py\n\
'\
>> start-gateway.sh && chmod +x start-gateway.sh
ENV PATH="/root/.local/bin:$PATH"
ENV configs /thingsboard_gateway/config
ENV extensions /thingsboard_gateway/extensions
ENV logs /thingsboard_gateway/logs
ENV CONFIG_FILE mqtt.json
ENV IB_HOST mqtt.connect.kuka-robotics.cn
ENV IB_PORT 8883
ENV GATEWAY_CLIENT_ID tb-gateway
ENV CA_PATH "${configs}/cb-ca.pem"
ENV CB_USERNAME kukaatx
ENV CB_PASSWORD !skcus1N
ENV DEVICE_PATTEN "+"
RUN apt-get update && apt-get install gcc -y
RUN pip3 install importlib_metadata --user
RUN python /setup.py install && mkdir -p /default-config/config /default-config/extensions/ && cp -r /thingsboard_gateway/config/* /default-config/config/ && cp -r /thingsboard_gateway/extensions/* /default-config/extensions
VOLUME ["${configs}", "${extensions}", "${logs}"]
ENTRYPOINT ["/docker/docker-entrypoint.sh"]
CMD [ "/bin/sh", "./start-gateway.sh" ]
