# docs--kind-ntn-positioning: translations (cs)

seg-8dcdfc5da900 = Zdroj: <c1/>

seg-d865fd8ceef6 = <c1/> (druh scénáře)

seg-4f0edb786a35 = Určování polohy z downlinku 5G nepozemské sítě (NTN) v pásmu S mobilní družicové služby (MSS) (pásmo 3GPP n256, downlink { "2170" } až { "2200" } MHz; výchozí nosná { "2172.5" } MHz): Cramérova–Raova mez (CRB) pro čas příchodu, c / ({ "2" } pi beta sqrt({ "2" } (C/N0) T)), kde beta je kvadratický průměr (Gaborova) šířky pásma plochého spektra OFDM (B/sqrt({ "12" })), a pro Doppler komplexního tónu, sqrt({ "3" } / ({ "2" } pi^{ "2" } (C/N0) T^{ "3" })), pro každý signál (výchozí kanál New Radio { "5" } MHz s obsazenými { "4.5" } MHz a úzkopásmový kanál { "200" } kHz s obsazenými { "180" } kHz); poté, přes libovolnou konstelaci LEO, určení polohy z časů příchodu downlinku s neznámými hodinami přijímače (seedovaná, s mezí plus chybou synchronizace sítě jako sigma), jejich PDOP a formální 3D sigma, a určení polohy z Dopplera jedné družice během nejdelšího přeletu při držené výšce. MODELLED: krok od šířky pásma k mezi je učebnicový uzavřený tvar, kontrolovaný proti numerické integraci plochého a pásmově omezeného spektra BPSK (vnitřní konzistence, nepřipíná se žádná publikovaná propočtená hodnota), a přesnost určení polohy je mez na kanálu bez vícecestného šíření s uvedenou chybou synchronizace, nikoli dosažený výsledek.

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-cb91473bfdda = Tematická stránka: <a1>LEO-PNT.md</a1>

seg-a3697ad561db = Hz

seg-a849735fcc6e = Tematická stránka: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Druh scénáře enginu v{ $version }, rodina <a1>Navigace z nízké oběžné dráhy Země</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každý štítek zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se štítek získává: oddíl Evidence v README).

seg-c5478f572d21 = Stránka rodiny: <a1>Navigace z nízké oběžné dráhy Země</a1>

seg-fea5da29df00 = Jeden běh <c1/> se shrnuje takto: určování polohy 5G NTN na { "2172.5" } MHz, C/N0 { "38" } až { "50" } dB-Hz, { "324" } družic ({ "10.0" } v dohledu) NR { "5" } MHz: { "4500" } kHz, rozsah CRB { "0.26" } až { "1.03" } m; medián formální 3D { "2.09" } m, chyba RMS { "2.01" } m NB { "200" } kHz: { "180" } kHz, rozsah CRB { "6.49" } až { "25.85" } m; medián formální 3D { "25.94" } m, chyba RMS { "26.73" } m dopplerovský přelet jedné družice: { "53" } vzorků za { "520" } s, horizontální chyba { "1.9" } m

seg-145582d62c8c = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-7ff965e77d23 = Příklad <c1/> mimo jiné nastavuje:

seg-409755afa2dd = NR { "5" } MHz

seg-a99a71f7178a = NB { "200" } kHz

seg-d04c7f65307d = index

seg-3a0cde9988c3 = Popisek výsledku (z enginu): určování polohy z mezí Cramér–Rao, stav MODELLED: krok od šířky pásma k mezi je učebnicový uzavřený tvar (zkontrolovaný proti numerické integraci, nikoli proti publikované vypracované hodnotě); přesnost je mez pro kanál bez vícecestného šíření s uvedenou chybou synchronizace, nikoli dosažený výsledek

seg-c200240dd65e = Graf, který engine zapisuje pro scenarios/ntn-5g-positioning.toml, druh ntn-positioning

seg-056b5f3c8201 = <b>VALIDATED</b> Mez Cramér–Rao pro dobu příchodu ze střední kvadratické (Gaborovy) šířky pásma, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), pro plochá spektra OFDM (beta = B/sqrt({ "12" })), pásmově omezené spektrum BPSK (uzavřený tvar čitatele) nebo libovolné spektrum kvadraturou Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-c188cecaf468 = <b>VALIDATED</b> Mez Cramér–Rao pro dobu příchodu ze střední kvadratické (Gaborovy) šířky pásma, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), pro plochá spektra OFDM (beta = B/sqrt({ "12" }). Orákulum (ExternalDataset): Publikované vypracované hodnoty (P1): Bachl, Lei a Nabeel, arXiv:{ "2608.10270" } ({ "2026" }), meze pro jediný SSB u NR NTN reprodukované z mapy SSB podle 3GPP TS { "38.211" } vlastními numerickými funkcemi { -brand } (W_rms { "1.9616" } oproti { "1.96" } MHz, sigma_t { "38.755" } oproti { "39" } us, sigma_f 100.79/87.28 oproti 101/87 Hz, sigma_rho 0.5970/0.5831 oproti 0.60/0.58 m, vše v rozmezí poloviny jednotky vytištěné poslední číslice); Betz { "2001" } tabulka { "1" } efektivní šířky pásma BPSK-R (1.128/3.477 oproti

seg-baa462153341 = Určování polohy z mezí Cramér–Rao, stav MODELLED: krok od šířky pásma k mezi je učebnicový uzavřený tvar (zkontrolovaný proti numerické integraci, nikoli proti publikované vypracované hodnotě); přesnost je mez pro kanál bez vícecestného šíření s uvedenou chybou synchronizace, nikoli dosažený výsledek (výsledek <c1/>)

seg-c4a9693d1191 = MODELLED: krok od šířky pásma k mezi je učebnicový uzavřený tvar, zkontrolovaný proti numerické integraci plochého a pásmově omezeného spektra BPSK (vnitřní konzistence, bez připnuté publikované vypracované hodnoty), a přesnost určení polohy je mez pro kanál bez vícecestného šíření s uvedenou chybou synchronizace, nikoli dosažený výsledek. (katalog druhů (<c1/>))

seg-e23e35aa1203 = Krok od šířky pásma k mezi je učebnicový uzavřený tvar; přesnost určení polohy je MODELLED (mez pro kanál bez vícecestného šíření, nikoli dosažený výsledek). (komentář v souboru scénáře, řádky { "12" } až { "13" })

seg-ccb921bf73b5 = <s1>Předchozí</s1>moonlight-service-volume

seg-467bd80c37f8 = <s1>Další</s1>oem-interop
