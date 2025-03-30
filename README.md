# Teste de Web Scraping

O teste de web scraping foi o primeiro que efetivamente realizei. Nele, precisei escolher qual linguagem e ferramentas utilizar. Decidi optar pelo Python como linguagem, pois, embora esteja estudando Java atualmente, provavelmente não teria agilidade para executar todas as demais tarefas nessa última. Diante da simplicidade do Python e da vasta gama de recursos disponíveis em seu ecossistema, ele se mostrou a escolha mais adequada. Para essa tarefa inicial, utilizei especificamente o Selenium para Python em conjunto com o WebDriver para automatizar a interação com a página web. Além disso, tentei aplicar o padrão de PageObject para realizar as automações de forma mais declarativa.

Os desafios que encontrei ao tentar coletar os arquivos da página do Gov foram principalmente aprender a configurar o navegador para que, ao interagir com os arquivos que precisavam ser baixados, o download fosse realizado imediatamente. Isso me obrigou a entender como ajustar as preferências de comportamento do navegador, de modo que o processo de download funcionasse de maneira adequada.

# Teste de Transformação de Dados

A atividade de transformação de dados foi uma das mais enriquecedoras, pois eu nunca havia realizado tarefas de coleta de dados em arquivos PDF nem utilizado uma ferramenta específica para esse fim. Para executá-la, utilizei o tabula-py para extrair as tabelas do PDF e, para processar os dados e transformá-los em um arquivo CSV, empreguei a biblioteca pandas.

Eu nunca tinha usado nem o tabula nem o pandas. Isso me fez gastar um tempo considerável pesquisando formas de utilizá-los. Além disso, me deparei com comportamentos que eu não tinha muita noção de como tratar. Porém, depois de algumas horas me adaptando ao uso dessas ferramentas as dificuldades foram sendo sanadas.

# Teste de Banco de Dados

Esse foi o teste mais desafiador, pois, apesar de já ter tido contato com bancos de dados devido à minha atuação na área de testes automatizados há muito tempo, não havia aprofundado esse conhecimento na prática. Infelizmente, isso resultou em um débito técnico que me impediu de concluir a atividade em sua totalidade. Embora eu tenha conseguido realizar a etapa de modelagem do banco de dados para receber as informações dos arquivos CSV, não fui capaz de transferir os dados para o banco em si e, consequentemente, não pude executar a análise da terceira etapa.

![[Pasted image 20250330163430.png]]


Esse fato evidenciou uma lacuna no meu conhecimento, da qual agora tenho consciência e pretendo corrigir por meio de estudos direcionados.

# Teste de API

O teste de API foi uma tarefa em que eu tinha maior domínio da metodologia a ser empregada, principalmente no back-end, embora não possuísse conhecimento prévio nem de ferramentas Python nem do Vue.js. Apesar disso, a experiência foi positiva: utilizei o Vue.js sem adicionar nenhuma biblioteca JavaScript adicional e, no back-end, optei pelo Flask. Decidi seguir uma abordagem simples e direta. Após algumas etapas de desenvolvimento, consegui concluir a atividade.