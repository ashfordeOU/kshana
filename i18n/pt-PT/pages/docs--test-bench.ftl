# docs--test-bench: translations (pt-PT)

# text
seg-245fe1f87b08 = Ficheiro

# text
seg-e305279d5b11 = Conteúdo

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Fonte: <c1/>

# text
seg-d18a29239225 = Executar um recetor contra um cenário exportado

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Um fabricante de recetores que possua um simulador GNSS de laboratório pode reproduzir através dele o movimento do veículo de um cenário Kshana, registar o que o recetor em ensaio faz e pontuar esse registo com <c1/> face a eventos declarados antes da execução. O Kshana fornece o movimento, os instantes dos eventos e a pontuação. Não escreve <b>nenhum sinal</b>: nada do que aqui se exporta sintetiza, modela ou transmite uma forma de onda de radiofrequência ou de banda de base, e um evento exportado é um intervalo de tempo etiquetado, não uma receita para produzir interferência. O simulador e o seu operador fornecem os sinais, e o operador é responsável por os executar apenas onde isso seja autorizado (por condução ou em blindagem, segundo as instruções de segurança do próprio simulador).

# text
seg-414c7774d133 = Esta página é um método. Não publica resultados.

# text
seg-a0ad7b35922f = { "1" }. Exportar

# text
# c1: gnss-ins
# c2: jamming
# c3: gnss-sim
# c4: jamming
# c5: --epoch
# c6: YYYY-MM-DDTHH:MM:SS
# c7: Z
seg-798d75d3b65c = Aplica-se ao tipo de cenário <c1/> (um perfil de condução com atitude; as interrupções do estado de navegação são os eventos) e a <c2/> e <c3/> (um recetor estacionário durante a duração do cenário; o emissor de interferência de um cenário <c4/> é um único evento ao longo da execução). Os outros tipos de cenário explicam porque não têm trajetória de veículo. <c5/> é o instante UTC do tempo zero do movimento (por predefinição 2024-01-01T00:{ "00" }:00Z); os cenários não têm data de calendário própria para o movimento do veículo. Tem de ser um instante UTC real, <c6/> (um <c7/> final é aceite) com o ano entre { "2000" } e { "2099" } e todos os campos dentro do intervalo; qualquer outra coisa é refused. A saída é idêntica byte a byte para o mesmo cenário e época.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = uma linha por amostra: <c1/>, <c2/> fixo à Terra, <c3/>, <c4/> geodésicos, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = a época, os referenciais, as unidades, as colunas e as tolerâncias de ida e volta desse CSV

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = frases NMEA { "0183" } <c1/> e <c2/> por amostra, com somas de verificação

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = uma linha <c1/> seguida de linhas <c2/> (escrito apenas quando todos os intervalos de amostragem são o mesmo número inteiro de milissegundos; quando é omitido, o comando indica o motivo no erro padrão)

# text
# c1: [[events]]
# c2: receiver-trust
seg-d09d2dab9a17 = os mesmos eventos como blocos <c1/> para um cenário <c2/>

# text
# c1: kshana.test-conditions/1
# c2: receiver-log
# c3: recording.path
# c4: recording.sha256
# c5: receiver.*
# c6: type
seg-866a3c4870af = a execução como um documento <a1><c1/></a1> para uma gravação <c2/>: os eventos como referência declarada, com <c3/>, <c4/>, <c5/>, o <c6/> de cada evento e a potência por preencher pelo laboratório

# text
seg-9ea6a94d4586 = Referenciais e convenções

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Posição:</b> WGS { "84" }, fixa à Terra (ECEF: <c1/> através do equador no meridiano de Greenwich, <c2/> através do polo); <c3/>, <c4/>, <c5/> dão a mesma posição em termos geodésicos, <c6/> acima do elipsoide.

# text
seg-93a2975d2a19 = <b>Velocidade:</b> eixos fixos à Terra, relativamente à Terra.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> no sentido horário a partir do norte verdadeiro em [{ "0" }, { "360" }), <c2/> positivo com o nariz para cima, <c3/> positivo com a asa direita para baixo; guinada-arfagem-rolamento (3-2-1) do referencial local norte-este-baixo para os eixos do corpo x para a frente, y para a direita, z para baixo. Uma fonte estacionária escreve zeros. O NMEA e o texto dos pontos de passagem não contêm atitude.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>O rumo é a guinada do corpo, não a direção de deslocação.</b> No perfil de condução <c1/>, o corpo guina em ondas quadradas enquanto a velocidade segue, pelo que o rumo e o curso sobre o solo podem diferir em dezenas de graus (até cerca de { "77" } graus no cenário incluído <c2/>). O curso NMEA <c3/> é o curso sobre o solo, a direção do vetor velocidade, pelo que um simulador que leia o rumo do ficheiro de movimento e outro que leia o curso do ficheiro NMEA veem ângulos diferentes. O curso sobre o solo do CSV é <c4/> da sua velocidade rodada para norte-este-baixo.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>A altura segue o cenário.</b> Para <c1/>, <c2/> é o avanço próprio do tipo de cenário no plano tangente da sua referência e não é mantido constante (cerca de { "7" } m ao longo dos { "180" } s de <c3/>); é o movimento do cenário, escrito tal como é.

# text
# c1: GGA
seg-f78a354f96ee = <b>Marcadores de posição NMEA <c1/>.</b> A qualidade da solução de posição ({ "1" }), os satélites utilizados ({ "12" }) e o HDOP ({ "1.0" }) são escritos apenas para que a frase fique bem formada. Não dizem nada sobre a geometria do cenário nem sobre qualquer estado do recetor.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> após a época, UTC, segundos intercalares não modelados.

# text
# c1: GGA
seg-d2a2f655760d = <b>As alturas NMEA são elipsoidais.</b> A altitude <c1/> contém a altura elipsoidal e a separação do geoide é escrita como { "0.0" }. Um simulador que trate a altitude como altura acima do nível médio do mar colocará o veículo desviado da ondulação local do geoide.

# text
seg-ee3a9a3ec84d = <b>Tolerâncias de ida e volta</b> (testadas ao reler cada ficheiro): posição CSV { "0.1" } mm, latitude e longitude { "1e-9" } grau, velocidade { "0.1" } mm/s, ângulos { "1e-6" } grau; posição horizontal NMEA { "5" } mm, altura { "1" } mm, velocidade { "0.001" } nó, curso { "0.001" } grau.

# text
seg-a554992d2694 = Carregar os ficheiros num simulador

# text
seg-757382614413 = Os simuladores de laboratório diferem, e este repositório não reproduz o manual de nenhum simulador. Verifique quais dos formatos acima o seu lê, e os requisitos que indica:

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = Muitos importadores de movimento esperam uma taxa de atualização fixa, habitualmente de { "10" } Hz. O cenário <c1/> avança a { "0.1" } s; para um cenário estacionário, defina <c2/> para a taxa que o seu simulador pretende.

# text
seg-e98bf4bf6c6e = Alguns importadores saltam amostras que caem entre segundos inteiros, ou ignoram a coluna de tempo e usam a ordem das linhas. Inicie o movimento num segundo inteiro e mantenha a grelha regular.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = Um importador de CSV que permita mapear colunas pode ler <c1/> diretamente: escolha as colunas fixas à Terra ou geodésicas e defina as respetivas unidades a partir de <c2/>. Truncar as casas decimais produz aceleração falsa, pelo que se deve manter a precisão escrita.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = O ficheiro contém apenas movimento. Configure a constelação, a interferência e o front end do recetor no simulador, e sincronize-os com os eventos em <c1/>.

# text
seg-024ab011a2e3 = O Kshana não escreve nenhuma interface de scripts de fabricante.

# text
seg-6d67d4e2cdf0 = Verificado com os leitores de um simulador de código aberto

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Os leitores de movimento do gps-sdr-sim (MIT, commit 28ca29a6) receberam as exportações de oito cenários incluídos. Cada leitor devolveu a trajetória exportada (<c1/>, pré-registada em <c2/>):

# text
seg-3caed3fc2e47 = opção do gps-sdr-sim

# text
seg-ad9e78555851 = Fornecer-lhe

# text
seg-4f9be75880d3 = Pior diferença face ao CSV

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> tal como escrito

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (tempo, latitude, longitude, altura)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (tempo, x, y, z)

# text
seg-ff26559a85e8 = exato

# text
# c1: -u
seg-f4c13a327904 = Não forneça a <c1/> o CSV de movimento completo. O seu leitor comporta { "100" } carateres por linha, e uma linha de CSV tem cerca de { "160" } carateres, pelo que cada linha é lida como duas amostras. A linha de cabeçalho é lida como mais uma amostra sem números.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = O gps-sdr-sim comporta no máximo { "3000" } amostras, { "300" } s a { "10" } Hz fixos, e ignora a coluna de tempo. As exportações <c1/> avançam exatamente a { "0.1" } s. Os cenários mais longos, como o <c2/> de 20 minutos, são lidos apenas até aos primeiros { "300" } s.

# text
seg-500243b6e402 = Isto verifica que os ficheiros são lidos tal como foram escritos. Não verifica a física do cenário nem nada do que o simulador transmite.

# text
seg-a4c4514276e9 = { "2" }. Declarar o que se vai pontuar antes da execução

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = O ficheiro de eventos indica os intervalos que o cenário define. Copie <c1/> para um cenário <c2/>, acrescente qualquer previsão que pretenda ver verificada e fixe os limiares do monitor e as tolerâncias <b>antes</b> de o recetor ser executado. Não os ajuste depois de ver o registo; o cenário, os limiares e o SHA-256 do registo constam todos do hash do resultado.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Os eventos exportados trazem o tipo próprio do cenário: o emissor de interferência de um cenário <c1/> é <c2/>; uma interrupção do estado de navegação é <c3/>, porque o cenário declara que o GNSS estava indisponível, não como. Altere <c4/> para corresponder ao que configurar o simulador para fazer.

# text
seg-faa87b3ba315 = { "3" }. Executar o recetor

# text
seg-0a3b63cf5615 = Inicie o recetor e o seu registador, inicie o cenário do simulador com o ficheiro de movimento e deixe que a execução cubra o intervalo de calibração, todos os eventos e uma margem após o último. Conserve o registo do próprio recetor (UBX, observações RINEX { "3" }, um CSV de registador Android, ou NMEA com frases de estado dos satélites). Um registo sem intensidade de sinal por satélite pode ainda ser pontuado com base na posição do próprio recetor, mas os monitores de portadora-ruído precisam dela.

# text
seg-fbbc12dfeb3f = { "4" }. Alinhar os relógios

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> conta os instantes dos eventos a partir da primeira época do registo do recetor; o ficheiro de movimento conta a partir da sua primeira amostra. Se o registo começar <c2/> segundos antes da primeira amostra do movimento, some <c3/> a cada <c4/> e <c5/>. Registe o desfasamento e a forma como o mediu, e indique-o em <c6/> do cenário ou num comentário, uma vez que um desfasamento errado desloca todas as pontuações. Os instantes dos eventos, por si só, não permitem conhecer o desfasamento; utilize o marcador de início de cenário do simulador ou as marcas temporais do próprio recetor.

# text
seg-22f7b68c445b = { "5" }. Pontuar

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = escreve <c1/>, <c2/> e <c3/>. Para cada evento, o resultado indica os falsos alarmes antes do início, o primeiro alarme e os seus monitores, a latência e o desfecho (<c4/>, <c5/>, <c6/>, <c7/>), além de uma descida prevista e observada da relação portadora-ruído quando declarou uma previsão. Uma discordância é comunicada, nunca ajustada para desaparecer. Ver <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Para ver as linhas de referenciais públicos para as quais a sessão fornece elementos de prova em apoio de:

# text
seg-abc6aaf44c95 = Ver <a1>compliance/README.md</a1>. Esse relatório descreve as evidências nas execuções que lhe forem fornecidas; não faz nenhuma apreciação sobre o recetor nem sobre qualquer referencial.

# text
seg-69fa39640c2d = { "6" }. Ligar a ida e volta num único pacote assinado

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Após a pontuação, <c1/> liga os quatro registos: o cenário que exportou, as <a1>condições de ensaio</a1> do laboratório, o registo do recetor e a pontuação. Preencha <c2/> (o caminho e o SHA-256 do registo, o recetor em ensaio, o tipo e a potência declarada de cada evento) e depois:

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> contém um bloco <c2/> (<c3/>) com <c4/>, <c5/>, <c6/> e a pontuação (eventos detetados entre os avaliáveis, primeiro alarme), abrangido pelos hashes do manifesto e pela assinatura. O comando recusa um pacote cujas condições e eventos de pontuação discordem, ou cujo hash do registo indicado não seja o do registo. Como qualquer pacote de evidências, é um registo técnico, não um parecer jurídico.

# text
seg-5fe6548911da = Exemplo prático: o gps-sdr-sim a escrever um ficheiro

# text
seg-eeccc823e109 = Este exemplo utiliza o simulador de código aberto gps-sdr-sim apenas para <b>escrever um ficheiro de banda de base</b> a partir do movimento exportado. O Kshana não transmite, e nada nesta página automatiza a reprodução desse ficheiro através de um rádio. Se o seu laboratório reproduzir tal ficheiro num recetor, isso é da responsabilidade do operador, feito apenas onde seja autorizado (por cabo ou em blindagem, seguindo as instruções de segurança do simulador e do rádio), e o Kshana nem o documenta nem o encapsula.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = Tudo o que o laboratório fizer depois com <c1/> acontece fora do Kshana. O registo do próprio recetor, seja como for obtido, é o que o passo { "5" } pontua e o passo { "6" } liga. Os ficheiros e as verificações que o Kshana faz às suas próprias exportações são testados apenas com dados sintéticos (<c2/>); aqui não se alega nenhuma execução em laboratório.

# text
seg-dffcbdb8e6c3 = O que este método não faz

# text
seg-d0b62c238953 = Não produz um sinal, e não diz que interferência um simulador deve gerar. Os eventos dizem quando, não o quê.

# text
seg-3aa11bed60c8 = Uma única sessão é um único ponto de dados. O resultado descreve esse registo nessa configuração, e não diz nada sobre outros recetores, firmware, antenas ou interferência real.

# text
seg-b156403456e4 = As alturas, as taxas e o alinhamento temporal cabem ao operador verificar face ao simulador; a exportação indica as suas próprias convenções e tolerâncias e nada mais.

# text
seg-337ff53bc890 = <s1>Anterior</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Seguinte</s1>Mapeamento de compliance
