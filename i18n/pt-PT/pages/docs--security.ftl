# docs--security: translations (pt-PT)

# text
seg-4609cf7fb790 = Política de segurança

# text
# c1: SECURITY.md
seg-ff991a587e4b = Fonte: <c1/>

# text
seg-7315b27c34f8 = Comunicar uma vulnerabilidade

# text
seg-2f06a8b277b7 = Comunique-a em privado, por uma de duas vias:

# text
seg-31999fe1b838 = <b>Comunicação privada de vulnerabilidades do GitHub</b> — o botão <em>Report a vulnerability</em> no <a1>separador Security</a1> do repositório. A comunicação é visível apenas para os responsáveis pela manutenção, e uma correção pode ser preparada num fork privado e publicada como um GitHub Security Advisory.

# text
seg-7bdcc2ffe39e = <b>Email</b> — <b><a1>contact@ashforde.org</a1></b>, com pormenores e passos de reprodução.

# text
seg-fbc3db22c061 = Por favor, não abra um issue público para comunicações sensíveis do ponto de vista da segurança. Procuramos acusar a receção no prazo de poucos dias úteis.

# text
seg-4c11dabdd8f6 = Versões suportadas

# text
seg-19c99cf3a67e = Pré-1.0: apenas a última edição etiquetada é suportada.

# text
seg-1379eab9a8e3 = Segurança de memória

# text
# c1: #![forbid(unsafe_code)]
# c2: src/lib.rs
# c3: unsafe
# c4: cfg
# c5: --features python
# c6: --features wasm
seg-cf966fa35408 = A crate de biblioteca declara <c1/> na raiz da crate (<c2/>), pelo que um bloco <c3/>, fn, impl ou extern em qualquer ponto da biblioteca é um erro de compilação, em vez de algo que um revisor tenha de detetar. O atributo não está atrás de um <c4/>, pelo que se aplica a todas as configurações em que a biblioteca é distribuída, e as três compilam sem erros com ele: a compilação Rust predefinida, o módulo de extensão Python (<c5/>) e o módulo WebAssembly (<c6/>).

# text
# c1: forbid
seg-3f9e707e7d0b = Âmbito, declarado com precisão, porque <c1/> é por crate:

# text
# c1: src/main.rs
# c2: src/bin/
# c3: kshana-mcp
# c4: xval/
# c5: unsafe
seg-e7e22e711c53 = Aplica-se apenas à crate de biblioteca. O binário da CLI (<c1/>), os binários auxiliares em <c2/>, a crate <c3/> publicada em separado e as crates de validação cruzada <c4/> excluídas do espaço de trabalho são raízes de crate separadas e não são abrangidos por ele. Nenhum deles contém <c5/> atualmente, mas isso é disciplina, não uma propriedade imposta pelo compilador.

# text
# c1: cargo deny check advisories licenses bans sources
seg-b8f1e374d873 = Não diz nada sobre as dependências. Estas são controladas em separado por <c1/> na CI — para a crate raiz e, como tarefa própria, para a crate do servidor MCP excluída do espaço de trabalho — e vigiadas por alertas do Dependabot e atualizações de segurança no repositório.

# text
seg-df3008a05522 = Nota de controlo de exportações / dupla utilização

# text
seg-0782e60d11fa = A resiliência PNT e a deteção quântica podem estar sujeitas a controlos de exportação de dupla utilização. Este repositório público limita-se a modelos e métodos genéricos e publicados. Não contribua aqui com pormenores de resiliência ou de antispoofing sensíveis para a exportação; pertencem a uma camada privada. Em caso de dúvida, envie primeiro um email.

# text
seg-f6bb0582f6f2 = <s1>Anterior</s1>Licenciamento

# text
seg-834cbd4e96d3 = <s1>Seguinte</s1>Contribuir
