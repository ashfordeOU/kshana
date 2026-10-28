# docs--animation: translations (pt-BR)

# text
# c1: docs/ANIMATION.md
seg-8428c41646b0 = Fonte: <c1/>

# text
# c1: --animate
seg-a61d094894fd = <c1/> transforma a série temporal de uma execução em algo que se move: um arquivo Scalable Vector Graphics (SVG) animado, um único player HyperText Markup Language (HTML) autocontido, ou uma sequência numerada de quadros SVG para um codificador de vídeo. Uma campanha é reproduzida como suas fases (jamming, spoofing, holdover, alarme de integridade) com seus alarmes marcados; uma execução de espectro reproduz sua cascata linha por linha; uma passagem em órbita baixa da Terra (LEO) reproduz seu enlace por banda e, com um spoofer, as estatísticas do monitor época a época.

# text
# c1: src/animation.rs
# c2: tests/animation.rs
seg-39d69331035d = Código: <c1/>. Testes: <c2/>.

# text
seg-0b708f65d8d3 = O que é e o que não é

# text
seg-ad8c12a3b510 = O exportador lê o documento de resultado que a execução já gravou. Ele não executa de novo a física, não reamostra, não suaviza nem interpola entre amostras (exceto pelo único segmento de reta que termina um traço no cursor), e não acrescenta nenhum número próprio. Uma animação é, portanto, exatamente tão boa quanto a execução que está por trás dela. Seu nível é <b>MODELLED, consistência interna</b>: é uma renderização, nunca evidência, e não traz linha própria na matriz de verificação.

# text
seg-f37311ad7ef0 = Saídas

# text
# c1: result.json
# c2: chart.svg
# c3: report.html
seg-0c21f772932e = Cada formato é gravado ao lado do cenário, junto com os habituais <c1/>, <c2/> e <c3/>:

# text
seg-f2ce7fc60cdf = Formato

# text
seg-51a8df15f356 = Gravado como

# text
seg-3ea93ae372ca = O que contém

# text
seg-3603593b9799 = Um SVG animado com keyframes de Cascading Style Sheets (CSS) e sem script: os traços se desenham atrás de um cursor de tempo em movimento, os eventos aparecem em seu instante, as linhas da cascata se revelam em ordem de tempo. Ele se repete em laço, com uma pausa de { "1.5" } s na imagem finalizada.

# text
seg-6c91078b434e = Um arquivo com script e estilo embutidos e sem recurso externo: reproduzir e pausar, um controle deslizante de posição, velocidade (0.25x a 4x), todos os painéis em um cursor sincronizado, um valor ao vivo por traço, a faixa de fases e uma lista de eventos que salta ao clicar. A barra de espaço reproduz ou pausa, as setas avançam e recuam, Home e End saltam.

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
seg-2e5ebd60cad0 = <c1/> é repetível e aceita uma lista separada por vírgulas (<c2/>) ou <c3/>. <c4/> ({ "1" } a { "60" }, padrão { "12" }) e <c5/> ({ "0.5" } s a { "600" } s, padrão { "8" } s) definem a reprodução; a sequência de quadros é limitada a { "7,200" } quadros.

# text
# c1: --export
# c2: report.html
# c3: --animate
seg-7e012ab53f45 = Quando <c1/> é executado no mesmo comando, o player HTML lista os arquivos de exportação gravados ao lado dele (CZML, KML, GeoJSON, STK, SigMF) como links relativos a esses arquivos irmãos; um link só é gravado para um nome de arquivo simples, de modo que nenhum pode sair da pasta nem alcançar a rede. O relatório avançado (<c2/>) incorpora o desenho animado sempre que o resultado tem uma série temporal, quer <c3/> tenha sido executado ou não.

# text
# c1: --animate
# c2: result.json
# c3: animation
# c4: sources
# c5: omitted
# c6: --animate
seg-9c1d2204edab = Quando <c1/> é executado, <c2/> ganha um bloco <c3/>: os formatos, quadros por segundo (fps), duração, número de quadros, o intervalo de tempo, os títulos dos painéis, os caminhos JSON de onde cada traço foi lido (<c4/>) e qualquer série encontrada mas não desenhada (<c5/>). Sem <c6/>, o resultado é idêntico byte a byte ao de uma execução simples.

# text
seg-fa8388ae976e = A sequência de quadros

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
seg-db4b53abe7d6 = A sequência tem exatamente <c1/> quadros. O quadro <em>i</em> mostra a linha do tempo até <c2/>, de modo que o primeiro quadro é o início e o último é a imagem finalizada. <c3/> registra <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), o tamanho em pixels, <c9/>, <c10/>, o tempo de missão de cada quadro (<c11/>), as fases, os eventos e as fontes. Uma nova exportação no mesmo diretório remove primeiro todo <c12/> já existente ali (e nada mais), de modo que uma sequência mais curta nunca deixa para trás quadros de uma mais longa para o codificador ler.

# text
# c1: ffmpeg
# c2: librsvg
# c3: fps
seg-13b57b6d3c14 = Os quadros são SVG, e não Portable Network Graphics (PNG). Um <c1/> compilado com a biblioteca <c2/> os lê diretamente, na taxa com que a sequência foi gravada ({ "24" } no exemplo acima; o <c3/> do manifesto):

# text
# c1: ffmpeg
# c2: librsvg
# c3: rsvg-convert
seg-b20beeb45fac = Um <c1/> sem <c2/> para com "no decoder found for: svg". Rasterize os quadros primeiro, por exemplo com <c3/>, e codifique os PNGs:

# text
seg-fc61f546f605 = Acessibilidade e tema

# text
# c1: prefers-color-scheme
seg-7015f7ed77dc = <b>Esquema de cores.</b> O player segue <c1/> e se redesenha quando ele muda; o SVG animado traz uma variante clara de sua paleta sob a mesma media query. Os quadros usam a paleta escura dos gráficos estáticos, porque um vídeo não tem esquema.

# text
# c1: prefers-reduced-motion: reduce
seg-c3b1f19f191b = <b>Movimento reduzido.</b> Sob <c1/>, o SVG animado desliga todas as animações e mostra a imagem finalizada (seus estilos base são o estado final, de modo que nada fica oculto), e o player abre pausado na imagem finalizada em vez de reproduzir; o usuário ainda pode arrastar o controle ou pressionar Play.

# text
# c1: <title>
# c2: <desc>
seg-f8dd26194eec = O SVG tem um <c1/> e um <c2/>; os controles do player são botões rotulados, uma entrada de intervalo com um valor de tempo falado e uma lista de seleção.

# text
seg-f5356cbf3675 = O que conta como série temporal

# text
seg-ba43cf36ac20 = Os documentos de resultado diferem de um tipo de cenário para outro, de modo que o exportador reconhece as formas que o motor emite, e não uma lista de tipos de cenário:

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
seg-952d09156712 = <b>Um array de registros com um campo de tempo</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> ou <c6/> em um array <c7/>) que cresce estritamente ao longo do array. Todo outro campo numérico se torna um traço; o mesmo campo sob duas raízes (<c8/> e <c9/>) compartilha um painel.

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
seg-2c3abce3f70a = <b>Um objeto com um array de tempo estritamente crescente</b> (<c1/>, <c2/>, <c3/>, …) ao lado de arrays de mesmo comprimento: arrays numéricos irmãos, um mapa <c4/> de registros <c5/> (a linha do tempo de <c6/>), um array de registros que contêm tais arrays (as bandas de <c7/>, as trilhas de satélites de uma constelação) e um array bidimensional cujas linhas correspondem ao eixo de tempo, com um eixo de frequência irmão <c8/> (a cascata de <c9/>).

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
seg-0edf8c38f9eb = Ao lado desse array de tempo, <c1/> (<c2/>, <c3/>, <c4/>) tornam-se a faixa de fases e <c5/> (<c6/>, <c7/>, <c8/>) tornam-se os marcadores. Os escalares <c9/> de uma banda (sua primeira perda de travamento, sua menor relação portadora/densidade de ruído) também são marcados.

# text
# c1: omitted
seg-608c4fed9e98 = Traços com unidade compartilham um painel quando suas magnitudes estão dentro de um fator de { "100" }, de modo que uma guarda de { "50" } ns não achata um erro de { "2" } ns. No máximo { "6" } painéis de { "6" } traços são desenhados; o resto é listado em <c1/>. Traços com mais de { "2,400" } amostras são reduzidos por um passo uniforme que mantém a última amostra, e uma cascata com mais de { "96" } × { "120" } células é calculada em média (em potência, para células em decibéis, de modo que um jammer estreito não seja diluído).

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: leo-ppp
# c4: leo-pvt
# c5: trace = true
# c6: leo-navmsg
# c7: leo-signal
# c8: ntn-positioning
seg-c386389e4f1d = Entre os tipos de cenário LEO, todo cenário incluído <c1/>, <c2/> e <c3/> anima. <c4/> anima em seus modos Doppler, de posicionamento conjunto e de temporização (uma execução de temporização precisa de <c5/>, o que faz cada linha informar seu erro de tempo e sigma previsto em toda época) e é recusado em seu modo de cobertura polar. <c6/> anima sua atualização no meio da passagem e é recusado para as análises de codificação, de intervalo de ajuste e de comparação de modelos. Os resultados de <c7/> e <c8/> não trazem eixo de tempo e são recusados.

# text
seg-eb31ec7a07b7 = Determinismo

# text
seg-82bcf8a5b042 = A saída é uma função pura do documento de resultado e das opções: sem relógio, sem número aleatório, sem iteração de hash-map, sem acesso a arquivo ou rede na biblioteca e sem carimbo de tempo em lugar algum, de modo que o mesmo cenário, a mesma semente e as mesmas opções dão arquivos idênticos byte a byte. O módulo é compilado para WebAssembly sem alterações; apenas a interface de linha de comando grava arquivos.

# text
seg-77e1f459f3d3 = Uso como biblioteca

# text
# c1: kshana::animation::animate_result
# c2: extract_timeline
seg-b3fa41e48ea5 = <c1/> anima um documento de resultado que você já tem, e <c2/> retorna o que seria desenhado sem renderizá-lo.

# text
seg-0857a94a948e = Limites

# text
# c1: animate_scenario
seg-02f0f03af2fb = O wheel do Python e o módulo WebAssembly ainda não expõem o exportador; ele é acessível pela linha de comando, pela biblioteca Rust e pela ferramenta <c1/> do servidor Model Context Protocol (MCP) (que retorna no máximo { "120" } quadros em uma resposta).

# text
seg-cd3ec7b403ba = Os eixos são lineares. Uma série que abrange muitas décadas (o crescimento do erro de um relógio de { "0.1" } ns a um microssegundo) parece plana até tarde na execução.

# text
seg-ed21d370a73c = O SVG animado depende de animação CSS de um retângulo de recorte; os motores atuais Chromium, Firefox e Safari o reproduzem, enquanto um visualizador sem animação CSS mostra a imagem finalizada.

# text
seg-9dfb9596ecf3 = Campanhas de varredura, Monte Carlo e composição não trazem eixo de tempo e são recusadas; as estatísticas resumidas de uma varredura ou de um conjunto não são uma série temporal. Uma campanha encadeada anima.

# text
seg-be1f1afe7424 = <s1>Anterior</s1>Relatórios de execução

# text
seg-6817433f69f6 = <s1>Próximo</s1>Exportações e importações de interoperabilidade
