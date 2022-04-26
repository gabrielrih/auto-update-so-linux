
### Atualização automática do sistema operacional Linux ###

#### Configuração: #####
```shell
cd auto-update-so-linux
sudo chmod 744 configure.sh
sudo ./configure.sh
```

##### Informações técnicas: #####
configure.sh: Este script é responsável por setar as variáveis necessárias e configurar o crontab para rodar a atualização de forma semanal. Caso seja necessário modificar alguma variável é neste arquivo que devemos fazer.

pkg/update.sh: Este arquivo possui somente os comandos de atualização do sistema operacional (update, upgrade, etc)

pkg/run.sh: Este script funciona de forma auxiliar ao update.sh. É este script que faz o controle dos logs.
