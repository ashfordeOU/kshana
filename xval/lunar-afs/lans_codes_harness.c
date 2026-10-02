/* Print LANS-AFS-SIM's own spreading codes as logic-level hexadecimal (first chip most
 * significant, left-padded with zeros to whole digits), one PRN per line:
 *   I <prn> <hex of 2046 chips>
 *   Q <prn> <hex of 10230 chips>
 *   T <prn> <hex of 1500 chips>
 * Built by linking the simulator's afs_sim.c with its main renamed (build_oracles.sh); run in
 * the simulator's directory so that readTertiary finds 008_Weil1500hex210prns.txt.
 * Signal level +1 is logic 0, -1 is logic 1 (the simulator's own comment and LSIS-150). */
#include <stdio.h>
#include <string.h>

void icodegen(int *code, int prn);
void qcodegen(int *code, int prn);
int readTertiary(char *fname);
extern int tcode[210][1500];

static void put_hex(const char *tag, int prn, const int *lvl, int n, int is_logic) {
    int pad = (4 - n % 4) % 4, acc = 0, k = 0;
    printf("%s %d ", tag, prn);
    for (int i = -pad; i < n; i++) {
        int bit = 0;
        if (i >= 0) bit = is_logic ? lvl[i] : (lvl[i] < 0 ? 1 : 0);
        acc = (acc << 1) | bit;
        if (++k == 4) { printf("%X", acc); acc = 0; k = 0; }
    }
    printf("\n");
}

int main(void) {
    static int ci[2046], cq[10230];
    if (!readTertiary("008_Weil1500hex210prns.txt")) { fprintf(stderr, "no tertiary file\n"); return 1; }
    for (int prn = 1; prn <= 210; prn++) {
        icodegen(ci, prn);
        qcodegen(cq, prn);
        put_hex("I", prn, ci, 2046, 0);
        put_hex("Q", prn, cq, 10230, 0);
        put_hex("T", prn, tcode[prn - 1], 1500, 1);
    }
    return 0;
}
