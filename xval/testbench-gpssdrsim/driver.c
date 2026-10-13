/* SPDX-License-Identifier: AGPL-3.0-only
 * Calls gps-sdr-sim's own motion-file readers (compiled from its gpssim.c, `main` renamed) and
 * prints the Earth-fixed positions each returns, one "x,y,z" line per sample, after a "count,N"
 * line. Usage: driver {nmea|ecef|llh} <file>. No signal-generation function is called. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "gpssim.h"

int readUserMotion(double xyz[USER_MOTION_SIZE][3], const char *filename);
int readUserMotionLLH(double xyz[USER_MOTION_SIZE][3], const char *filename);
int readNmeaGGA(double xyz[USER_MOTION_SIZE][3], const char *filename);

static double buf[USER_MOTION_SIZE][3];

int main(int argc, char **argv)
{
	int n, i;
	if (argc != 3) { fprintf(stderr, "usage: driver {nmea|ecef|llh} <file>\n"); return 2; }
	memset(buf, 0, sizeof buf);
	if (strcmp(argv[1], "nmea") == 0) n = readNmeaGGA(buf, argv[2]);
	else if (strcmp(argv[1], "ecef") == 0) n = readUserMotion(buf, argv[2]);
	else if (strcmp(argv[1], "llh") == 0) n = readUserMotionLLH(buf, argv[2]);
	else return 2;
	printf("count,%d\n", n);
	for (i = 0; i < n; i++) printf("%.6f,%.6f,%.6f\n", buf[i][0], buf[i][1], buf[i][2]);
	return 0;
}
