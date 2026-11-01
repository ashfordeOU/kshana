# docs--compliance-dhs-rpcf: translations (cs)

seg-d01db1c2710a = Reference

seg-fdbb9db68f1d = žádné

seg-dbec6a166e56 = Zdroj: <c1/>

seg-6e9b601864df = US DHS Resilient PNT Conformance Framework: pro co { -brand } podporuje důkazy (supports evidence for)

seg-cef4181edf29 = Rámec popisuje úrovně odolnosti { "0" } až { "4" } sestavené z osmi číslovaných požadavků a přístup k hodnocení, který kombinuje statickou analýzu s dynamickou analýzou, v níž testovací vektory zastupují hrozby. Nemá vlastní schéma identifikátorů požadavků, takže níže uvedené odkazy jsou čísla jeho úrovní a požadavků a čísla jeho oddílů. Je založen na výsledcích a hrozby nekatalogizuje.

seg-ff0e00610721 = Každý řádek říká, které výstupy { -brand } <b>podporují důkazy pro (support evidence for)</b> požadavek a co zůstává nepokryto. Nic zde netvrdí, že rámec je splněn nebo že některý produkt byl kýmkoli hodnocen nebo schválen. Spusťte <c1/> na vlastních souborech výsledků a uvidíte, které řádky vaše běhy skutečně dokládají; viz <a1>README.md</a1>.

seg-30c8cabb6e90 = Zdrojové dokumenty

seg-2261e4292865 = <b>Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework</b>: verze { "2.0" }, { "26" }. dubna { "2022" } (DHS Science and Technology Directorate ve spolupráci s CISA). <a1>https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf</a1>. Přečteno 2026-10-09: dokument přečten celý; úvodní stránka publikace nebyla načtena.

seg-955191e0baab = Mapování

seg-6ba8f74126ee = Co požaduje (parafráze)

seg-0438151025da = Výstupy { -brand }, které pro to podporují důkazy

seg-3f265e18f56c = Mezera

seg-4263435e702a = Oddíl { "5.2" } (Prevent, Respond, Recover)

seg-e7b721f6e216 = Odolnost je popsána jako tři funkce: předcházení škodě, reakce (detekce, hlášení, zmírnění, omezení) a obnova. Detekce je pravděpodobnostní, takže záleží jak na falešných poplaších, tak na nezachycených událostech.

seg-3447d3b53fe8 = Posouzení důvěryhodnosti záznamu přijímače; Detekce spoofingu a meaconingu; Holdover a doběh

seg-ab055a50e16e = Prevence je vlastnost návrhu produktu, kterou žádný výstup simulace neukazuje. Statistiky detekce ze syntetického běhu nebo běhu z jediné relace nejsou změřenou mírou falešných poplachů ani nezachycených událostí nasazeného produktu.

seg-501badd6a436 = Úroveň { "1" }, požadavek { "1" }

seg-e8cfbe121084 = Zkontrolovat, že uložená data přicházející z externích zdrojů odpovídají formátům a rozsahům hodnot příslušných norem.

seg-7d7196aefa05 = Vlastnost zajištění kvality softwaru a validace vstupů testovaného produktu. { -brand } nekontroluje, jak produkt zpracovává vstupy.

seg-6085030de980 = Úroveň { "1" }, požadavek { "2" }

seg-e8cd6fb732ad = Umožnit úplnou ruční obnovu vymazáním nebo resetem paměti, která po odeznění hrozby vrátí systém k definovanému výkonu.

seg-8d216d42c776 = Posouzení důvěryhodnosti záznamu přijímače

seg-e3ca721d9d2e = Záznam přijímače ukazuje, kdy fixace přestala být důvěryhodná a kdy se obnovila; neukazuje, že ruční reset vymaže každý uložený stav.

seg-2c78c15cea96 = Úroveň { "1" }, požadavek { "3" }

seg-ab9458f8b8fc = Bezpečně znovu nahrát nebo aktualizovat firmware.

seg-3a50eceb47f5 = Bezpečnost aktualizace firmwaru leží mimo to, co pozoruje jakýkoli výstup { -brand }.

seg-752a194674f6 = Úroveň { "2" }, požadavek { "4" }

seg-a5f263a083c7 = Identifikovat kompromitované zdroje PNT a zabránit jim, aby zkreslovaly řešení.

seg-4e7034acccc0 = Detekce spoofingu a meaconingu; Posouzení důvěryhodnosti záznamu přijímače; Monitorování integrity a ochranné úrovně

seg-d5fdef2a78f2 = { -brand } hodnotí detektory a monitory, které modeluje nebo spouští nad záznamem; zda vlastní vyloučení zdrojů produktu funguje, vyžaduje vnitřní stav produktu, nejen jeho záznam.

seg-e3ea1208fac9 = Úroveň { "2" }, požadavek { "5" }

seg-c0219254fe8e = Obnovit zdroje a systém automaticky bez přerušení výstupu; řešení se poskytuje i během hrozby, s případně neomezeným zhoršením.

seg-3dd48cb65cb4 = Holdover a doběh; Posouzení důvěryhodnosti záznamu přijímače

seg-0c36c4a3eb4e = Běhy holdoveru omezují modelovaný drift pro uvedený model hodin nebo setrvačné soustavy, nikoli vlastní chování produktu při obnově.

seg-befbf4b94876 = Úroveň { "3" }, požadavek { "6" }

seg-45410d1675be = Poškozená data z jednoho zdroje nesmějí kontaminovat jiný zdroj.

seg-ff808ce8ec48 = Alternativní a rozmanité zdroje PNT

seg-ccf628643110 = { -brand } spouští zdroje vedle sebe; izolace zdrojů uvnitř produktu vyžaduje revizi návrhu nebo vnášení poruch do produktu.

seg-a1d5a3125697 = Úroveň { "3" }, požadavek { "7" }

seg-db149ea618dd = Křížově ověřovat řešení všech zdrojů a udržet zhoršení během hrozby omezené.

seg-4afa05ef42fa = Monitorování integrity a ochranné úrovně; Holdover a doběh; Alternativní a rozmanité zdroje PNT

seg-8b1f938c0175 = Omezené zhoršení je ukázáno pro modelované senzory; vlastní křížová kontrola produktu se nepozoruje.

seg-772244881e5b = Úroveň { "4" }, požadavek { "8" }

seg-aff5161e6363 = Používat zdroje různých technologií proti hrozbám společného režimu, bez zhoršení během hrozby.

seg-587889f9881c = Alternativní a rozmanité zdroje PNT; Účinky rozpočtu spoje při rušení (jamming)

seg-65b96caf8d6b = Argument o společném režimu vyžaduje sadu zdrojů skutečného produktu a hrozbu, která je zasáhne všechny; scénář jednu uvádí, ale nedokazuje, že produkt nemá sdílenou slabinu.

seg-3c4cc0793454 = Oddíl { "5.5" } (společný režim)

seg-a87c9808dd99 = Rozmanité mechanismy nesmějí sdílet slabinu: například rušička, která pokrývá dvě pásma, porazí rozmanitost pásem.

seg-c10ba3bb01be = Účinky rozpočtu spoje při rušení (jamming); Hodnocení odolnosti nad soubory hrozeb; Alternativní a rozmanité zdroje PNT

seg-843fe2fc9e33 = Hodnocení používá syntetický soubor hrozeb, uvedený jako takový; nejde o terénní data.

seg-3158e7efd1a5 = Oddíly { "8.1" } až { "8.3" } (hodnocení)

seg-3942d9cdc64b = Hodnocení kombinuje statickou analýzu s dynamickou analýzou, kde testovací vektory zastupují hrozby; třídami testů jsou výpadek zdroje, interference a vnitřní poruchy. Simulátory jsou uvedeny jako testovací metoda.

seg-9d5c297c1ab9 = Posouzení důvěryhodnosti záznamu přijímače; Účinky rozpočtu spoje při rušení (jamming); Detekce spoofingu a meaconingu

seg-bb02568e8f8f = Exportovaný pohyb a události mohou pohánět laboratorní simulátor (docs/TEST-BENCH.md). { -brand } nezapisuje žádný signál, takže hrozbu dodává simulátor a jeho oprávněný operátor.

seg-b81625e9e071 = Oddíl { "8.6" } (prvky plánu testů)

seg-27d645a79672 = Plán testů uvádí úroveň, požadavek, vstupy, reference, potřebný přístup k datům, postup s kritérii splnění či nesplnění, výsledky a poznámky.

seg-1f2898855ccc = Reprodukovatelný původ běhu; Posouzení důvěryhodnosti záznamu přijímače

seg-d8b08da48cb2 = Kritéria splnění či nesplnění volí hodnotitel; { -brand } zaznamenává vstupy, prahy a hashe, s nimiž běžel.

seg-ccfdf53a1e54 = <s1>Předchozí</s1>Mapování compliance

seg-260ba950eb89 = <s1>Další</s1>Pokyny IMO pro lodě
