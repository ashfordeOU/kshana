# docs--security: translations (pt-BR)

# text
seg-4609cf7fb790 = Política de segurança

# text
# c1: SECURITY.md
seg-ff991a587e4b = Fonte: <c1/>

# text
seg-7315b27c34f8 = Como relatar uma vulnerabilidade

# text
seg-2f06a8b277b7 = Relate-a de forma privada, por um destes dois caminhos:

# text
seg-31999fe1b838 = <b>Relato privado de vulnerabilidades do GitHub</b> — o botão <em>Report a vulnerability</em> na <a1>aba Security</a1> do repositório. O relato fica visível apenas para os mantenedores, e uma correção pode ser preparada em um fork privado e publicada como um GitHub Security Advisory.

# text
seg-7bdcc2ffe39e = <b>E-mail</b> — <b><a1>contact@ashforde.org</a1></b>, com detalhes e passos para reprodução.

# text
seg-fbc3db22c061 = Por favor, não abra uma issue pública para relatos sensíveis do ponto de vista da segurança. Nosso objetivo é confirmar o recebimento em alguns dias úteis.

# text
seg-4c11dabdd8f6 = Versões com suporte

# text
seg-19c99cf3a67e = Pré-1.0: somente a versão marcada mais recente tem suporte.

# text
seg-1379eab9a8e3 = Segurança de memória

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = O crate da biblioteca declara <c1/> na raiz do crate (<c2/>); assim, um bloco <c3/>, fn, impl ou extern em qualquer ponto da biblioteca é um erro de compilação, e não algo que um revisor precise perceber. O atributo não está atrás de um <c4/>, de modo que vale para todas as configurações em que a biblioteca é distribuída, e as três compilam sem problemas com ele: a compilação Rust padrão, o módulo de extensão Python (<c5/>) e o módulo WebAssembly (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Escopo, declarado com precisão, porque <c1/> vale por crate:

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = Ele rege apenas o crate da biblioteca. O binário da CLI (<c1/>), os binários auxiliares em <c2/>, o crate <c3/> publicado separadamente e os crates de validação cruzada <c4/>, excluídos do workspace, são raízes de crate distintas e não são cobertos por ele. Nenhum deles contém <c5/> hoje, mas isso é disciplina, não uma propriedade imposta pelo compilador.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = Ele não diz nada sobre dependências. Estas são controladas separadamente por <c1/> na CI — para o crate raiz e, como um job próprio, para o crate do servidor MCP excluído do workspace — e monitoradas por alertas do Dependabot e por atualizações de segurança no repositório.

# text
seg-df3008a05522 = Nota sobre controle de exportação / uso dual

# text
seg-0782e60d11fa = A resiliência de PNT e a detecção quântica podem se enquadrar em controles de exportação de uso dual. Este repositório público limita-se a modelos e métodos genéricos e publicados. Não contribua aqui com detalhes de resiliência ou de antispoofing sensíveis do ponto de vista da exportação; eles pertencem a uma camada privada. Em caso de dúvida, envie primeiro um e-mail.

# text
seg-f6bb0582f6f2 = <s1>Anterior</s1>Licenciamento

# text
seg-834cbd4e96d3 = <s1>Próximo</s1>Como contribuir
