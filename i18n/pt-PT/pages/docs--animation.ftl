# docs--animation: translations (pt-PT)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Fonte: <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> transforma a série temporal de uma execução em algo que se move: um ficheiro Scalable Vector Graphics (SVG) animado, um único leitor HyperText Markup Language (HTML) autónomo, ou uma sequência numerada de fotogramas SVG para um codificador de vídeo. Uma campanha é reproduzida como as suas fases (jamming, spoofing, holdover, alarme de integridade) com os seus alarmes assinalados; uma execução de espetro reproduz a sua cascata linha a linha; uma passagem em órbita terrestre baixa (LEO) reproduz a sua ligação por banda e, com um spoofer, as estatísticas do monitor época a época.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Código: <c1/>. Testes: <c2/>.

# text
seg-0b708f65d8d3 = O que é, e o que não é

# text
seg-ad8c12a3b510 = O exportador lê o documento de resultados que a execução já escreveu. Não volta a executar a física, não reamostra, suaviza nem interpola entre amostras (exceto o único segmento de reta que termina um traço no cursor), e não acrescenta nenhum número próprio. Uma animação é, portanto, tão boa quanto a execução que está por trás dela. O seu nível é <b>MODELLED, coerência interna</b>: é uma representação, nunca evidência, e não leva nenhuma linha própria da matriz de verificação.

# text
seg-f37311ad7ef0 = Saídas

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Cada formato é escrito junto do cenário, ao lado dos habituais <c1/>, <c2/> e <c3/>:

# text
seg-f2ce7fc60cdf = Formato

# text
seg-51a8df15f356 = Escrito como

# text
seg-3ea93ae372ca = O que contém

# text
seg-3603593b9799 = Um SVG animado com keyframes de Cascading Style Sheets (CSS) e sem script: os traços desenham-se por trás de um cursor de tempo em movimento, os eventos aparecem no seu instante, as linhas da cascata revelam-se por ordem temporal. Repete-se em ciclo, com uma pausa de { "1.5" } s na imagem final.

# text
seg-6c91078b434e = Um ficheiro com script e estilo em linha e sem recursos externos: reproduzir e pausar, um cursor de arrasto, velocidade (0.25x a 4x), todos os painéis num cursor sincronizado, um valor em tempo real por traço, a faixa de fases e uma lista de eventos que salta para o ponto ao clicar. A barra de espaços reproduz ou pausa, as teclas de seta avançam passo a passo, Home e End saltam.

# text
# c1: frame_0000.svg
# c2: frame_0001.svg
# c3: manifest.json
seg-df02d37cd729 = <c1/>, <c2/>, … e <c3/>.

# text
# c1: --animate
# c2: --animate svg,html
# c3: all
# c4: --animate-fps
# c5: --animate-duration
seg-2e5ebd60cad0 = <c1/> pode ser repetido e aceita uma lista separada por vírgulas (<c2/>) ou <c3/>. <c4/> ({ "1" } a { "60" }, predefinição { "12" }) e <c5/> ({ "0.5" } s a { "600" } s, predefinição { "8" } s) definem a reprodução; a sequência de fotogramas está limitada a { "7,200" } fotogramas.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Quando <c1/> é executado no mesmo comando, o leitor HTML lista os ficheiros de exportação escritos ao seu lado (CZML, KML, GeoJSON, STK, SigMF) como ligações relativas a esses ficheiros irmãos; só é escrita uma ligação para um nome de ficheiro simples, pelo que nenhuma pode sair da pasta nem alcançar a rede. O relatório avançado (<c2/>) incorpora o desenho animado sempre que o resultado tem uma série temporal, quer <c3/> tenha sido executado ou não.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Quando <c1/> é executado, <c2/> ganha um bloco <c3/>: os formatos, as imagens por segundo (fps), a duração, o número de fotogramas, o intervalo de tempo, os títulos dos painéis, os caminhos JSON de onde cada traço foi lido (<c4/>) e quaisquer séries encontradas mas não desenhadas (<c5/>). Sem <c6/> o resultado é idêntico byte a byte ao de uma execução simples.

# text
seg-fa8388ae976e = A sequência de fotogramas

# text
# c1: round(duration × fps)
# c2: t_start + (t_end − t_start) × i / (n − 1)
# c3: manifest.json
# c4: fps
# c5: duration_s
# c6: frame_count
# c7: frame_pattern
# c8: frame_%04d.svg
# c9: t_start
# c10: t_end
# c11: frame_times
# c12: frame_NNNN.svg
seg-db4b53abe7d6 = A sequência tem exatamente <c1/> fotogramas. O fotograma <em>i</em> mostra a cronologia até <c2/>, pelo que o primeiro fotograma é o início e o último é a imagem final. <c3/> regista <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), o tamanho em píxeis, <c9/>, <c10/>, o tempo de missão de cada fotograma (<c11/>), as fases, os eventos e as fontes. Uma nova exportação para o mesmo diretório remove primeiro todos os <c12/> já aí existentes (e mais nada), pelo que uma sequência mais curta nunca deixa para trás fotogramas de uma mais longa para o codificador ler.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Os fotogramas são SVG, não Portable Network Graphics (PNG). Um <c1/> compilado com a biblioteca <c2/> lê-os diretamente, à taxa com que a sequência foi escrita ({ "24" } no exemplo acima; o <c3/> do manifesto):

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = Um <c1/> sem <c2/> para com "no decoder found for: svg". Rasterize primeiro os fotogramas, por exemplo com <c3/>, e codifique os PNG:

# text
seg-fc61f546f605 = Acessibilidade e tema

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Esquema de cores.</b> O leitor segue <c1/> e redesenha-se quando este muda; o SVG animado leva uma variante clara da sua paleta sob a mesma media query. Os fotogramas usam a paleta escura dos gráficos estáticos, porque um vídeo não tem esquema.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Movimento reduzido.</b> Sob <c1/> o SVG animado desativa todas as animações e mostra a imagem final (os seus estilos de base são o estado final, pelo que nada fica oculto), e o leitor abre em pausa na imagem final em vez de reproduzir; o utilizador pode na mesma arrastar o cursor ou premir Play.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = O SVG tem um <c1/> e um <c2/>; os controlos do leitor são botões rotulados, uma entrada de intervalo com um valor de tempo falado e um seletor.

# text
seg-f5356cbf3675 = O que conta como série temporal

# text
seg-ba43cf36ac20 = Os documentos de resultados diferem consoante o tipo de cenário, pelo que o exportador reconhece as formas que o motor emite e não uma lista de tipos de cenário:

# text
# c1: t
# c2: t_s
# c3: t_hours
# c4: t_min
# c5: t_days
# c6: k
# c7: epochs
# c8: quantum.series[].error_ns
# c9: classical.series[].error_ns
seg-952d09156712 = <b>Uma matriz de registos com um campo de tempo</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, ou <c6/> numa matriz <c7/>) que aumenta estritamente ao longo da matriz. Cada um dos outros campos numéricos torna-se um traço; o mesmo campo sob duas raízes (<c8/> e <c9/>) partilha um painel.

# text
# c1: t_s
# c2: t
# c3: times_s
# c4: channels
# c5: {unit, values}
# c6: campaign
# c7: spectrum
# c8: *_hz
# c9: spectrum
seg-2c3abce3f70a = <b>Um objeto com uma matriz de tempo estritamente crescente</b> (<c1/>, <c2/>, <c3/>, …) ao lado de matrizes do mesmo comprimento: matrizes numéricas irmãs, um mapa <c4/> de registos <c5/> (a cronologia de <c6/>), uma matriz de registos que contêm tais matrizes (as bandas de <c7/>, as trajetórias de satélites de uma constelação) e uma matriz bidimensional cujas linhas correspondem ao eixo do tempo com um eixo de frequência <c8/> irmão (a cascata de <c9/>).

# text
# c1: phases
# c2: name
# c3: t0_s
# c4: t1_s
# c5: events
# c6: t_s
# c7: label
# c8: alarm
# c9: *_t_s
seg-0edf8c38f9eb = Ao lado dessa matriz de tempo, <c1/> (<c2/>, <c3/>, <c4/>) tornam-se a faixa de fases e <c5/> (<c6/>, <c7/>, <c8/>) tornam-se os marcadores. Os escalares <c9/> de uma banda (a sua primeira perda de bloqueio, a sua razão portadora-densidade de ruído mais baixa) também são assinalados.

# text
# c1: omitted
seg-608c4fed9e98 = Os traços com unidade partilham um painel quando as suas magnitudes estão dentro de um fator de { "100" }, pelo que uma guarda de { "50" } ns não achata um erro de { "2" } ns. São desenhados no máximo { "6" } painéis de { "6" } traços; os restantes são listados em <c1/>. Os traços com mais de { "2,400" } amostras são reduzidos por um passo uniforme que mantém a última amostra, e uma cascata com mais de { "96" } × { "120" } células é reduzida por média (em potência, para células em decibéis, para que um jammer estreito não seja diluído).

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = Entre os tipos de cenário LEO, todos os cenários <c1/>, <c2/> e <c3/> incluídos animam. <c4/> anima nos seus modos Doppler, de posicionamento conjunto e de temporização (uma execução de temporização precisa de <c5/>, o que faz cada linha reportar o seu erro de tempo e o sigma previsto em cada época) e é recusado no seu modo de cobertura polar. <c6/> anima a sua atualização a meio da passagem e é recusado para as análises de codificação, de intervalo de ajuste e de comparação de modelos. Os resultados de <c7/> e <c8/> não têm eixo temporal e são recusados.

# text
seg-eb31ec7a07b7 = Determinismo

# text
seg-82bcf8a5b042 = A saída é uma função pura do documento de resultados e das opções: sem relógio, sem número aleatório, sem iteração de mapa de hashes, sem acesso a ficheiros ou à rede na biblioteca, e sem marca temporal em lado nenhum, pelo que o mesmo cenário, semente e opções dão ficheiros idênticos byte a byte. O módulo compila para WebAssembly sem alterações; apenas a interface de linha de comandos escreve ficheiros.

# text
seg-77e1f459f3d3 = Utilização como biblioteca

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> anima um documento de resultados que já tem, e <c2/> devolve o que seria desenhado sem o renderizar.

# text
seg-0857a94a948e = Limites

# text
# c1: animate_scenario
seg-02f0f03af2fb = O wheel de Python e o módulo WebAssembly ainda não expõem o exportador; é acessível a partir da linha de comandos, da biblioteca Rust e da ferramenta <c1/> do servidor Model Context Protocol (MCP) (que devolve no máximo { "120" } fotogramas numa resposta).

# text
seg-cd3ec7b403ba = Os eixos são lineares. Uma série que abrange muitas décadas (o crescimento do erro de um relógio de { "0.1" } ns a um microssegundo) parece plana até tarde na execução.

# text
seg-ed21d370a73c = O SVG animado baseia-se na animação CSS de um retângulo de recorte; os motores atuais do Chromium, Firefox e Safari reproduzem-no, enquanto um visualizador sem animação CSS mostra a imagem final.

# text
seg-9dfb9596ecf3 = As campanhas de varrimento, Monte Carlo e composição não têm eixo temporal e são recusadas; as estatísticas de resumo de um varrimento ou de um conjunto não são uma série temporal. Uma campanha encadeada anima.

# text
seg-be1f1afe7424 = <s1>Anterior</s1>Relatórios de execução

# text
seg-6817433f69f6 = <s1>Seguinte</s1>Exportações e importações de interoperabilidade
