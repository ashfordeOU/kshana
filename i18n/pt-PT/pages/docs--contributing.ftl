# docs--contributing: translations (pt-PT)

# text
seg-c3c260b7063e = Testes

# text
# c1: CONTRIBUTING.md
seg-5dce5694e6ec = Fonte: <c1/>

# text
seg-3fa173b79e8f = Contribuir para o Kshana

# text
seg-c3a47c614836 = Obrigado pelo seu interesse. O Kshana pretende ser uma referência <b>neutra, reprodutível e validada com honestidade</b> para PNT quântico/clássico híbrido. As contribuições são avaliadas por esse limiar: correção, citações e reprodutibilidade acima da abrangência.

# text
# c1: GOVERNANCE.md
seg-5a82a55f7fb2 = A forma como o projeto é governado — quem decide, o limiar técnico e a fronteira entre o aberto e o fechado — está documentada em <a1><c1/></a1>.

# text
seg-cc8491af7a6f = Desenvolvimento

# text
seg-0163ccdfaa2b = As ligações opcionais a linguagens estão protegidas por funcionalidades (feature-gated) e desativadas por predefinição (pelo que a compilação acima e a verificação de auditoria de dependências nunca lhes tocam). Para trabalhar nelas:

# text
seg-edc8bbab6e92 = Antes de cada commit — o ciclo rápido

# text
# c1: ci.yml
# c2: check
seg-6a7eda7d82b7 = Demoram segundos. São um subconjunto da tarefa <c2/> de <c1/>, pela mesma ordem, pelo que uma falha aqui é uma falha lá:

# text
# c1: (scenario, seed, version)
seg-d62c1fe22fc4 = <b>A reprodutibilidade é um invariante rígido.</b> Uma alteração que torne <c1/> não determinista é um erro. A aleatoriedade tem de passar pelo gerador aleatório com semente; as execuções quânticas e clássicas usam sementes independentes, derivadas de forma determinista.

# text
seg-66ea0748c10f = <b>Higiene do repositório.</b> Os commits e o conteúdo não podem conter nenhuma linha final nem rodapé de atribuição de ferramentas automáticas, nem nomear um assistente de IA como autor em parte alguma do conteúdo, dos nomes de ficheiros ou do histórico. A proteção aplica-o.

# text
seg-fbf423f6fb31 = Antes de fazer push — a verificação completa

# text
# c1: scripts/gate.sh
# c2: cargo test --all
# c3: scripts/check-repeatability.sh
# c4: .gate-receipt.json
seg-a9176352d3b4 = <c1/> é a verificação canónica: executa <c2/> na íntegra e depois <c3/> para voltar a executar a suite da biblioteca mais algumas vezes, porque uma condição de corrida por entrelaçamento de threads é invisível numa única execução. Só em caso de sucesso escreve <c4/> (não rastreado — estado da máquina sobre uma execução, não conteúdo).

# text
# c1: scripts/gate.sh
seg-29815bd89ce2 = É lenta de propósito — 62-79 minutos em regime estável saudável, segundo o cabeçalho de <c1/>, que contém o valor atual — e não tem tempo limite, porque um tempo limite suficientemente curto para ser útil interromperia uma execução saudável. Uma execução parcial que terminou em verde não é uma verificação completa: ambos os defeitos para os quais este mecanismo existe passaram por ela dessa forma.

# text
# c1: gate.sh
seg-408da9a8b8bb = Os contribuidores que trabalham a partir de um fork não precisam do hook de recibo — é uma verificação local de quem mantém o projeto, e <b>é a CI que, na prática, controla um pull request</b>. Executar <c1/> antes de abrir um significa apenas que a CI não lhe diz nada que ainda não soubesse.

# text
seg-9394727b21c3 = Adicionar ou alterar um modelo de sensor

# text
# c1: provenance
seg-d9c891ca6827 = <b>Todos os parâmetros numéricos precisam de proveniência.</b> Coloque a citação na cadeia <c1/> do modelo e no ficheiro do cenário. Sem constantes anónimas.

# text
seg-d30cb836d4c4 = <b>Valide face à relação normalizada,</b> e não apenas à consistência interna — por exemplo, o desvio de Allan para relógios, o crescimento do erro de navegação por estima de Groves para sistemas inerciais, a conversão de temporização em distância para a transferência de tempo. Acrescente um teste de que a saída simulada reproduz o valor publicado/da relação dentro de uma tolerância indicada.

# text
# c1: src/verification.rs::verification_matrix()
# c2: Modelled
# c3: cargo run --bin gen_validation_artifacts
# c4: docs/VERIFICATION-MATRIX.md
# c5: docs/MODELLED-RATIONALE.md
# c6: web/data/verification-matrix.json
# c7: docs/VALIDATION.md
seg-b52dd0dd550e = <b>Seja honesto quanto à maturidade.</b> O registo de estado é <c1/> — acrescente ou altere aí a linha, indique a sua referência independente externa (ou diga com clareza que não existe nenhuma, o que a torna <c2/>) e depois regenere os artefactos publicados com <c3/>. <c4/>, <c5/> e <c6/> são todos gerados a partir dessa função e dizem "do not edit by hand" por uma razão. Atualize também a narrativa de <c7/> quando o texto o exigir, e rotule como tal os valores que sejam objetivos ou resultados de demonstradores em solo.

# text
seg-34b9c8b6f70c = Orientado por testes: escreva primeiro o teste que falha, com o valor esperado <b>deduzido à mão</b> a partir da física/relação antes de implementar.

# text
seg-5322d5b2188c = Os testes deterministas afirmam valores exatos (deduzidos à mão); os testes estatísticos afirmam uma tolerância indicada e, idealmente, fazem a média sobre sementes para controlar a dispersão.

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
seg-1a13616ca0ac = <b>Semantic Versioning.</b> Antes da 1.0, o esquema de cenários/resultados pode mudar; assinale as alterações que quebram a compatibilidade.

# text
# c1: vX.Y.Z
# c2: main
# c3: cargo publish
# c4: docs/RELEASING.md
seg-0e3036c27aa8 = <b>As versões são lançadas por uma etiqueta <c1/> e a publicação é automática, mas ordenada.</b> O fluxo de trabalho Auto-tag envia a etiqueta quando a CI está verde em <c2/> numa subida de versão. O fluxo de trabalho Release executa a verificação completa no commit etiquetado e só quando esta é bem-sucedida publica no crates.io, no Python Package Index (PyPI), no npm, no ghcr.io, no registo do Model Context Protocol (MCP) e no JetBrains Marketplace; em seguida verifica se todos os canais servem a versão e reconstrói o kshana.dev a partir da etiqueta. Ninguém executa <c3/> à mão. Os passos, e como repetir uma publicação falhada, estão em <a1><c4/></a1>.

# text
seg-18ca89a2c573 = Manutenção do registo de alterações (obrigatória)

# text
# c1: CHANGELOG.md
seg-1f7e1d73c2ef = Toda a alteração visível para o utilizador atualiza <a1><c1/></a1>:

# text
# c1: [Unreleased]
# c2: Added
# c3: Changed
# c4: Fixed
# c5: Removed
# c6: Documented
# c7: Planned
seg-1448e96afbbc = Acrescente uma entrada na secção <b><c1/></b>, no grupo certo (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

# text
# c1: [Unreleased]
# c2: [x.y.z] - YYYY-MM-DD
# c3: [Unreleased]
# c4: version
# c5: Cargo.toml
# c6: engine_version
# c7: vx.y.z
seg-76ddc53c752e = Ao lançar uma versão, renomeie <c1/> para o novo <c2/>, inicie um novo <c3/>, suba o <c4/> em <c5/> (para que <c6/> no JSON de resultados coincida), atualize as ligações de comparação no fundo e etiquete <c7/>.

# text
seg-ed680e59377c = Mantenha as entradas concisas e orientadas para o utilizador; ligue issues/PRs quando for útil.

# text
seg-fe83216ebeed = Um pull request que altere o comportamento sem uma entrada no registo de alterações está incompleto.

# text
seg-776cd2ef0b0c = Controlo de exportações

# text
seg-d0f1db9798a6 = A resiliência PNT e a deteção quântica podem estar sujeitas a controlos de exportação de dupla utilização. Mantenha o repositório público restrito a modelos e métodos genéricos e publicados. Tudo o que se assemelhe a profundidade de resiliência/antiengano sensível do ponto de vista da exportação pertence à camada privada, não aqui. Em caso de dúvida, pergunte antes de contribuir com isso.

# text
seg-506a29aafc12 = Licença

# text
# c1: LICENSING.md
seg-c0409a1226ca = O Kshana tem licenciamento duplo (AGPL-3.0 <b>ou</b> uma licença comercial da Ashforde OÜ — ver <a1><c1/></a1>). Para que isso continue a funcionar, as contribuições têm de ser utilizáveis ao abrigo de <b>ambas</b> as licenças. Assim, ao contribuir, concorda que:

# text
seg-da7b02ac890c = a sua contribuição é licenciada à entrada ao abrigo da <b>AGPL-3.0-only</b>; e

# text
seg-8d6ed0d3a17f = <b>concede também à Ashforde OÜ</b> uma licença perpétua, mundial, isenta de royalties e irrevogável para usar, modificar e <b>relicenciar a sua contribuição como parte da edição do Kshana com licenciamento comercial</b> (ou seja, para a distribuir também ao abrigo de condições comerciais não AGPL). Mantém os direitos de autor sobre a sua contribuição.

# text
seg-3b1a0dd6b5aa = Esta concessão leve de licença dupla — não uma cessão de direitos de autor — é o que permite ao projeto manter-se aberto <em>e</em> oferecer uma edição comercial. Se não puder conceder ({ "2" }) (por exemplo, código pertencente a uma entidade empregadora), diga-o no seu pull request antes de contribuir.

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
seg-6630d0ac4ad5 = <b>Exceção: <c1/>.</b> Esse diretório é licenciado ao abrigo da <b>GPL-3.0-or-later</b> (ver o respetivo <c2/>) e está fora da licença comercial. As contribuições para ele são licenciadas à entrada ao abrigo da GPL-3.0-or-later <b>apenas</b>; a concessão ({ "2" }) não se aplica a elas.

# text
# c1: git commit -s
# c2: Signed-off-by
seg-0a78a12b1188 = Assine cada commit para subscrever o <a1>Developer Certificate of Origin</a1>: <c1/> (acrescenta uma linha <c2/>).

# text
seg-9f86d8f58b17 = <s1>Anterior</s1>Segurança

# text
seg-fc760238e9a5 = <s1>Seguinte</s1>Governação
