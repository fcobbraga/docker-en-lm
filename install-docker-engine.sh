#!/bin/bash

echo "Instalação do Docker Engine Dez/23..."
sleep 1

# Definir o tempo da contagem regressiva
tempo=3

# Loop for para a contagem regressiva
for ((i=$tempo; i>0; i--))
do
    echo "Tempo restante: $i segundos"
    sleep 1
done

# Imprimir uma linha em branco
echo

echo "Instalando as chaves GPG."

# Add Docker's official GPG key:
sudo apt-get update &&
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Imprimir uma linha em branco
echo
sleep 3

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "jammy") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update &&

# Imprimir uma linha em branco
echo
sleep 5
echo "Instalando o Docker."

# Imprimir uma linha em branco
echo
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Imprimir uma linha em branco
echo
sleep 5
echo "Teste de funcionamento do Docker com Hello Docker!"

sudo docker run hello-world

# Imprimir uma linha em branco
echo
echo "Processo finalizado."
