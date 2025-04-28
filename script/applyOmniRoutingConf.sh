#!/bin/bash

# Verifica se o script está sendo executado como root
if [[ $EUID -ne 0 ]]; then
  echo "Por favor, execute como root."
  exit 1
fi

# Ativa o encaminhamento de IP temporariamente
sysctl -w net.ipv4.ip_forward=1

# Verifica se já existe a configuração no arquivo sysctl.conf
if grep -q '^net.ipv4.ip_forward=1' /etc/sysctl.conf; then
  echo "Encaminhamento de IP já configurado em /etc/sysctl.conf."
else
  echo "Adicionando configuração ao /etc/sysctl.conf..."
  echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
  echo "Configuração adicionada com sucesso."
fi

# Aplica as configurações
sysctl -p

echo "Encaminhamento de IP ativado!"
