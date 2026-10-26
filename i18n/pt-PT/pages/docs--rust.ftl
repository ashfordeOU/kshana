# docs--rust: translations (pt-PT)

# text
seg-d4a762001549 = Licença

# text
seg-4dbf41c0ec3b = Função

# attr:alt
seg-81a87d14efda = Kshana: a marca, uma retícula de bússola que assinala o instante preciso, ao lado do logótipo kshana

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>o instante preciso</em></b><br/> Um simulador de código aberto para a resiliência de PNT (posicionamento, navegação e temporização).

# text
seg-3b861b2f08b8 = Versão v{ $version }

# text
seg-ebe636986f46 = { "176" } de { "388" } capacidades validadas face a referências independentes externas

# text
seg-6a1906d8d4ad = Cerca de { "95" }% de cobertura de linhas, com um mínimo de { "85" }% na integração contínua

# text
seg-a9f4f2795fb5 = Licença: AGPL-3.0-only, ou uma licença comercial

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Ensaiar o minuto em que o GNSS fica às escuras: a consola de missão do Kshana, desenhada a partir de uma execução real do motor, uma campanha encadeada de jamming, spoofing, holdover e integridade sobre os { "102" } satélites do GPS, Galileo, BeiDou e GLONASS

# text
seg-d1153c5e9112 = Ensaiar o minuto em que o GNSS fica às escuras

# text
seg-d1a3f78ad8e0 = Experimente primeiro sem nada para instalar: o <a1>Kshana Studio</a1> executa o motor completo no seu navegador, compilado para WebAssembly, e não carrega nada.

# text
seg-2d2c47db0c1f = <b>{ "176" } de { "388" }</b> capacidades validadas face a referências independentes externas; { "208" } com a etiqueta honesta de modeladas, { "4" } da responsabilidade de parceiros. Cada capacidade tem uma etiqueta num registo verificado por máquina: VALIDATED (uma referência independente externa concorda: dados reais, uma implementação independente ou vetores de referência publicados), MODELLED (internamente consistente, e dito em voz alta) ou PARTNER (um parceiro de hardware é o responsável). Entre as verificações: todos os { "666" } vetores SGP4 (Simplified General Perturbations { "4" }) da AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 até { "4.12" } mm, e o modelo de forças de Cowell até { "0.08" } m face ao Orekit { "12.2" }.

# attr:alt
seg-44f7862c45a2 = Como uma capacidade ganha a sua etiqueta: capacidade, referência independente, teste, etiqueta do registo. O estado de verificação em todas as { "388" } capacidades: { "176" } validadas, { "208" } modeladas, { "4" } da responsabilidade de parceiros

# text
seg-12a295fba8a5 = Cada capacidade da matriz de verificação é etiquetada como <b>validada</b> (verificada face a uma referência independente externa), <b>modelada</b> ou <b>da responsabilidade de parceiros</b>; os valores dos relógios óticos são objetivos espaciais em hardware de solo (nenhum relógio ótico de estrôncio voou). A maturidade <em>não</em> é uniforme entre domínios — o PNT terrestre é validado face a dados reais; a navegação no espaço profundo e em Marte é modelada, com apenas os seus blocos de construção (tempo de luz, posições dos planetas) validados face a referências independentes externas; a determinação de órbita (OD) em espaço profundo de missões reais consta do roteiro.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = O motor tem { "87" } tipos de cenário; <c1/> lista-os com os seus campos. Novidades da versão { "0.38.0" }: <c2/> (sinais GNSS para naves acima, em redor e para além das órbitas GNSS) e <c3/> (órbita e superfície lunares como infraestrutura de navegação e geodésica), ambos MODELLED, e <c4/> (um registo de erro de tempo face às máscaras da ITU-T).

# text
seg-68ed88ec0b32 = <b>Espetro</b>: como um emissor de jamming ocupa a banda L do GNSS, banda a banda.

# text
seg-f04a0aeeee33 = <b>Relógios e temporização</b>: holdover face a um limiar, transferência de tempo e holdover de telecomunicações face às máscaras do setor de normalização da União Internacional das Telecomunicações (ITU-T).

# text
seg-7e38ac603ef2 = <b>Constelações em torno de qualquer corpo</b>: cobertura, diluição da precisão e disponibilidade em torno da Terra, da Lua ou de Marte, e do sistema solar numa época.

# text
seg-82708b06dcc6 = <b>Navegação em órbita terrestre baixa</b>: sinal, passagem e ligação, mensagem de navegação e uma solução de posição fundida, fase a fase.

# text
seg-e21e9bb02d00 = <b>Campanhas</b>: uma missão encadeada, uma varredura ou um conjunto de Monte Carlo num só cenário.

# text
seg-ba5057da54e4 = <b>Relatórios, animação e exportações</b>: cada valor com a sua unidade e etiqueta; um desenho animado de uma execução; ficheiros SP3 (Standard Product { "3" }), mensagens de órbita CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) e SigMF (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Um motor aberto ao centro, kshana { $version }, com um despacho tipado sobre { "75" } tipos de cenário; à sua volta a linha de comandos, a biblioteca Rust, o Python, o WebAssembly e o Kshana Studio, o servidor MCP, a imagem Docker e o plugin JetBrains; por baixo o Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = O mesmo ficheiro de cenário dá os mesmos bytes em todas as superfícies. MCP é o Model Context Protocol: <a1><c1/></a1> permite a um assistente de IA (inteligência artificial) executar o motor.

# text
seg-f51b0a8cd30e = Seis artigos no arXiv assentam no motor aberto, cada um com o comando que está por trás: <a1>arXiv:{ "2606.22054" }</a1> (a lacuna de otimismo dos detetores de interferência), <a2>arXiv:{ "2606.24210" }</a2> (um nível de proteção de temporização condicional), <a3>arXiv:{ "2607.05415" }</a3> (quão estável é uma pontuação de resiliência de PNT), <a4>arXiv:{ "2607.02566" }</a4> (observabilidade de estações à superfície lunar com interferometria de base muito longa), <a5>arXiv:{ "2607.06212" }</a5> (geometria polar sul lunar e faróis de superfície) e <a6>arXiv:{ "2610.23871" }</a6> (navegação cisluar como um problema de observabilidade: comprimento do arco, condicionamento do Gramiano e a alavanca do Doppler). Ver <a7>Investigação</a7>.

# text
seg-dad7832bf2d2 = O motor completo é gratuito sob a AGPL-3.0. O Kshana Pro, uma camada proprietária que depende do motor aberto e nunca o bifurca, e estudos à medida estão disponíveis por contrato com a Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Não há preços; ver <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Saber mais

# text
seg-0e8320f8ea91 = <b>O README completo</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (o motor no seu navegador, como WebAssembly) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Capacidades</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validação e proveniência</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Matriz de verificação</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Citar</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Gratuito e de código aberto sob a <b>GNU AGPL-3.0-only</b> (a GNU Affero General Public License, versão { "3" } apenas). Está disponível uma <b>licença comercial</b> da <a1>Ashforde® OÜ</a1> (uma sociedade privada de responsabilidade limitada estónia; OÜ = osaühing) para integração fechada; ver <a2>LICENSING.md</a2>. Desenvolvido e mantido profissionalmente pela Ashforde® OÜ.
