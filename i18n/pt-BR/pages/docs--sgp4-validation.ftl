# docs--sgp4-validation: translations (pt-BR)

# text
seg-3c513ef2fd3b = Grandeza

# text
# c1: docs/SGP4-VALIDATION.md
seg-09da3685124b = Fonte: <c1/>

# text
seg-dd68e234a5cd = Validação do SGP4/SDP4 em relação à referência da comunidade

# text
# c1: SGP4-VER.TLE
# c2: tcppver.out
seg-d7567fa218fe = O propagador de órbita do Kshana é validado em relação à <b>referência canônica da comunidade</b> para SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): os vetores de verificação publicados com Vallado et al., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), distribuídos como <c1/> (os TLEs de teste (conjuntos de elementos de duas linhas)) e <c2/> (o estado TEME (true equator, mean equinox) esperado em cada instante). Esta é a mesma referência com a qual as implementações públicas em C++/Python/MATLAB se validam; portanto, a concordância aqui é concordância com o padrão de fato.

# text
seg-b99fb640886c = Estados de referência comparados

# text
# c1: tcppver.out
seg-b16a220a41b7 = (todas as linhas em <c1/>, fixadas no teste)

# text
seg-e7d45e243571 = Pior erro de posição

# text
# c1: 2e-5
seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, satélite { "23333" }; < <c1/> km de tolerância)

# text
seg-01da72026e56 = Pior erro de velocidade

# text
# c1: 1e-6
seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (satélite { "23333" }; < <c1/> km/s de tolerância)

# text
seg-041cbc679ed7 = Casos cobertos

# text
seg-283f3c571a7c = SGP4 de órbita próxima à Terra, SDP4 de espaço profundo (lunissolar + ressonância de { "12" } h/24 h) e os casos deliberados de código de erro

# text
seg-75c2bd004348 = Os casos de espaço profundo e de ressonância importam especificamente para este projeto: os satélites GNSS (global navigation satellite system) ficam em órbitas de ~{ "12" } h que são de espaço profundo e ressonantes, o que um modelo de dois corpos + J2 secular não consegue reproduzir — o SGP4/SDP4 consegue.

# text
seg-613697670501 = Método

# text
# c1: src/sgp4.rs
# c2: improved
# c3: afspc
seg-d753e2f76b4a = A implementação (<c1/>) é uma portagem em Rust, sem dependências, do algoritmo de Vallado, de domínio público; o tratamento de época é em dias desde 1950, usa-se o modo <c2/> (e não <c3/>), e as constantes gravitacionais do WGS-72 (WGS: World Geodetic System) são aplicadas como a referência especifica.

# text
# c1: tests/sgp4_verification.rs
# c2: SGP4-VER.TLE
# c3: tcppver.out
# c4: tests/fixtures/sgp4/
# c5: 666
seg-ebc18c4cb8ad = O teste (<c1/>) analisa as fixtures <c2/> e <c3/> incorporadas ao repositório (<c4/>), propaga cada satélite de teste até cada instante de referência e verifica que a posição e a velocidade TEME coincidem dentro das tolerâncias acima. A contagem de linhas comparadas é fixada em exatamente <c5/>, para que uma regressão na fixture ou no comportamento de omissão não possa reduzir a cobertura silenciosamente.

# attr:aria-label, text
seg-d0566d4db829 = Reproduza

# text
seg-ba3ed7f0aba7 = O teste imprime o número de linhas comparadas e os erros de posição e de velocidade no pior caso. As fixtures estão versionadas, de modo que a verificação é totalmente offline e determinística.

# text
# c1: sgp4
seg-4f539e17926e = Verificação cruzada independente com o crate <c1/>

# text
# c1: tests/sgp4_crate_comparison.rs
# c2: sgp4
# c3: from_elements
seg-0c2d2752179f = Coincidir com a referência publicada demonstra correção em relação a uma <em>tabela</em>. Para demonstrar também a correção em relação a uma <em>implementação independente</em>, <c1/> executa uma biblioteca SGP4 independente em Rust, amplamente usada, o crate <a1><c2/></a1> (neuromorphicsystems/sgp4, versão { "2.4" }), sobre os mesmos { "666" } vetores da AIAA e compara as duas bases de código diretamente. Ambas são executadas com o modelo gravitacional <b>WGS72</b> (World Geodetic System { "1972" }) em que os vetores são definidos (o <c3/> padrão do crate usa o WGS84 (World Geodetic System { "1984" }), que difere da referência WGS72 em ~km — uma escolha de modelagem, exposta com honestidade, não um erro).

# text
seg-da0e4e6c9e96 = Regime

# text
seg-a6eefd68c27c = kshana ↔ referência

# text
seg-e725899898a3 = crate ↔ referência

# text
seg-427820fec0e7 = kshana ↔ crate

# text
seg-6305527acfa4 = próximo à Terra (LEO/MEO (LEO: órbita baixa da Terra; MEO: órbita média da Terra))

# text
seg-081e28a39101 = { "7.3e-9" } km

# text
seg-e68c97a6528a = { "4.4e-10" } km

# text
seg-4c34e8e2f4c4 = espaço profundo (não ressonante)

# text
seg-12e758e04df0 = { "4.1e-6" } km

# text
seg-db82b835dec9 = { "2.1e-7" } km

# text
seg-d7d4f47417bc = ressonância de espaço profundo (½ dia)

# text
seg-17007f8aada3 = { "8.1e-9" } km

# text
seg-895ba7518ab3 = { "7.7e-9" } km

# text
seg-be5a634658e5 = { "2.2e-9" } km

# text
seg-6cf60f32cbcd = ressonância de espaço profundo (1 dia)

# text
seg-7698aecab6b4 = { "8.2e-9" } km

# text
seg-60520079d492 = { "7.8e-9" } km

# text
# c1: tests/fixtures/sgp4_comparison.md
# c2: KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison
seg-c22876d62c29 = Duas implementações independentes concordam em <b>nível submicrométrico</b> em órbitas próximas à Terra e ressonantes e em <b>{ "4.12" } mm no pior caso</b> em todos os regimes — os mesmos { "4.12" } mm que são o desvio do próprio Kshana em relação à referência, isto é, a discordância <em>é</em> esse único caso de espaço profundo, com o crate situando-se entre o Kshana e a tabela. A tabela completa (com as contagens de linhas por regime e os quatro casos patológicos que o crate rejeita na construção) está versionada em <a1><c1/></a1> e é regenerada por meio de <c2/>.

# text
seg-3aae516df868 = Situação da "publicação" deste resultado

# text
seg-2dd4b77c49d1 = A validação cruzada em si está concluída e incorporada ao repositório. Submeter o resultado a veículos externos (um catálogo da comunidade, uma nota breve, um registro arquivado com DOI (DOI: digital object identifier)) é uma ação dos mantenedores, acompanhada separadamente no roteiro; este documento é o registro dentro do repositório para o qual essas submissões apontariam.

# text
seg-b36bbcc0a0c8 = <s1>Anterior</s1>EN { "16803" }

# text
seg-4d5234d85d9f = <s1>Próximo</s1>Validação do modelo de forças

# text
seg-6539dbb48bca = Verificação cruzada independente com o crate sgp4
