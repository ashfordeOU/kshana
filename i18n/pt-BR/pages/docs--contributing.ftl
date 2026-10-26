# docs--contributing: translations (pt-BR)

# text
seg-c3c260b7063e = Testes

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Fonte: <c1/>

# text
seg-3fa173b79e8f = Contribuir com o Kshana

# text
seg-c3a47c614836 = Obrigado pelo seu interesse. O Kshana pretende ser uma referência <b>neutra, reprodutível e honestamente validada</b> para PNT híbrido quântico/clássico. As contribuições são avaliadas por esse critério: correção, citações e reprodutibilidade acima de amplitude.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = Como o projeto é governado (quem decide, o critério técnico e a fronteira entre aberto e fechado) está documentado em <a1><c1/></a1>.

# text
seg-cc8491af7a6f = Desenvolvimento

# text
seg-0163ccdfaa2b = As ligações de linguagem opcionais são protegidas por feature e desativadas por padrão (de modo que a compilação acima e o portão de auditoria de dependências nunca as tocam). Para trabalhar nelas:

# text
seg-edc8bbab6e92 = Antes de cada commit: o ciclo rápido

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Estes levam segundos. São um subconjunto do job <c2/> de <c1/>, na mesma ordem, de modo que uma falha aqui é uma falha lá:

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>A reprodutibilidade é um invariante rígido.</b> Uma alteração que torne <c1/> não determinístico é um defeito. A aleatoriedade deve fluir pelo RNG semeado; as execuções quânticas e clássicas usam sementes independentes, derivadas de forma determinística.

# text
seg-66ea0748c10f = <b>Higiene do repositório.</b> Commits e conteúdo não devem trazer trailers ou rodapés de atribuição de ferramentas automatizadas, e não devem nomear um assistente de IA como autor em nenhum lugar do conteúdo, dos nomes de arquivos ou do histórico. A proteção impõe isso.

# text
seg-fbf423f6fb31 = Antes de enviar: o portão completo

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> é o portão canônico: executa <c2/> sem abreviações e depois <c3/> para reexecutar mais algumas vezes a suíte da biblioteca, porque uma condição de corrida de intercalação de threads é invisível em uma única execução. Somente em caso de sucesso grava <c4/> (não rastreado: estado da máquina sobre uma execução, não conteúdo).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = É lento de propósito (62-79 minutos em regime estável saudável, segundo o cabeçalho de <c1/>, que traz o valor atual) e não há tempo limite, porque um tempo limite curto o bastante para ser útil mataria uma execução saudável. Uma execução parcial que voltou verde não é um portão: os dois defeitos para os quais este mecanismo existe passaram por ela dessa maneira.

# text
# c1: gate.sh
seg-408da9a8b8bb = Os colaboradores que trabalham a partir de um fork não precisam do hook de recibo: é um portão local de mantenedores, e <b>a CI é o que de fato barra um pull request</b>. Executar <c1/> antes de abrir um significa apenas que a CI não lhe dirá nada que você já não soubesse.

# text
seg-9394727b21c3 = Adicionar ou alterar um modelo de sensor

# text
# c1: provenance
seg-d9c891ca6827 = <b>Todo parâmetro numérico precisa de proveniência.</b> Coloque a citação na cadeia <c1/> do modelo e no arquivo de cenário. Nenhuma constante anônima.

# text
seg-d30cb836d4c4 = <b>Valide contra a relação padrão,</b> e não apenas contra a consistência interna; por exemplo, o desvio de Allan para relógios, o crescimento do erro de navegação por estima de Groves para inerciais, a conversão temporização→distância para a transferência de tempo. Acrescente um teste de que a saída simulada reproduz o valor publicado/da relação dentro de uma tolerância declarada.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Seja honesto quanto à maturidade.</b> O registro de situação é <c1/>: acrescente ou altere a linha ali, indique a sua referência independente externa (ou diga com clareza que não há nenhuma, o que a torna <c2/>) e então regenere os artefatos publicados com <c3/>. <c4/>, <c5/> e <c6/> são todos gerados a partir dessa função e dizem "não edite à mão" por um motivo. Atualize também a narrativa de <c7/> quando o texto exigir e rotule como tais as figuras que são metas ou resultados de demonstradores em solo.

# text
seg-34b9c8b6f70c = Orientado por testes: escreva primeiro o teste que falha, com o valor esperado <b>derivado à mão</b> da física/relação antes de implementar.

# text
seg-5322d5b2188c = Os testes determinísticos verificam valores exatos (derivados à mão); os testes estatísticos verificam uma tolerância declarada e, idealmente, fazem a média entre sementes para controlar a dispersão.

# text
seg-7f76a26c4d5f = Commits e versionamento

# text
# c1: feat:
# c2: fix:
# c3: docs:
# c4: test:
# c5: chore:
seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

# text
seg-1a13616ca0ac = <b>Versionamento Semântico.</b> Antes da 1.0, o esquema de cenário/resultado pode mudar; destaque as alterações incompatíveis.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>As versões são geradas por uma tag <c1/>, e a publicação é automática, mas ordenada.</b> O fluxo de trabalho Auto-tag envia a tag quando a CI está verde em <c2/> em um aumento de versão. O fluxo de trabalho Release executa a verificação completa no commit com a tag e somente quando ela passa publica no crates.io, no Python Package Index (PyPI), no npm, no ghcr.io, no registro do Model Context Protocol (MCP) e no JetBrains Marketplace; em seguida verifica se todos os canais servem a versão e reconstrói o kshana.dev a partir da tag. Ninguém executa <c3/> à mão. Os passos, e como tentar de novo uma publicação que falhou, estão em <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Manutenção do changelog (obrigatória)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Toda alteração visível ao usuário atualiza <a1><c1/></a1>:

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Acrescente uma entrada na seção <b><c1/></b>, no grupo correto (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Na versão, renomeie <c1/> para o novo <c2/>, comece um <c3/> novo, aumente o <c4/> em <c5/> (de modo que <c6/> no JSON de resultado corresponda), atualize os links de comparação no final e marque a tag <c7/>.

# text
seg-ed680e59377c = Mantenha as entradas concisas e voltadas ao usuário; inclua links para issues/PRs quando útil.

# text
seg-fe83216ebeed = Um pull request que altera o comportamento sem uma entrada no changelog está incompleto.

# text
seg-776cd2ef0b0c = Controle de exportação

# text
seg-d0f1db9798a6 = A resiliência de PNT e a detecção quântica podem se sujeitar a controles de exportação de uso duplo. Mantenha o repositório público em modelos e métodos genéricos e publicados. Qualquer coisa que se assemelhe a profundidade de resiliência/antispoofing sensível à exportação pertence à camada privada, não aqui. Em caso de dúvida, pergunte antes de contribuir com isso.

# text
seg-506a29aafc12 = Licença

# text
# c1: LICENSING.md
seg-c0409a1226ca = O Kshana tem licença dupla (AGPL-3.0 <b>ou</b> uma licença comercial da Ashforde OÜ; veja <a1><c1/></a1>). Para que isso continue funcionando, as contribuições devem ser utilizáveis sob <b>ambas</b> as licenças. Portanto, ao contribuir, você concorda que:

# text
seg-da7b02ac890c = a sua contribuição é licenciada na entrada (inbound) sob a <b>AGPL-3.0-only</b>; e

# text
seg-8d6ed0d3a17f = você <b>também concede à Ashforde OÜ</b> uma licença perpétua, mundial, isenta de royalties e irrevogável para usar, modificar e <b>relicenciar a sua contribuição como parte da edição do Kshana licenciada comercialmente</b> (isto é, para distribuí-la também sob termos comerciais não AGPL). Você mantém os direitos autorais da sua contribuição.

# text
seg-3b1a0dd6b5aa = Esta concessão leve de licença dupla, que não é uma cessão de direitos autorais, é o que permite que o projeto permaneça aberto <em>e</em> ofereça uma edição comercial. Se você não puder conceder ({ "2" }) (por exemplo, código de propriedade do empregador), diga isso no seu pull request antes de contribuir.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Exceção: <c1/>.</b> Esse diretório é licenciado sob a <b>GPL-3.0-or-later</b> (veja o seu <c2/>) e está fora da licença comercial. As contribuições a ele são licenciadas na entrada sob a GPL-3.0-or-later <b>apenas</b>; a concessão ({ "2" }) não se aplica a elas.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Assine cada commit para atestar o <a1>Developer Certificate of Origin</a1>: <c1/> (acrescenta uma linha <c2/>).

# text
seg-9f86d8f58b17 = <s1>Anterior</s1>Segurança

# text
seg-fc760238e9a5 = <s1>Próximo</s1>Governança
