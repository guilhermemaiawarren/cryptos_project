# crypto_project
-- Card 2

Estruturação em pastas para posteriormente criar um usecase para consumir API usando a entidade criada, que será alterada para se adaptar aos dados.
Saldo ajustado de acordo com o balanço de cada cripto
Uso do package intl para formatação de moedas em arquivo da pasta utils.
Utilização de gerenciador de estado(hooks_riverpod) para facilitar utilização de dados ao realizar a componentização futuramente.
Uso do package device_preview para testes de responsividade.

-- Card 3

- Componentização de Widgets da Tela Carteira, usando StateProvider para compartilhar estado entre diferentes widgets
- Implementação da lib Decimal
- Arquitetura com microfrontends monorepo

-- Card 4

- Uso de PageView para controlar telas
- Navegação por rotas será usado no próximo card, atualmente não há necessidade

-- Card 5

- Implementação de rotas nomeadas
- Melhora no funcionamento do PageView
- Gráfico funcional
- Provider para navegação entre telas
- Implementação de StateNotifierProvider para passar o model para a tela de detalhes
- Dados mockados para lista de valores das moedas
- Componentização de widgets da tela de detalhes
- Variação e Preço dinâmicos na tela de detalhes  

-- Card 6

- Implementação das Requisições da API usando o package Dio
- Estrutura da documentação do Dio da Warren
- Uso dos packages json_annotation, json_serializable e build_runner
- Uso de AsyncValue para construção de páginas, de modo que retorne algo mesmo quando ocorre um erro
- Interpretação e manipulação de dados da API


-- Card 7

- Rota com argumentos entre mais de uma tela
- Saldo das moedas gerados aleatoriamente e sincronizados por índice
- Gerenciamento de estado da tela de conversão
- Validação de TextField funcional
- Uso de expressões regulares para tratar dados
- Conversão de moeda para outra atualizada instantaneamente, assim como helper text
