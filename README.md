## Descrição do desafio

Você já ouviu falar da CEAP? A Cota para o Exercício da Atividade Parlamentar, custeia as despesas do mandato, como passagens aéreas e conta de celular. Algumas são reembolsadas, como as com os Correios, e outras são pagas por débito automático, como a compra de passagens. Nos casos de reembolso, os deputados têm três meses para apresentar os recibos. O valor mensal não utilizado fica acumulado ao longo do ano. Por esse motivo, em alguns meses o valor gasto pode ser maior que a média mensal. (Fonte: [Portal da Câmara dos Deputados](https://www2.camara.leg.br/transparencia/acesso-a-informacao/copy_of_perguntas-frequentes/cota-para-o-exercicio-da-atividade-parlamentar)). Através do portal da transparência, nós temos acesso a essas despesas e podemos saber como e onde os políticos estão gastando.

## Usado
- PostgreSQL 14.4
- Redis 6.2.1

## Como rodar

Instalar dependências:
```
bundle install
yarn install
```

Criar e migrar banco de dados:
```
rails db:create db:migrate
```

Tudo certo, próximo passo é rodar:
```
rails server
```

Necessário estar rodando o sidekiq juntamente com a aplicação:
```
bundle exec sidekiq
```

A aplicação vai estar disponível em [localhost:3000](http://localhost:3000/)
