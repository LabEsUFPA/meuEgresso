# Meu Discente

Este repositório tem como finalidade o desenvolvimento da aplicação Meu Discente, que irá registrar informações referentes à vida profissional dos discentes e ex-discentes da UFPA.

## Instruções para instalação e configuração

1. Instale as extensões necessárias.

2. Copie o arquivo .env.example para o mesmo diretório e renomeie-o para .env. Cole as variáveis de ambiente informadas pelo gerente do projeto.

3. Adicione a seguinte linha de código no arquivo launch.json:
   
```
.vscode > launch.json
"envFile": "${workspaceFolder}/.env"
```


## O arquivo deve ficar parecido com isso:

```
{
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


4. Vá para o arquivo MeuegressoApplication.java e execute a aplicação.

## Observações

- Certifique-se de que as variáveis de ambiente estão corretamente definidas e que a extensão Java está instalada.

- Caso tenha dificuldades, consulte o responsável da arquitetura ou seu líder para obter mais informações.

