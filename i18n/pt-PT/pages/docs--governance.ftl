# docs--governance: translations (pt-PT)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Fonte: <c1/>

# text
seg-5f8e9a4a15be = Governação do Kshana

# text
seg-b20b74b77755 = Este documento indica como o Kshana é governado: quem toma as decisões, como, e o que o projeto absorverá e não absorverá. É deliberadamente <b>leve</b> — proporcional à dimensão atual do projeto — e é honesto quanto à realidade atual de um único responsável e quanto ao caminho para uma governação mais ampla à medida que a comunidade crescer.

# text
seg-1e0c276811e2 = Missão e âmbito

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = O Kshana é uma <b>referência neutra, reprodutível e validada com honestidade para o desempenho e a resiliência de PNT híbrido quântico/clássico</b>. A missão fixa o limiar para todas as decisões: correção, citações e reprodutibilidade acima da abrangência. O âmbito honesto está documentado em <a1><c1/></a1> e o estado de validação em <a2><c2/></a2>; as propostas são avaliadas face a esse âmbito, não face ao número de funcionalidades.

# text
seg-d331a1cfc60b = Papéis

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Responsável pela manutenção.</b> O Kshana é atualmente mantido pelo seu fundador, a Ashforde OÜ (contacto: <c1/>). O responsável pela manutenção é quem toma a decisão final sobre o âmbito, o projeto, as versões e o que é integrado. Este é um modelo de responsável benevolente, declarado com clareza em vez de disfarçado de um comité que não existe.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Contribuidores.</b> Qualquer pessoa que abra uma issue ou um pull request. As contribuições são avaliadas pelo limiar de <a1><c1/></a1> — proveniência de cada parâmetro numérico, validação face a uma relação publicada e honestidade quanto à maturidade.

# text
seg-d212e17ac218 = <b>Futuros committers.</b> Quando uma contribuição sustentada e de elevada qualidade o justificar, os direitos de commit serão alargados a contribuidores de confiança, e este documento será atualizado para um modelo de vários responsáveis (decisões por consenso tácito, com o grupo de responsáveis a resolver os desacordos). Até lá, o caminho é: contribuir, construir um historial e ser convidado.

# text
seg-91e3f1919016 = Como se tomam as decisões

# text
seg-0d45899c92f4 = <b>Discussão aberta.</b> As alterações substanciais começam como uma issue no GitHub, para que a justificação, as alternativas e os compromissos fiquem registados.

# text
seg-88916dd2357b = <b>Consenso tácito.</b> Uma proposta sem oposição sustentada após um tempo razoável, e que satisfaça o limiar técnico abaixo, avança.

# text
seg-788566515dad = <b>O responsável decide em caso de desacordo.</b> Quando não se chega a consenso, o responsável decide e regista o motivo. O desacordo é resolvido pela missão e pelo limiar técnico, não pela antiguidade nem pelo volume.

# text
seg-e45e1b565e62 = O limiar técnico (não negociável)

# text
seg-2c397872e2f5 = Estes são invariantes rígidos, aplicados pela CI e pela revisão, que nenhuma decisão revoga:

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> tem de reproduzir uma execução bit a bit. Uma alteração que torne isto não determinista é um erro, não uma funcionalidade.

# text
seg-b8733ea97546 = <b>Proveniência.</b> Sem constantes numéricas anónimas — cada parâmetro cita uma fonte.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Honestidade na validação.</b> Cada capacidade é rotulada <c1/> (face a uma referência independente externa) ou <c2/> / <c3/>. Nada é afirmado para além da sua evidência. Ver a matriz verificada por máquina em <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Higiene.</b> Nenhuma atribuição de ferramentas automáticas em lado nenhum nos commits, no conteúdo ou no histórico (aplicado por <c1/>).

# text
seg-45733fea1709 = Uma alteração que não consiga satisfazer o limiar é recusada, por mais útil que seja.

# text
seg-3eb0831d99a2 = A fronteira entre o aberto e o fechado

# text
# c1: LICENSING.md
seg-ca7730a3d518 = O Kshana tem <b>núcleo aberto (open-core)</b>. Este repositório é, e continuará a ser, o motor AGPL-3.0 aberto completo — a referência neutra, com licenciamento duplo comercial pela Ashforde OÜ (ver <a1><c1/></a1>). O projeto <b>não</b> aceitará no repositório aberto:

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Profundidade sujeita a controlo de exportação ou de dupla utilização</b> — bibliotecas de ameaças reais, formas de onda de adversários ou parâmetros de desempenho antijamming/antispoofing. O repositório público limita-se a modelos e métodos genéricos e publicados (ver <c1/> → Controlo de exportações). Em caso de dúvida, pergunte <em>antes</em> de contribuir.

# text
seg-6df31d37cfe4 = Dados ou calibração confidenciais de clientes ou parceiros.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b>Dependências <em>com</em> copyleft (GPL/AGPL/LGPL/MPL)</b> — não porque entrem em conflito com a própria licença AGPL do motor (não entram), mas porque não podem ser relicenciadas na edição <b>comercial</b>: só podemos vender uma licença comercial sobre código que possuímos ou que seja permissivo. Uma dependência com copyleft contaminaria a edição comercial e quebraria o licenciamento duplo. As dependências mantêm-se, por isso, permissivas (Apache/MIT/BSD/ISC), o que é aplicado por <a1><c1/></a1>.

# text
seg-ce264f3e43fe = Inversamente, o projeto <b>não</b> esvaziará o núcleo aberto para empurrar valor proprietário: o motor validado, as âncoras públicas de validação, o registo de honestidade, o formato de intercâmbio/padrão e os canais de distribuição permanecem abertos. Estrangular o núcleo aberto é o único erro fatal do open-core, e está fora de questão.

# text
seg-947b3e9b1b2d = Versões

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Semantic Versioning.</b> Antes da 1.0, o esquema de cenários/resultados pode mudar; as alterações que quebram a compatibilidade são assinaladas, e a versão do esquema de intercâmbio (<c1/>) é a única fonte de verdade para a compatibilidade dos artefactos.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Autoridade de publicação.</b> Publicar (por exemplo, <c1/>) é um passo manual do responsável pela manutenção que exige um token de registo. A CI e o fluxo de trabalho Release, ativado por etiqueta, <b>nunca</b> publicam automaticamente em registos externos — limitam-se a voltar a executar todas as verificações e a anexar um artefacto de compilação. Ver <c2/> → Commits e versionamento.

# text
seg-59c37ffa54f0 = Código de conduta e segurança

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = A conduta é regida por <a1><c1/></a1>.

# text
# c1: SECURITY.md
seg-8574b73edbbc = As questões de segurança seguem o processo de divulgação privada em <a1><c1/></a1> — não abra uma issue pública para uma vulnerabilidade.

# text
seg-d86d4e609713 = Marca registada

# text
seg-cb1314b67b2f = O nome e o logótipo do Kshana são marcas registadas da Ashforde OÜ. A licença (AGPL-3.0, ou uma licença comercial) abrange o <b>código</b>, não as marcas: um fork pode usar o código ao abrigo da licença, mas não o nome Kshana nem a identidade canónica de distribuição. Isto mantém a Ashforde como a fonte de verdade citada e faz parte da forma como o núcleo aberto se mantém uma referência neutra.

# text
seg-a678f6ed1af8 = Alterar este documento

# text
seg-db90122245fa = As alterações à governação são elas próprias propostas como pull request e decididas pelo processo acima. À medida que a escala do projeto mudar, é de esperar que este documento ganhe um modelo de decisão com vários responsáveis; não reduzirá o limiar técnico.

# text
seg-0a0712cca2e7 = Leve por conceção. Honesto quanto ao presente, com um caminho declarado para o futuro.

# text
seg-4bfa7cf23a41 = <s1>Anterior</s1>Contribuir

# text
seg-f67113e34738 = <s1>Seguinte</s1>Código de conduta
