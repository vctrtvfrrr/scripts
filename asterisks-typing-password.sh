#!/bin/bash

# Busca o número da linha
NUM=$(sudo awk '/Defaults	env_reset/{ print NR; exit }' /etc/sudoers)

if [[ $NUM -gt 0 ]]; then
	# Linha seguinte
	NUM=$((NUM + 1))

	sudo sed -i "${NUM}i Defaults	pwfeedback" /etc/sudoers
fi
