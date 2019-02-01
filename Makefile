dirs:
	mkdir -p ${HOME}/influxdb/data
	mkdir -p ${HOME}/influxdb/config
	mkdir -p ${HOME}/chronograf/data
	mkdir -p ${HOME}/kapacitor/data
	mkdir -p ${HOME}/kapacitor/config
	# mkdir -p ${HOME}/telegraf

tick:
	docker stack deploy \
		--resolve-image=never \
		--compose-file=docker-compose-tick.yaml tick

handlers:
	docker stack deploy \
		--resolve-image=never \
		--compose-file=docker-compose-handlers.yaml handlers

mosquitto:
	docker stack deploy \
		--resolve-image=never \
		--compose-file=docker-compose-mosquitto.yaml mosquitto

portainer:
	docker stack deploy \
		--resolve-image=never \
		--compose-file=docker-compose-portainer.yaml portainer
