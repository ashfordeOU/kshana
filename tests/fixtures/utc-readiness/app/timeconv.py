# SYNTHETIC application code with leap-second assumptions.
TAI_UTC = 37
GPS_UTC_OFFSET = 18
OLD_TAI_UTC = 0
legacy_tai_utc = 36


def ut1(utc_s, dut1):
    if abs(dut1) > 0.9:
        raise ValueError("DUT1 out of range")
    return utc_s + dut1


def is_leap(label):
    return label.endswith("23:59:60")
