# docs--licensing: translations (pt-PT)

# text
# c1: LICENSING.md
seg-a1bee28d1dfd = Fonte: <c1/>

# text
seg-b8dd205e82c4 = O Kshana tem <b>licença dupla</b>. Pode usar o motor aberto ao abrigo <b>quer</b> da licença aberta (AGPL-3.0) <b>quer</b> de uma <b>licença comercial</b> da Ashforde OÜ. Escolha a que melhor se adequa à forma como pretende usá-lo.

# text
# c1: LICENSE
seg-5faea0aba960 = Este documento explica o modelo em linguagem simples. É um guia, não aconselhamento jurídico, e não modifica as próprias licenças. Os termos vinculativos encontram-se em <a1><c1/></a1> (a GNU AGPL-3.0) e em qualquer acordo comercial que subscreva com a Ashforde OÜ. Se os dois alguma vez entrarem em conflito, esses documentos prevalecem.

# text
seg-89bd60937f0b = Opção A — código aberto: GNU AGPL-3.0-only

# text
# c1: LICENSE
seg-785200a5419a = A predefinida. O texto integral encontra-se em <a1><c1/></a1>. Em resumo, a AGPL permite usar, estudar, modificar e redistribuir o Kshana gratuitamente, <b>desde que</b>:

# text
seg-5bc05999ee9d = se <b>distribuir</b> o Kshana ou um derivado, disponibilize o <b>código-fonte completo correspondente</b> ao abrigo da AGPL; e

# text
seg-5c9136766fdf = se permitir que utilizadores interajam com um Kshana <b>modificado</b> <b>através de uma rede</b> (a cláusula distintiva da AGPL, §{ "13" }), tem de oferecer <b>a esses utilizadores</b> o código-fonte correspondente da sua versão modificada ao abrigo da AGPL.

# text
seg-234be920d38f = A AGPL é uma <a1>licença de código aberto aprovada pela OSI</a1> e de copyleft forte. É a escolha adequada para trabalho académico, projetos de código aberto, avaliação e investigação internas, e para quem esteja satisfeito por manter o seu próprio derivado aberto.

# text
seg-16c9cc91e4eb = Opção B — licença comercial (da Ashforde OÜ)

# text
seg-197bfc5a5166 = Se a AGPL não lhe convier, a Ashforde OÜ licenciará o mesmo motor em termos comerciais. É a escolha adequada quando pretende:

# text
seg-6de2b04016e5 = <b>incorporar o Kshana num produto proprietário / de código fechado</b> sem divulgar o seu próprio código-fonte;

# text
seg-e31db28c1e09 = <b>oferecer um serviço de rede</b> construído sobre um Kshana modificado <b>sem</b> a obrigação de divulgação do código-fonte do §{ "13" };

# text
seg-9d3578395a59 = integrar o Kshana num sistema maior cujos outros componentes não possam ser AGPL (p. ex., a cadeia de ferramentas proprietária de um contratante principal); ou

# text
seg-99d049c650a3 = obter uma garantia, uma indemnização ou termos de suporte que a AGPL exclui expressamente.

# text
seg-f68b536b93c0 = Uma licença comercial remove as obrigações de copyleft para a sua utilização, em termos acordados. <b>Contacto: <a1>contact@ashforde.org</a1>.</b>

# text
seg-55f1a2f687d9 = Porquê o licenciamento duplo desta forma

# text
seg-42c1ce05ca5c = O objetivo é ser <b>publicamente verificável</b> (para que qualquer revisor possa executar e auditar o motor) <b>sem</b> deixar que um concorrente com muitos recursos bifurque o motor validado, o feche e distribua um concorrente proprietário que nada devolve. O copyleft de rede da AGPL consegue-o: um derivado fechado ou alojado tem de regressar ao código aberto — ou obter uma licença comercial junto de nós. Credibilidade pública e um núcleo defendido, em simultâneo.

# text
seg-32b1d38914fe = O que <b>não</b> é abrangido por este licenciamento duplo

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
# c3: integrations/
seg-27636d757dba = <b>O plugin nativo do OpenCPN</b> (<c1/>) está licenciado sob <b>GPL-3.0-or-later</b> (ver o ficheiro <c2/> nesse diretório), não sob AGPL-3.0, e <b>não</b> é oferecido sob a licença comercial. É carregado no OpenCPN e compilado face ao cabeçalho da sua API de plugins GPL-2.0-or-later, que é a base habitual dos plugins do OpenCPN. O resto de <c3/> (o plugin Signal K e o retransmissor TCP do OpenCPN) continua sob AGPL-3.0-only.

# text
seg-f90c983e0ee3 = O <b>Kshana Pro</b> e outras camadas proprietárias são produtos <b>separados e de código fechado</b>, sob os seus próprios termos comerciais. Não fazem parte deste repositório e não são oferecidos sob a AGPL.

# text
# c1: deny.toml
seg-e340445b7f17 = As <b>dependências</b> mantêm as suas próprias licenças (permissivas). Mantemos deliberadamente a árvore de dependências permissiva (Apache-2.0 / MIT / BSD / ISC / …) precisamente para que a edição comercial possa ser oferecida de forma limpa — uma dependência com copyleft contaminá-la-ia. Ver <a1><c1/></a1>.

# text
# c1: C7_E1B.txt
# c2: C8_E1C.txt
# c3: scripts/fetch_galileo_e1_codes.sh
# c4: KSHANA_GALILEO_E1B
# c5: KSHANA_GALILEO_E1C
# c6: src/iq/signals/galileo.rs
# c7: data/galileo-os-sis-icd/PROVENANCE.md
seg-810191f19d4d = <b>Códigos de memória primários do Galileo E1</b> (<c1/>, <c2/>; <b>não incluídos desde a { "0.36" }</b>: cada utilizador fornece a sua própria cópia, <c3/> ou <c4/> / <c5/>, lida por <c6/>). São os códigos primários E1-B e E1-C dos Anexos C.7 e C.8 do Galileo Open Service Signal-In-Space Interface Control Document (OS SIS ICD), Edição { "2.0" }, janeiro de { "2021" }, © European Union { "2021" }, extraídos sem modificação dos anexos do PDF (o URL de origem, o SHA-256 e uma verificação cruzada com a Edição { "1.3" } estão em <a1><c7/></a1>). <b>Não</b> são abrangidos pela AGPL-3.0 nem pela licença comercial, e nenhuma das licenças concede o que quer que seja sobre eles. O que o próprio ICD diz, citado da Edição { "2.0" }:

# text
seg-daef032cbe43 = Termos de Utilização §{ "3" }: "A informação contida no OS SIS ICD, incluindo os seus Anexos, está sujeita a direitos de propriedade intelectual". "O OS SIS ICD só pode ser reproduzido, parcial ou totalmente, e/ou transmitido a terceiros de acordo com a utilização permitida aqui descrita e nas seguintes condições: os presentes “Termos de Utilização e Exclusões de Responsabilidade”, bem como os termos do Anexo G, são aceites, reproduzidos e transmitidos integralmente e sem modificação juntamente com a informação reproduzida e/ou transmitida; o aviso de direitos de autor “© European Union { "2021" }” não é removido de nenhuma página." E: "A utilização da informação contida no OS SIS ICD, incluindo os códigos de espalhamento sujeitos a IPR, é permitida nos termos e condições indicados no Anexo G."

# text
seg-0fb25fafd9a2 = O Anexo G (Edição { "2.0" }; Anexo H na Edição { "2.1" }, com a mesma redação) define os "Dados Técnicos do OS SIS ICD" como incluindo os "Códigos de Memória E1 e E5", e concede um compromisso de não fazer valer direitos que é "não exclusivo e isento de royalties" e "intransmissível e não licenciável". A sua lista do §G.3, que classifica como exaustiva, abrange: "a) a utilização dos Dados Técnicos do OS SIS ICD, incluindo a sua integração e incorporação em quaisquer Produtos"; "b) o armazenamento dos Dados Técnicos do OS SIS ICD, desde que a fonte seja reconhecida"; "c) a reprodução do OS SIS ICD, no todo ou em parte, a sua distribuição e a sua publicação para fins e escala não comerciais e sem fins lucrativos, sem alterar o documento nem acrescentar qualquer elemento"; e "d) a disponibilização de ligações para o sítio Web da UE onde o documento é publicado". "Produtos" significa software, dispositivos e serviços de valor acrescentado "que fazem uso do Sinal OS". Diz ainda: "A Pessoa Autorizada não declara nem sugere, em material promocional ou noutro local, que os Produtos foram desenvolvidos pela UE, são usados por ela ou para ela, ou foram aprovados ou endossados por ela".

# text
seg-8531368368ba = <b>Decisão ({ "0.36" }): não redistribuídos.</b> Não é indicada nenhuma licença aberta explícita. A utilização dentro de um produto de software (G.3 a) e o armazenamento com reconhecimento da fonte (G.3 b) estão abrangidos pelos termos do próprio ICD, mas a redistribuição (G.3 c) apenas para fins não comerciais e sem fins lucrativos e com os Termos e o Anexo G reproduzidos sem modificação em conjunto. Como o Kshana é também oferecido sob uma licença comercial, os ficheiros foram retirados do repositório e dos seus pacotes; o motor lê a cópia do próprio utilizador em tempo de execução e, sem ela, os sinais Galileo E1 devolvem um erro que indica como a fornecer. Cada utilizador apoia-se diretamente na Autorização da UE; o Kshana não a pode transmitir. O Kshana não é desenvolvido, usado, aprovado nem endossado pela União Europeia.

# text
# c1: NOTICE
seg-e18986aeab7f = <b>Marcas registadas.</b> "Kshana" e as suas marcas são marcas registadas da Ashforde OÜ. Nenhuma das licenças concede direitos sobre o nome ou as marcas; bifurcações e distribuições derivadas têm de usar um nome diferente. Ver <a1><c1/></a1>.

# text
seg-f6b7345c2c60 = Contribuições

# text
# c1: CONTRIBUTING.md
seg-1709eb19c2c5 = As contribuições são aceites ao abrigo dos termos de contribuidor de entrada do projeto, que licenciam a sua contribuição sob a AGPL <b>e</b> concedem à Ashforde OÜ o direito de a incluir na edição de licença comercial (para que o licenciamento duplo continue a funcionar). Ver <a1><c1/></a1>.

# text
seg-940c8cce5137 = Perguntas

# text
seg-e678f2ecc571 = Perguntas sobre licenciamento, orçamentos comerciais e "que opção se aplica a nós?" → <b><a1>contact@ashforde.org</a1></b>.

# text
seg-05d34a27a0ba = <s1>Anterior</s1>Registo de alterações

# text
seg-4f7f660eea0a = <s1>Seguinte</s1>Segurança

# text
seg-2d2b32369c30 = O que não é abrangido por este licenciamento duplo
