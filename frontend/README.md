# Instruções

## Desenvolvimento

Para executar o projeto em modo de desenvolvimento, siga os passos abaixo:

1. Instale as dependências (somente necessário na primeira vez):

```bash
npm i
```

2. Copie o arquivo de ambiente

```bash
cp .env.example .env
```

3. Inicie o servidor de desenvolvimento:

```bash
npm run dev
```

## Storybook

Para executar o Storybook:

```bash
npm run storybook
```

## Build

Para criar uma versão de produção do projeto, execute o seguinte comando:

```bash
npm run build
```

## Testes unitários:

Para executar testes unitários via prompt:

```bash
npm run test:unit
```

Para executar testes unitários via UI:

```bash
npm run test:unit:ui
```

## Scripts do package.json

```json
"scripts": {
  "dev": "vite",
  "build": "vue-tsc && vite build",
  "preview": "vite preview",
  "storybook": "storybook dev -p 6006",
  "build-storybook": "storybook build",
  "test:unit": "vitest --environment jsdom",
  "test:unit:ui": "vitest --ui --environment jsdom"
}
```
