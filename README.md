<img width="2170" height="725" alt="image" src="https://github.com/user-attachments/assets/c3a97c42-206c-4c19-8b46-1d4de9832f5e" />


# 🌾SilosTech — Monitoramento Inteligente de Estoque em Silos de Grãos de Soja

**Do campo analógico ao campo conectado: transformando um sensor de baixo custo em uma ferramenta de gestão, prevenção de perdas e redução da exposição a riscos.**

## 📌 Sobre o Projeto

O agronegócio brasileiro possui grande importância na produção e no armazenamento de grãos, especialmente soja e milho. Entretanto, parte das operações de armazenamento ainda depende de medições manuais, estimativas ou verificações presenciais.

O resultado pode ser:

💸 Prejuízos financeiros relacionados às perdas e ao déficit de armazenamento;
🌽 Desperdício de grãos causado por problemas de armazenagem;
⚠️ Exposição de trabalhadores a riscos durante inspeções em estruturas de armazenamento.

O **SilosTech** propõe uma alternativa simples, acessível e escalável: um sistema de monitoramento de nível baseado no sensor ultrassônico **HC-SR04**, integrado a um **Arduino Uno R3**.

O sensor mede a distância entre ele e a superfície dos grãos. A partir dessa leitura, o sistema estima a altura ocupada pelos grãos, calcula o volume e o percentual de ocupação do silo e disponibiliza essas informações por meio de um dashboard.

O objetivo é reduzir a dependência de medições manuais e permitir que o responsável acompanhe as informações do estoque sem depender exclusivamente de inspeções presenciais.

## 🎯 Objetivo

Desenvolver um sistema capaz de:

* Medir continuamente o nível de armazenamento de **soja e milho** dentro do silo;
* Estimar a altura da coluna de grãos a partir da leitura do sensor;
* Calcular informações como volume e percentual de ocupação;
* Registrar os dados em um banco de dados histórico;
* Gerar gráficos evolutivos e painéis analíticos;
* Auxiliar o responsável no acompanhamento do consumo e na identificação da necessidade de reposição.

## 🧮 Como o cálculo funciona

O sistema segue uma lógica geométrica simples:

| Etapa | O que é calculado                                         |
| ----- | --------------------------------------------------------- |
| 1️⃣   | Altura ocupada pelos grãos a partir da leitura do sensor  |
| 2️⃣   | Área da base do silo, considerando seu formato cilíndrico |
| 3️⃣   | Volume de grãos armazenados                               |
| 4️⃣   | Percentual de ocupação do silo                            |

### ⚠️ Margem de erro

O projeto considera uma margem de erro estimada de aproximadamente **5%**, principalmente devido ao nivelamento e à irregularidade da superfície dos grãos e à utilização de uma leitura pontual.

Por isso, os valores apresentados pelo sistema devem ser utilizados como **estimativas para apoio ao acompanhamento do estoque**.

## 🛠️ Escopo do Sistema

### O que está dentro:

✅ Sistema de login;
✅ Leitura de distância por meio do HC-SR04;
✅ Processamento dos valores coletados;
✅ Armazenamento das medições;
✅ Comparação das medições com limites previamente definidos;
✅ Emissão de alertas para condições fora do padrão;
✅ Dashboard com histórico das medições;
✅ Suporte ao cliente 24/7.

### O que está fora:

❌ Correção automática dos problemas identificados.

O SilosTech realiza o monitoramento e sinaliza situações que necessitam de atenção. A inspeção e as ações corretivas continuam sendo realizadas pelos responsáveis pelo armazenamento.

## 📐 Premissas

* O sensor deverá ser instalado em um local previamente definido, buscando reduzir sua exposição à poeira e outras condições que possam prejudicar seu funcionamento;
* O sistema será utilizado em estruturas adequadas para a instalação dos equipamentos;
* O sensor HC-SR04 e os componentes do sistema serão alimentados por uma fonte de 5V;
* Caso seja utilizada a rede elétrica de 127V ou 220V, deverá ser utilizada uma fonte ou adaptador adequado para conversão da tensão;
* O Arduino será responsável por receber e processar os dados coletados pelo sensor;
* Serão definidos valores de referência para as medições de distância conforme a geometria do silo;
* Quando for identificado um volume fora do padrão, o sistema poderá gerar um alerta no dashboard;
* A instalação deverá ser acompanhada por um funcionário responsável.

## 🚧 Restrições

* O sensor HC-SR04 possui alcance de até aproximadamente 4 metros;
* Caso o silo ultrapasse esse limite, deverá ser avaliada a necessidade de utilização de sensores adicionais;
* A margem de erro estimada é de aproximadamente 5%;
* O custo do projeto varia conforme a quantidade de silos monitorados e sensores utilizados;
* O Arduino não deverá ficar exposto diretamente aos grãos, poeira ou umidade;
* O sensor não deverá possuir obstruções no caminho do sinal ultrassônico;
* A instalação não poderá comprometer a estrutura ou o funcionamento do silo;
* O equipamento deverá ficar afastado de locais que apresentem risco de impacto, calor excessivo ou contato com água;
* O sistema deverá possuir proteção contra oscilações e interrupções de energia;
* O prazo de implementação será de até 14 dias após a assinatura do contrato, mediante disponibilidade do contratante.

## 👥 Público-Alvo

O SilosTech é direcionado principalmente a empresas e organizações que realizam o armazenamento em silos e possuem uma estrutura que justifique o investimento em sistemas de monitoramento.

### Principais públicos:

* Empresas de armazenamento de grãos;
* Cooperativas agrícolas;
* Grandes produtores rurais com silos próprios;
* Cerealistas e empresas do agronegócio;
* Empresas responsáveis pela gestão de unidades armazenadoras.

O sistema é direcionado principalmente a organizações que possuem silos de maior capacidade, maior volume de grãos armazenados e necessidade de reduzir riscos e possíveis prejuízos durante o período de armazenamento.

## 🌱 Impacto

| Pilar          | Impacto do SilosTech                                                                                       |
| -------------- | ---------------------------------------------------------------------------------------------------------- |
| 🌍 Ambiental   | Contribui para a redução de desperdícios relacionados ao armazenamento inadequado dos grãos                |
| 🧑‍🌾 Social   | Reduz a necessidade de verificações presenciais e a exposição dos trabalhadores a situações de risco       |
| 🏛️ Governança | Disponibiliza dados de estoque de forma rastreável para auxiliar no acompanhamento e na tomada de decisões |

## 🔄 Funcionamento do Sistema

O fluxo principal do SilosTech é:

**Silo → HC-SR04 → Arduino → Processamento → Banco de Dados → Dashboard → Usuário**

O sensor realiza a medição da distância até a superfície dos grãos. O Arduino recebe e processa essa informação, permitindo estimar a altura ocupada e gerar os dados de volume e ocupação.

As informações são armazenadas em um banco de dados, possibilitando a construção de um histórico das medições e sua visualização no dashboard.

## 👨‍💻 Equipe — Turma 1 ADSA

| Nome                 | RA       |
| -------------------- | -------- |
| Ana Beatriz Pamponet | 01261146 |
| Miguel Perez         | 01262019 |
| Ricardo Jaques       | 01262038 |
| Luca Kenzo           | 01262121 |
| Kaik Correia         | 01262125 |
| Davidy Costa         | 01262093 |

## 📚 Referências

* **Forbes Agro** — Brasil perdeu R$ 30,5 bilhões em 2023 com déficit de silos.
* **CONAB** — Acompanhamento da Safra Brasileira de Grãos.
* **Times Brasil/CNBC** — Quanto dinheiro se perde dentro de um silo?
* **Balde Branco** — Mais de seis trabalhadores morrem por mês em acidentes dentro de silos de grãos.

