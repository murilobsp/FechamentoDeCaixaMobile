# Fechamento de Caixa - Flutter

## Sobre o projeto - Ainda em desenvolvimento.



Aplicativo mobile híbrido desenvolvido para facilitar o gerenciamento e o registro de fechamentos de caixa, permitindo controlar os valores recebidos por diferentes formas de pagamento, como dinheiro, cartão de crédito, cartão de débito e Pix.

A aplicação foi desenvolvida utilizando o framework **Flutter com a linguagem Dart**, com integração ao **Firebase Cloud Firestore**, um banco de dados NoSQL em nuvem, responsável pelo armazenamento e gerenciamento dos registros. 

O aplicativo permite registrar novos fechamentos, calcular automaticamente o valor total do caixa e consultar o histórico de operações realizadas, incluindo valores, datas e horários. Os registros são armazenados no banco de dados, permitindo que as informações sejam recuperadas mesmo após o encerramento da aplicação.

O projeto utiliza a arquitetura **MVVM (Model-View-ViewModel)**, visando uma melhor organização do código, separação de responsabilidades e facilidade na manutenção e implementação de novas funcionalidades.

O aplicativo está em desenvolvimento, com futuras implementações previstas, como **login e cadastro de usuários, autenticação com Firebase Authentication, controle de acesso aos registros e geração de relatórios financeiros**.

## Tecnologias utilizadas

- **Flutter** – Desenvolvimento da aplicação mobile
- **Dart** – Linguagem de programação
- **Firebase Cloud Firestore** – Banco de dados NoSQL em nuvem
- **Firebase Core** – Integração com os serviços Firebase
- **Material Design** – Componentes e estilização da interface
- **MVVM** – Padrão arquitetural para organização do projeto

## Funcionalidades

- Registro de novos fechamentos de caixa
- Controle dos valores em dinheiro, crédito, débito e Pix
- Cálculo automático do valor total do fechamento
- Armazenamento dos registros no Firebase Firestore
- Consulta do histórico de fechamentos realizados
- Exibição de datas e horários dos registros
- Interface intuitiva desenvolvida para dispositivos móveis
- Navegação entre telas por meio de rotas nomeadas do Flutter

## Arquitetura MVVM

O projeto é organizado com base no padrão arquitetural **Model-View-ViewModel (MVVM)**, que permite separar a interface visual, as regras de apresentação e os dados da aplicação.

Essa abordagem facilita a manutenção do código, a reutilização de componentes e a implementação de novas funcionalidades.

A arquitetura é dividida em três camadas principais:

- **Model:** representa a estrutura dos dados da aplicação, como os valores dos fechamentos, formas de pagamento e informações dos registros.

- **View:** responsável pela interface visual e interação com o usuário, incluindo as telas de início, novo fechamento e histórico.

- **ViewModel:** responsável por gerenciar os estados e a lógica de apresentação, realizando a comunicação entre as Views, os Models e os serviços utilizados pela aplicação.



## Demonstração

### Tela inicial

<img width="200" alt="telaInicial" src="https://github.com/user-attachments/assets/b5507f92-8835-4d98-950d-dc3ebc09f4ad" />


### Novo fechamento

<img width="200" alt="fechamento" src="https://github.com/user-attachments/assets/28646215-ac5d-4c94-9ea8-a5c27dce28d0" />

### Histórico de fechamentos

<img width="200" alt="historicofechamento" src="https://github.com/user-attachments/assets/48ea9c68-1190-460a-a307-4668426f27e2" />


### Resumo do fechamento

<img width="200" alt="Screenshot_1792552217" src="https://github.com/user-attachments/assets/5c5b332e-60d6-4c77-b77f-0a9478e77089" />


### Usuários cadastrados

🚧Ainda em construção.



## Estrutura do projeto

A estrutura abaixo representa a organização proposta com base na arquitetura MVVM:

```text
fechamento_caixa/
│
├── android/
├── ios/
├── assets/
│   ├── images/
│
├── lib/
│   │
│   │
│   │
│   │ 
│   │
│   ├── home/
│   │   ├── models/
│   │   ├── views/
│   │   │   └── home_screen.dart
│   │   └── viewmodels/
│   │
│   ├── novo_fechamento/
│   │   ├── models/
│   │   │   └── novo_fechamento_model.dart
│   │   ├── views/
│   │   │   └── novo_fechamento_screen.dart
│   │   └── viewmodels/
│   │       └── novo_fechamento_viewmodel.dart
│   │
│   └── historico_caixas/
│   │   ├── models/
│   │   │   └── historico_caixas_model.dart
│   │   ├── views/
│   │   │   └── historico_caixas_screen.dart
│   │   └── viewmodels/
│   │      └── historico_caixas_viewmodel.dart
│   │
│   └── relatorio_de_caixa/
│       ├── models/
│       │   └── relatorio_de_caixa_model.dart
│       ├── views/
│       │   └── relatorio_caixa_screen.dart
│       └── viewmodels/
│           └── relatorio_caixa_viewmodels.dart
│
│
│
│
├── app.dart
├── main.dart
│
│ 
├── pubspec.yaml
└── README.md
```


## Melhorias futuras

O projeto está em desenvolvimento e possui funcionalidades planejadas para futuras versões, com o objetivo de ampliar a segurança, a usabilidade e o controle das operações.

### Autenticação e gerenciamento de usuários

- Implementação do **Firebase Authentication** para autenticação de usuários
- Criação das telas de login e cadastro
- Recuperação e redefinição de senhas
- Controle de sessões e acesso às telas protegidas
- Associação dos fechamentos ao usuário responsável

### Gerenciamento de fechamentos

- Filtros no histórico por períodos e datas
- Visualização detalhada dos registros
- Possibilidade de editar ou excluir fechamentos
- Validações adicionais para os valores informados

### Relatórios e melhorias gerais

- Geração de relatórios financeiros
- Exportação de relatórios em PDF
- Resumos de valores por períodos
- Gráficos para visualização dos recebimentos por forma de pagamento
- Melhorias na interface e na experiência do usuário

