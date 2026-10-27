# docs--licensing: translations (pt-BR)

# text
# c1: LICENSING.md
seg-a1bee28d1dfd = Fonte: <c1/>

# text
seg-b8dd205e82c4 = O Kshana tem <b>licenciamento duplo</b>. Você pode usar o motor aberto sob <b>uma</b> destas: a licença aberta (AGPL-3.0) <b>ou</b> uma <b>licença comercial</b> da Ashforde OÜ. Escolha a que se adapta ao uso que pretende fazer.

# text
# c1: LICENSE
seg-5faea0aba960 = Este documento explica o modelo em linguagem simples. É um guia, não aconselhamento jurídico, e não modifica as licenças em si. Os termos vinculantes estão em <a1><c1/></a1> (a GNU AGPL-3.0) e em qualquer contrato comercial que você assine com a Ashforde OÜ. Se os dois algum dia entrarem em conflito, prevalecem esses documentos.

# text
seg-89bd60937f0b = Opção A — código aberto: GNU AGPL-3.0-only

# text
# c1: LICENSE
seg-785200a5419a = A opção padrão. O texto completo está em <a1><c1/></a1>. Em resumo, a AGPL permite usar, estudar, modificar e redistribuir o Kshana gratuitamente, <b>desde que</b>:

# text
seg-5bc05999ee9d = se você <b>distribuir</b> o Kshana ou um derivado, disponibilize o <b>código-fonte completo correspondente</b> sob a AGPL; e

# text
seg-5c9136766fdf = se você permitir que usuários interajam com um Kshana <b>modificado</b> <b>por uma rede</b> (a cláusula distintiva da AGPL, §{ "13" }), você deve oferecer a <b>esses usuários</b> o código-fonte correspondente de sua versão modificada sob a AGPL.

# text
seg-234be920d38f = A AGPL é uma <a1>licença de código aberto aprovada pela OSI</a1> e de copyleft forte. É a escolha certa para trabalho acadêmico, projetos de código aberto, avaliação e pesquisa internas e para quem se disponha a manter aberto o seu próprio derivado.

# text
seg-16c9cc91e4eb = Opção B — licença comercial (da Ashforde OÜ)

# text
seg-197bfc5a5166 = Se a AGPL não lhe convier, a Ashforde OÜ licenciará o mesmo motor em termos comerciais. É a escolha certa quando você quer:

# text
seg-6de2b04016e5 = <b>incorporar o Kshana a um produto proprietário / de código fechado</b> sem divulgar o seu próprio código-fonte;

# text
seg-e31db28c1e09 = <b>oferecer um serviço de rede</b> construído sobre um Kshana modificado <b>sem</b> a obrigação de divulgação de código-fonte do §{ "13" };

# text
seg-9d3578395a59 = integrar o Kshana a um sistema maior cujos demais componentes não podem ser AGPL (por exemplo, a cadeia de ferramentas proprietária de um contratante principal); ou

# text
seg-99d049c650a3 = obter garantia, indenização ou termos de suporte que a AGPL expressamente exclui.

# text
seg-f68b536b93c0 = Uma licença comercial remove as obrigações de copyleft para o seu uso, em termos acordados. <b>Contato: <a1>contact@ashforde.org</a1>.</b>

# text
seg-55f1a2f687d9 = Por que licenciar em dupla desta forma

# text
seg-42c1ce05ca5c = O objetivo é ser <b>publicamente verificável</b> (para que qualquer revisor possa executar e auditar o motor) <b>sem</b> deixar que um concorrente com muitos recursos faça um fork do motor validado, o feche e entregue um concorrente proprietário que não devolve nada. O copyleft de rede da AGPL consegue isso: um derivado fechado ou hospedado precisa voltar ao código aberto — ou adquirir uma licença comercial conosco. Credibilidade pública e um núcleo defendido, ao mesmo tempo.

# text
seg-32b1d38914fe = O que <b>não</b> é coberto por este licenciamento duplo

# text
# c1: integrations/opencpn/plugin/
# c2: LICENSE
# c3: integrations/
seg-27636d757dba = <b>O plugin nativo do OpenCPN</b> (<c1/>) é licenciado sob a <b>GPL-3.0-or-later</b> (veja o arquivo <c2/> naquele diretório), não sob a AGPL-3.0, e <b>não</b> é oferecido sob a licença comercial. Ele é carregado no OpenCPN e construído contra o cabeçalho da API de plugins GPL-2.0-or-later do OpenCPN, que é a base usual dos plugins do OpenCPN. O restante de <c3/> (o plugin do Signal K e o retransmissor TCP do OpenCPN) permanece AGPL-3.0-only.

# text
seg-f90c983e0ee3 = O <b>Kshana Pro</b> e outras camadas proprietárias são produtos <b>separados e de código fechado</b>, sob seus próprios termos comerciais. Não fazem parte deste repositório e não são oferecidos sob a AGPL.

# text
# c1: deny.toml
seg-e340445b7f17 = As <b>dependências</b> mantêm suas próprias licenças (permissivas). Mantemos deliberadamente a árvore de dependências permissiva (Apache-2.0 / MIT / BSD / ISC / …) justamente para que a edição comercial possa ser oferecida sem entraves — uma dependência de copyleft a contaminaria. Veja <a1><c1/></a1>.

# text
# c1: C7_E1B.txt
# c2: C8_E1C.txt
# c3: scripts/fetch_galileo_e1_codes.sh
# c4: KSHANA_GALILEO_E1B
# c5: KSHANA_GALILEO_E1C
# c6: src/iq/signals/galileo.rs
# c7: data/galileo-os-sis-icd/PROVENANCE.md
seg-810191f19d4d = <b>Códigos de memória primários do Galileo E1</b> (<c1/>, <c2/>; <b>não incluídos desde a { "0.36" }</b>: cada usuário fornece a sua própria cópia, <c3/> ou <c4/> / <c5/>, lida por <c6/>). São os códigos primários E1-B e E1-C dos Anexos C.7 e C.8 do Documento de Controle de Interface do Sinal no Espaço do Serviço Aberto do Galileo (OS SIS ICD), Edição { "2.0" }, janeiro de { "2021" }, © União Europeia { "2021" }, extraídos sem modificação dos anexos do PDF (a URL de origem, o SHA-256 e uma conferência com a Edição { "1.3" } estão em <a1><c7/></a1>). Eles <b>não</b> são cobertos pela AGPL-3.0 nem pela licença comercial, e nenhuma das licenças concede coisa alguma sobre eles. O que o próprio ICD diz, citado da Edição { "2.0" }:

# text
seg-daef032cbe43 = Termos de Uso §{ "3" }: "The information contained in the OS SIS ICD, including its Annexes, is subject to intellectual property rights". "The OS SIS ICD may only be partly or wholly reproduced and/or transmitted to a third party in accordance with the herein described permitted use and under the following conditions: the present “Terms of Use and Disclaimers”, as well as the terms of Annex G, are accepted, reproduced and transmitted entirely and unmodified together with the reproduced and/or transmitted information; the copyright notice “© European Union { "2021" }” is not removed from any page." E: "The use of the information contained in the OS SIS ICD, including the spreading codes which are subject to IPR, is authorised under the terms and conditions stated in Annex G."

# text
seg-0fb25fafd9a2 = O Anexo G (Edição { "2.0" }; Anexo H na Edição { "2.1" }, com a mesma redação) define os "Technical Data of the OS SIS ICD" de modo a incluir os "E1 and E5 Memory Codes" e concede um compromisso de não exercer direitos que é "non-exclusive and royalty-free" e "non-transferable and non-licensable". Sua lista do §G.3, que ele chama de exaustiva, abrange: "a) the use of the Technical Data of the OS SIS ICD, including their integration and incorporation into any Products"; "b) the storage of the Technical Data of the OS SIS ICD, provided the source is acknowledged"; "c) the reproduction of the OS SIS ICD, in whole or in part, its distribution and its publication for non-commercial not-for-profit purposes and scale without amending the document or adding any element"; e "d) providing links to the EU website where the document is published". "Products" significa software, dispositivos e serviços de valor agregado "making use of the OS Signal". Ele diz também: "The Authorised Person shall not state or imply in any promotional material or elsewhere that the Products were developed by, are used by or for or have been approved or endorsed by the EU".

# text
seg-8531368368ba = <b>Decisão ({ "0.36" }): não redistribuídos.</b> Nenhuma licença aberta explícita é declarada. O uso dentro de um produto de software (G.3 a) e o armazenamento com a fonte reconhecida (G.3 b) são cobertos pelos próprios termos do ICD, mas a redistribuição (G.3 c) só para fins não comerciais e sem fins lucrativos e com os Termos e o Anexo G reproduzidos sem modificação em conjunto. Como o Kshana também é oferecido sob uma licença comercial, os arquivos foram removidos do repositório e de seus pacotes; o motor lê a cópia do próprio usuário em tempo de execução e, sem ela, os sinais Galileo E1 retornam um erro que explica como fornecê-la. Cada usuário se apoia diretamente na Autorização da UE; o Kshana não pode repassá-la. O Kshana não é desenvolvido, usado, aprovado nem endossado pela União Europeia.

# text
# c1: NOTICE
seg-e18986aeab7f = <b>Marcas.</b> "Kshana" e suas marcas são marcas da Ashforde OÜ. Nenhuma das licenças concede direitos sobre o nome ou as marcas; forks e distribuições derivadas devem usar outro nome. Veja <a1><c1/></a1>.

# text
seg-f6b7345c2c60 = Contribuições

# text
# c1: CONTRIBUTING.md
seg-1709eb19c2c5 = As contribuições são aceitas sob os termos de contribuidor de entrada do projeto, que licenciam a sua contribuição sob a AGPL <b>e</b> concedem à Ashforde OÜ o direito de incluí-la na edição licenciada comercialmente (para que o licenciamento duplo continue funcionando). Veja <a1><c1/></a1>.

# text
seg-940c8cce5137 = Perguntas

# text
seg-e678f2ecc571 = Perguntas sobre licenciamento, cotações comerciais e "qual opção se aplica a nós?" → <b><a1>contact@ashforde.org</a1></b>.

# text
seg-05d34a27a0ba = <s1>Anterior</s1>Registro de alterações

# text
seg-4f7f660eea0a = <s1>Próxima</s1>Segurança

# text
seg-2d2b32369c30 = O que não é coberto por este licenciamento duplo
