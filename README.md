# Meu Discente
Este repositório tem como finalidade o desenvolvimento da aplicação Meu Discente no qual o mesmo ira registrar informações referente a vida profissional dos discentes e ex-discentes da UFPA.


### Instalar as extensões necessárias


### Copiar o arquivo .env.example para o mesmo diretório e renomeá-lo para .env e colar as variáveis de ambiente informadas pelo seu gerente.

### Adicionar a linha de código no arquivo launch.json
```
.vscode > launch.json


"envFile": "${workspaceFolder}/.env"

```
### Após adicionar, o arquivo deve ficar parecido com isso:

```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Current File",
            "request": "launch",
            "mainClass": "${file}",
            "envFile": "${workspaceFolder}/.env"
        },
        {
            "type": "java",
            "name": "MeuegressoApplication",
            "request": "launch",
            "mainClass": "labes.facomp.ufpa.br.meuegresso.MeuegressoApplication",
            "projectName": "meuegresso",
            "envFile": "${workspaceFolder}/.env"
        }
    ]
}
```

### Ir no arquivo MeuegressoApplication.java e rodar
