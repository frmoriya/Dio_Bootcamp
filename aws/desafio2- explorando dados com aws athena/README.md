# Modulo AWS
# Desafio2: Explorando Dados Demográficos com Serviços de Big Data na AWS

# Objetivo do desafio
- Criar bucket no Amazon S3
- Criar Glue Crawler
- Criar aplicação no Amazon Athena



Informações consultadas:
- Aulas do Modulo AWS (Bootcamp DIO)
- Scripts e arquivos disponibilizado pelo professor Cassiano Peres.

### Serviços utilizados nessa atividade prática
 - Amazon S3
 - Amazon Glue
 - Amazon Athena


### Etapas para desenvolvimento

### Criar bucket no Amazon S3

- Amazon S3 Console -> Buckets -> Create bucket -> Bucket name [nome_do bucket] - Create bucket
- Create folder (Criar uma pasta chamada ```/output``` e outra com o nome do seu conjunto de dados. Este nome irá definir o nome da tabela criada no Glue)
- Upload dos arquivos de dados localizados na pasta ```/data```

- https://docs.aws.amazon.com/pt_br/AmazonS3/latest/userguide/create-bucket-overview.html

#### Criar Glue Crawler

- Amazon Glue Console -> Crawlers -> Add Crawler
- Source type [Data Stores] -> Crawl all folders
- Data store [S3] -> Include path [caminho do diretório dos dados de entrada]
- Create IAM Role
- Frequency [Run on demand]
- Database name [seu_nome_de_db]
- Group behavior [Create a single schema for each S3 path]
- Finish
- Databases -> Tables -> Visualizar dados das tabelas criadas

- https://docs.aws.amazon.com/pt_br/athena/latest/ug/data-sources-glue.html

### Criar aplicação no Amazon Athena

- Query editor -> Settings -> Manage settings -> Query result location and encryption -> Browse S3 -> selecionar o bucket criado
- Selecionar Database -> criar queries (exemplos na pasta ```/src```)
- Verificar queries não salvas no bucket criado no S3
- Salavar queries -> Executar novamente -> Verificar no bucket criado no S3

- https://docs.aws.amazon.com/pt_br/athena/latest/ug/getting-started.html
