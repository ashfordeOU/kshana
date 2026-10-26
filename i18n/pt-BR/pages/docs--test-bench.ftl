# docs--test-bench: translations (pt-BR)

# text
seg-245fe1f87b08 = Arquivo

# text
seg-e305279d5b11 = Conteúdo

# text
# c1: docs/TEST-BENCH.md
seg-292871e5747d = Fonte: <c1/>

# text
seg-d18a29239225 = Executar um receptor contra um cenário exportado

# text
# c1: kshana receiver-trust
seg-aa3498c7cb16 = Um fabricante de receptores que possua um simulador GNSS de laboratório pode reproduzir nele o movimento do veículo de um cenário do Kshana, registrar o que o receptor sob teste faz e pontuar esse registro com <c1/> contra eventos declarados antes da execução. O Kshana fornece o movimento, os horários dos eventos e a pontuação. Ele <b>não grava nenhum sinal</b>: nada exportado aqui sintetiza, modela ou transmite uma forma de onda de radiofrequência ou de banda base, e um evento exportado é um intervalo de tempo rotulado, não uma receita para produzir interferência. O simulador e seu operador fornecem os sinais, e o operador é responsável por executá-los somente onde isso seja permitido (conduzido ou blindado, segundo as próprias instruções de segurança do simulador).

# text
seg-414c7774d133 = Esta página é um método. Ela não publica resultados.

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
seg-798d75d3b65c = Aplica-se ao tipo de cenário <c1/> (um perfil de condução com atitude; as interrupções do estado de navegação são os eventos), e a <c2/> e <c3/> (um receptor estacionário durante a duração do cenário; o emissor de jamming de um cenário <c4/> é um evento ao longo da execução). Outros tipos de cenário informam por que não têm trajetória de veículo. <c5/> é o instante UTC do tempo zero do movimento (padrão 2024-01-01T00:{ "00" }:00Z); os cenários não trazem data de calendário própria para o movimento do veículo. Deve ser um instante UTC real, <c6/> (um <c7/> final é aceito) com o ano em { "2000" } a { "2099" } e todos os campos dentro da faixa; qualquer outra coisa é recusada. A saída é idêntica byte a byte para o mesmo cenário e época.

# text
# c1: time_s
# c2: x_m,y_m,z_m
# c3: vx_m_s,vy_m_s,vz_m_s
# c4: lat_deg,lon_deg,h_m
# c5: heading_deg,pitch_deg,roll_deg
# c6: utc
# c7: kshana_row
seg-c153d8ef8735 = uma linha por amostra: <c1/>, <c2/> fixas à Terra, <c3/>, <c4/> geodésicas, <c5/>, <c6/>, <c7/>

# text
seg-fa4c8c0d2b72 = a época, os referenciais, as unidades, as colunas e as tolerâncias de ida e volta desse CSV

# text
# c1: GGA
# c2: RMC
seg-8c74ca211e3a = sentenças NMEA { "0183" } <c1/> e <c2/> por amostra, com somas de verificação

# text
# c1: RESOLUTION: <ms>
# c2: longitude,latitude,altitude
seg-2b0fd541f1dc = uma linha <c1/> seguida de linhas <c2/> (escrita somente quando todo intervalo de amostragem é o mesmo número inteiro de milissegundos; quando é omitida, o comando informa o motivo no erro padrão)

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
seg-866a3c4870af = a execução como um documento <a1><c1/></a1> para uma gravação <c2/>: os eventos como verdade declarada, com <c3/>, <c4/>, <c5/>, o <c6/> de cada evento e a potência deixados para o laboratório preencher

# text
seg-9ea6a94d4586 = Referenciais e convenções

# text
# c1: x
# c2: z
# c3: lat_deg
# c4: lon_deg
# c5: h_m
# c6: h_m
seg-8d3b7d2ef815 = <b>Posição:</b> WGS { "84" }, fixa à Terra (ECEF: <c1/> pelo equador no meridiano de Greenwich, <c2/> pelo polo); <c3/>, <c4/>, <c5/> dão a mesma posição em coordenadas geodésicas, <c6/> acima do elipsoide.

# text
seg-93a2975d2a19 = <b>Velocidade:</b> eixos fixos à Terra, relativa à Terra.

# text
# c1: heading_deg
# c2: pitch_deg
# c3: roll_deg
seg-be05c2278e98 = <c1/> no sentido horário a partir do norte verdadeiro em [{ "0" }, { "360" }), <c2/> positivo com o nariz para cima, <c3/> positivo com a asa direita para baixo; guinada-arfagem-rolagem (3-2-1) do referencial local norte-leste-baixo para os eixos do corpo x para a frente, y para a direita, z para baixo. Uma fonte estacionária escreve zeros. O NMEA e o texto de waypoints não carregam atitude.

# text
# c1: gnss-ins
# c2: automotive-urban-canyon
# c3: RMC
# c4: atan2(v_east, v_north)
seg-3c3ad1295628 = <b>O rumo é a guinada do corpo, não a direção do deslocamento.</b> No perfil de condução <c1/> o corpo gira em guinada em ondas quadradas enquanto a velocidade segue, de modo que o rumo e o curso sobre o solo podem diferir em dezenas de graus (até cerca de { "77" } graus no cenário <c2/> incluído). O curso <c3/> do NMEA é o curso sobre o solo, a direção do vetor velocidade, de modo que um simulador que lê o rumo do arquivo de movimento e outro que lê o curso do arquivo NMEA veem ângulos diferentes. O curso sobre o solo do CSV é <c4/> de sua velocidade rotacionada para norte-leste-baixo.

# text
# c1: gnss-ins
# c2: h_m
# c3: automotive-urban-canyon
seg-224b53995157 = <b>A altura segue o cenário.</b> Para <c1/>, <c2/> é o próprio passo no plano tangente do tipo de cenário sobre sua verdade-terreno e não é mantida constante (cerca de { "7" } m ao longo dos { "180" } s de <c3/>); é o movimento do cenário, escrito como é.

# text
# c1: GGA
seg-f78a354f96ee = <b>Valores provisórios do NMEA <c1/>.</b> A qualidade do fix ({ "1" }), os satélites usados ({ "12" }) e o HDOP ({ "1.0" }) são escritos apenas para tornar a sentença bem formada. Não dizem nada sobre a geometria do cenário nem sobre qualquer estado do receptor.

# text
# c1: time_s
seg-f5cd510aac0c = <c1/> após a época, UTC, segundos intercalares não modelados.

# text
# c1: GGA
seg-d2a2f655760d = <b>As alturas do NMEA são elipsoidais.</b> A altitude <c1/> contém a altura elipsoidal e a separação do geoide é escrita como { "0.0" }. Um simulador que trate a altitude como altura acima do nível médio do mar colocará o veículo deslocado pela ondulação local do geoide.

# text
seg-ee3a9a3ec84d = <b>Tolerâncias de ida e volta</b> (testadas lendo cada arquivo de volta): posição no CSV { "0.1" } mm, latitude e longitude { "1e-9" } grau, velocidade { "0.1" } mm/s, ângulos { "1e-6" } grau; posição horizontal no NMEA { "5" } mm, altura { "1" } mm, velocidade { "0.001" } nó, curso { "0.001" } grau.

# text
seg-a554992d2694 = Carregar os arquivos em um simulador

# text
seg-757382614413 = Os simuladores de laboratório diferem, e este repositório não reproduz o manual de nenhum simulador. Verifique qual dos formatos acima o seu lê e quais são seus requisitos declarados:

# text
# c1: gnss-ins
# c2: [time] step_s
seg-cc49ceccea20 = Muitos importadores de movimento esperam uma taxa de atualização fixa, comumente de { "10" } Hz. O cenário <c1/> avança a { "0.1" } s; para um cenário estacionário, defina <c2/> com a taxa que o seu simulador quer.

# text
seg-e98bf4bf6c6e = Alguns importadores descartam amostras que caem entre segundos inteiros, ou ignoram a coluna de tempo e usam a ordem das linhas. Inicie o movimento em um segundo inteiro e mantenha a grade regular.

# text
# c1: run1.motion.csv
# c2: run1.motion.json
seg-3c470262eb15 = Um importador de CSV que permita mapear colunas pode ler <c1/> diretamente: escolha as colunas fixas à Terra ou geodésicas e defina suas unidades a partir de <c2/>. Truncar as casas decimais produz aceleração falsa, portanto mantenha a precisão escrita.

# text
# c1: run1.events.csv
seg-41a2bfe45b37 = O arquivo contém apenas movimento. Configure a constelação, a interferência e o front end do receptor no simulador, e sincronize-os com os eventos em <c1/>.

# text
seg-024ab011a2e3 = Nenhuma interface de script de fornecedor é escrita pelo Kshana.

# text
seg-6d67d4e2cdf0 = Verificado com os leitores de um simulador de código aberto

# text
# c1: tests/testbench_gpssdrsim_oracle.rs
# c2: xval/testbench-gpssdrsim/PREREGISTRATION.md
seg-e4ce0597a644 = Os leitores de movimento do gps-sdr-sim (MIT, commit 28ca29a6) receberam as exportações de oito cenários incluídos. Cada leitor devolveu a trajetória exportada (<c1/>, pré-registrado em <c2/>):

# text
seg-3caed3fc2e47 = Opção do gps-sdr-sim

# text
seg-ad9e78555851 = Entrada fornecida

# text
seg-4f9be75880d3 = Maior diferença em relação ao CSV

# text
# c1: -g
seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

# text
# c1: run1.nmea
seg-e03dd1d45ced = <c1/> como escrito

# text
seg-8d28fbcc4c4a = { "1.2" } mm

# text
# c1: -x
seg-fd39660fcb73 = <c1/> (time, latitude, longitude, height)

# text
seg-c4e171cbf0de = { "0.15" } mm

# text
# c1: -u
seg-390b0c0fb695 = <c1/> (time, x, y, z)

# text
seg-ff26559a85e8 = exato

# text
# c1: -u
seg-f4c13a327904 = Não dê a <c1/> o CSV de movimento completo. O leitor dele comporta { "100" } caracteres por linha, e uma linha do CSV tem cerca de { "160" } caracteres, de modo que cada linha é lida como duas amostras. A linha de cabeçalho é lida como mais uma amostra sem nenhum número.

# text
# c1: gnss-ins
# c2: gnss-ins-maritime
seg-43cc6f9c50b2 = O gps-sdr-sim comporta no máximo { "3000" } amostras, { "300" } s a seus { "10" } Hz fixos, e ignora a coluna de tempo. As exportações de <c1/> avançam a exatamente { "0.1" } s. Cenários mais longos, como o <c2/> de 20 minutos, são lidos apenas até os primeiros { "300" } s.

# text
seg-500243b6e402 = Isto verifica que os arquivos são lidos como foram escritos. Não verifica a física do cenário nem nada do que o simulador transmite.

# text
seg-a4c4514276e9 = { "2" }. Declare o que você vai pontuar antes da execução

# text
# c1: run1.events.toml
# c2: receiver-trust
seg-3a3e2be36c65 = O arquivo de eventos traz os intervalos que o cenário define. Copie <c1/> para um cenário <c2/>, acrescente qualquer previsão que queira verificar e fixe os limiares e as tolerâncias dos monitores <b>antes</b> de o receptor rodar. Não os ajuste depois de ver o registro; o cenário, os limiares e o SHA-256 do registro estão todos no hash do resultado.

# text
# c1: jamming
# c2: jamming
# c3: other
# c4: kind
seg-d07b9ad8cfa9 = Os eventos exportados trazem o tipo próprio do cenário: o emissor de jamming de um cenário <c1/> é <c2/>; uma interrupção do estado de navegação é <c3/>, porque o cenário declara que o GNSS estava indisponível, não como. Altere <c4/> para corresponder ao que você configurar o simulador para fazer.

# text
seg-faa87b3ba315 = { "3" }. Execute o receptor

# text
seg-0a3b63cf5615 = Inicie o receptor e seu registrador, inicie o cenário do simulador com o arquivo de movimento e deixe a execução cobrir o intervalo de calibração, todos os eventos e uma margem após o último. Guarde o registro do próprio receptor (UBX, observações RINEX { "3" }, um CSV de registrador Android ou NMEA com sentenças de status de satélite). Um registro sem intensidade de sinal por satélite ainda pode ser pontuado pela posição do próprio receptor, mas os monitores de relação portadora-ruído precisam dela.

# text
seg-fbbc12dfeb3f = { "4" }. Alinhe os relógios

# text
# c1: receiver-trust
# c2: d
# c3: d
# c4: onset_s
# c5: end_s
# c6: name
seg-5828311af3d4 = <c1/> conta os tempos dos eventos a partir da primeira época do registro do receptor; o arquivo de movimento conta a partir de sua primeira amostra. Se o registro começa <c2/> segundos antes da primeira amostra do movimento, some <c3/> a todo <c4/> e <c5/>. Registre o deslocamento e como você o mediu, e declare-o no <c6/> do cenário ou em um comentário, já que um deslocamento errado move todas as pontuações. Os tempos dos eventos sozinhos não revelam o deslocamento; use o marcador de início de cenário do simulador ou as próprias marcas de tempo do receptor.

# text
seg-22f7b68c445b = { "5" }. Pontue

# text
# c1: bench-session.result.json
# c2: .trust.csv
# c3: .trust.svg
# c4: detected
# c5: late
# c6: missed
# c7: not-evaluable
seg-e024186a2874 = grava <c1/>, <c2/> e <c3/>. Para cada evento, o resultado informa os falsos alarmes antes do início, o primeiro alarme e seus monitores, a latência e o desfecho (<c4/>, <c5/>, <c6/>, <c7/>), além de uma queda prevista e observada da relação portadora-ruído onde você declarou uma previsão. Uma discordância é informada, nunca ajustada para desaparecer. Veja <a1>RECEIVER-TRUST.md</a1>.

# text
seg-5fa1e4890f91 = Para ver em quais linhas de referenciais públicos a sessão fornece evidências em apoio de:

# text
seg-abc6aaf44c95 = Veja <a1>compliance/README.md</a1>. Esse relatório descreve as evidências nas execuções que você fornece; não faz nenhuma constatação sobre o receptor nem sobre qualquer referencial.

# text
seg-69fa39640c2d = { "6" }. Vincule o ciclo completo em um único pacote assinado

# text
# c1: kshana evidence round-trip
# c2: run1.conditions.json
seg-f24e2dd64c47 = Após a pontuação, <c1/> amarra os quatro registros: o cenário que você exportou, as <a1>condições de teste</a1> do laboratório, o registro do receptor e a pontuação. Preencha <c2/> (o caminho e o SHA-256 do registro, o receptor sob teste, o tipo e a potência declarada de cada evento) e então:

# text
# c1: round-trip-pack/config.json
# c2: round_trip
# c3: kshana.round-trip/1
# c4: scenario_sha256
# c5: conditions_hash
# c6: log_sha256
seg-78bed55de550 = <c1/> traz um bloco <c2/> (<c3/>) com <c4/>, <c5/>, <c6/> e a pontuação (eventos detectados dos avaliáveis, primeiro alarme), coberto pelos hashes do manifesto e pela assinatura. O comando recusa um pacote cujas condições e eventos de pontuação discordam, ou cujo hash declarado do registro não é o do registro. Como todo pacote de evidências, é um registro técnico, não um parecer jurídico.

# text
seg-5fe6548911da = Exemplo prático: gps-sdr-sim gravando um arquivo

# text
seg-eeccc823e109 = Este exemplo usa o simulador de código aberto gps-sdr-sim apenas para <b>gravar um arquivo de banda base</b> a partir do movimento exportado. O Kshana não transmite, e nada nesta página automatiza a reprodução desse arquivo por um rádio. Se o seu laboratório reproduz um arquivo desse tipo em um receptor, isso é responsabilidade do seu operador, feito somente onde for permitido (com cabo ou blindado, seguindo as instruções de segurança do simulador e do próprio rádio), e o Kshana não o documenta nem o encapsula.

# text
# c1: run1.iq
# c2: tests/round_trip_pack.rs
seg-db81fdadfd19 = O que o laboratório fizer em seguida com <c1/> acontece fora do Kshana. O registro do próprio receptor, seja como for obtido, é o que o passo { "5" } pontua e o passo { "6" } vincula. Os arquivos e as verificações que o Kshana faz em suas próprias exportações são testados apenas com dados sintéticos (<c2/>); nenhuma execução de laboratório é alegada aqui.

# text
seg-dffcbdb8e6c3 = O que este método não faz

# text
seg-d0b62c238953 = Ele não produz um sinal e não diz que interferência um simulador deve gerar. Os eventos dizem quando, não o quê.

# text
seg-3aa11bed60c8 = Uma única sessão é um único ponto de dados. O resultado descreve aquele registro sob aquela configuração e nada diz sobre outros receptores, firmware, antenas ou interferência real.

# text
seg-b156403456e4 = Alturas, taxas e alinhamento de tempo cabem ao operador conferir com o simulador; a exportação declara suas próprias convenções e tolerâncias, e nada além.

# text
seg-337ff53bc890 = <s1>Anterior</s1>kshana-bench

# text
seg-87be81f5e600 = <s1>Próximo</s1>Mapeamento de compliance
