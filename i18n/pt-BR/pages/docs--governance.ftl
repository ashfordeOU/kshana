# docs--governance: translations (pt-BR)

# text
# c1: GOVERNANCE.md
seg-26440a254ba8 = Fonte: <c1/>

# text
seg-5f8e9a4a15be = Governança do Kshana

# text
seg-b20b74b77755 = Este documento declara como o Kshana é governado: quem toma as decisões, como, e o que o projeto absorverá ou não. Ele é deliberadamente <b>leve</b> — proporcional ao tamanho atual do projeto — e é honesto quanto à realidade presente de um único mantenedor e ao caminho para uma governança mais ampla à medida que a comunidade crescer.

# text
seg-1e0c276811e2 = Missão e escopo

# text
# c1: docs/CAPABILITY.md
# c2: docs/VALIDATION.md
seg-5dcc38148cf4 = O Kshana é uma <b>referência neutra, reprodutível e validada com honestidade para o desempenho e a resiliência de PNT híbrido quântico/clássico</b>. A missão estabelece o patamar para cada decisão: correção, citações e reprodutibilidade acima de abrangência. O escopo honesto está documentado em <a1><c1/></a1> e a situação da validação em <a2><c2/></a2>; as propostas são pesadas em relação a esse escopo, não em relação ao número de funcionalidades.

# text
seg-d331a1cfc60b = Papéis

# text
# c1: contact@ashforde.org
seg-88bb2a831125 = <b>Mantenedor.</b> O Kshana é atualmente mantido por seu fundador, a Ashforde OÜ (contato: <c1/>). O mantenedor é o decisor final sobre escopo, projeto, versões e o que é incorporado. Este é um modelo de mantenedor benevolente, declarado de forma direta em vez de disfarçado de um comitê que não existe.

# text
# c1: CONTRIBUTING.md
seg-8e1da46f9b0b = <b>Contribuidores.</b> Qualquer pessoa que abra uma issue ou um pull request. As contribuições são avaliadas pelo patamar de <a1><c1/></a1> — proveniência para cada parâmetro numérico, validação em relação a uma relação publicada e honestidade quanto à maturidade.

# text
seg-d212e17ac218 = <b>Futuros committers.</b> À medida que uma contribuição sustentada e de alta qualidade o justificar, os direitos de commit serão estendidos a contribuidores de confiança, e este documento será atualizado para um modelo de múltiplos mantenedores (decisões por consenso tácito, com o grupo de mantenedores resolvendo divergências). Até lá, o caminho é: contribuir, construir um histórico e ser convidado.

# text
seg-91e3f1919016 = Como as decisões são tomadas

# text
seg-0d45899c92f4 = <b>Discussão às claras.</b> As mudanças substantivas começam como uma issue do GitHub, para que a justificativa, as alternativas e as contrapartidas fiquem registradas.

# text
seg-88916dd2357b = <b>Consenso tácito.</b> Uma proposta sem objeção sustentada após um prazo razoável, e que passe no patamar técnico abaixo, prossegue.

# text
seg-788566515dad = <b>O mantenedor decide em caso de divergência.</b> Onde não se chega a consenso, o mantenedor decide e registra o motivo. A divergência se resolve pela missão e pelo patamar técnico, não por senioridade nem por volume.

# text
seg-e45e1b565e62 = O patamar técnico (inegociável)

# text
seg-2c397872e2f5 = Estes são invariantes rígidos, impostos pela CI e pela revisão, que nenhuma decisão anula:

# text
# c1: (scenario, seed, engine_version)
seg-70cb5a174c2f = <c1/> deve reproduzir uma execução bit a bit. Uma mudança que torne isso não determinístico é um defeito, não uma funcionalidade.

# text
seg-b8733ea97546 = <b>Proveniência.</b> Nenhuma constante numérica anônima — todo parâmetro cita uma fonte.

# text
# c1: validated
# c2: modelled
# c3: not modeled
# c4: src/verification.rs
seg-55a09b775418 = <b>Honestidade de validação.</b> Cada capacidade é rotulada <c1/> (em relação a uma referência independente externa) ou <c2/> / <c3/>. Nada é afirmado além de sua evidência. Veja a matriz verificada por máquina em <c4/>.

# text
# c1: scripts/check-no-attribution.sh
seg-dd339a396698 = <b>Higiene.</b> Nenhuma atribuição a ferramentas automatizadas em commits, conteúdo ou histórico (imposta por <c1/>).

# text
seg-45733fea1709 = Uma mudança que não consegue atingir o patamar é recusada, por mais útil que fosse.

# text
seg-3eb0831d99a2 = A fronteira aberto / fechado

# text
# c1: LICENSING.md
seg-ca7730a3d518 = O Kshana é <b>open-core</b>. Este repositório é, e continua sendo, o motor AGPL-3.0 aberto completo — a referência neutra, com licenciamento duplo comercial pela Ashforde OÜ (veja <a1><c1/></a1>). O projeto <b>não</b> aceitará no repositório aberto:

# text
# c1: CONTRIBUTING.md
seg-8c2a89a3a4e2 = <b>Profundidade sujeita a controle de exportação ou de uso dual</b> — bibliotecas de ameaças reais, formas de onda de adversários ou parâmetros de desempenho anti-jam/anti-spoof. O repositório público se limita a modelos e métodos genéricos e publicados (veja <c1/> → Export control). Em caso de dúvida, pergunte <em>antes</em> de contribuir.

# text
seg-6df31d37cfe4 = Dados ou calibração confidenciais de clientes ou parceiros.

# text
# c1: deny.toml
seg-b3b4a5384199 = <b><em>Dependências</em> com copyleft (GPL/AGPL/LGPL/MPL)</b> — não porque conflitem com a própria licença AGPL do motor (não conflitam), mas porque não podem ser relicenciadas para a edição <b>comercial</b>: só podemos vender uma licença comercial sobre código que possuímos ou que é permissivo. Uma dependência com copyleft contaminaria a edição comercial e quebraria o licenciamento duplo. As dependências, portanto, permanecem permissivas (Apache/MIT/BSD/ISC), o que é imposto por <a1><c1/></a1>.

# text
seg-ce264f3e43fe = Inversamente, o projeto <b>não</b> esvaziará o open core para empurrar valor proprietário: o motor validado, as âncoras públicas de validação, o registro de honestidade, o formato de intercâmbio/padrão e os canais de distribuição permanecem abertos. Estrangular o open core é o único erro fatal no open-core, e está fora de questão.

# text
seg-947b3e9b1b2d = Versões

# text
# c1: src/interchange.rs::SCHEMA_VERSION
seg-73e2bca0310d = <b>Versionamento Semântico.</b> Antes da 1.0, o esquema de cenário/resultado pode mudar; as mudanças incompatíveis são destacadas, e a versão do esquema de intercâmbio (<c1/>) é a única fonte de verdade para a compatibilidade de artefatos.

# text
# c1: cargo publish
# c2: CONTRIBUTING.md
seg-71cace8b6144 = <b>Autoridade de publicação.</b> Publicar (por exemplo, <c1/>) é uma etapa manual do mantenedor que exige um token de registro. A CI e o workflow de Release condicionado a tag <b>nunca</b> publicam automaticamente em registros externos — eles apenas reexecutam todas as verificações e anexam um artefato de build. Veja <c2/> → Commits and versioning.

# text
seg-59c37ffa54f0 = Código de conduta e segurança

# text
# c1: CODE_OF_CONDUCT.md
seg-2dc8c12568bc = A conduta é regida por <a1><c1/></a1>.

# text
# c1: SECURITY.md
seg-8574b73edbbc = Os problemas de segurança seguem o processo de divulgação privada em <a1><c1/></a1> — não abra uma issue pública para uma vulnerabilidade.

# text
seg-d86d4e609713 = Marca

# text
seg-cb1314b67b2f = O nome e o logotipo Kshana são marcas registradas da Ashforde OÜ. A licença (AGPL-3.0, ou uma licença comercial) cobre o <b>código</b>, não as marcas: um fork pode usar o código sob a licença, mas não o nome Kshana nem a identidade canônica de distribuição. Isso mantém a Ashforde como a fonte de verdade citada e é parte de como o open core permanece uma referência neutra.

# text
seg-a678f6ed1af8 = Alterando este documento

# text
seg-db90122245fa = As mudanças na governança são, elas próprias, propostas como um pull request e decididas pelo processo acima. À medida que a escala do projeto mudar, espere que este documento ganhe um modelo de decisão com múltiplos mantenedores; ele não reduzirá o patamar técnico.

# text
seg-0a0712cca2e7 = Leve por projeto. Honesto sobre hoje, com um caminho declarado para amanhã.

# text
seg-4bfa7cf23a41 = <s1>Anterior</s1>Contribuindo

# text
seg-f67113e34738 = <s1>Próxima</s1>Código de conduta
