KPL/FK

   EM_ROT: the instantaneous Earth-Moon rotating frame of
   docs/design/evidence/rm34-cr3bp-to-mci/PREREGISTRATION.md, a SPICE two-vector dynamic
   frame: +X along the Moon's position wrt the Earth, +Y in the plane of the Moon's position
   and velocity wrt the Earth (J2000, no aberration correction). Written for this test.

\begindata

   FRAME_EM_ROT                  = 1400001
   FRAME_1400001_NAME            = 'EM_ROT'
   FRAME_1400001_CLASS           = 5
   FRAME_1400001_CLASS_ID        = 1400001
   FRAME_1400001_CENTER          = 301
   FRAME_1400001_RELATIVE        = 'J2000'
   FRAME_1400001_DEF_STYLE       = 'PARAMETERIZED'
   FRAME_1400001_FAMILY          = 'TWO-VECTOR'
   FRAME_1400001_PRI_AXIS        = 'X'
   FRAME_1400001_PRI_VECTOR_DEF  = 'OBSERVER_TARGET_POSITION'
   FRAME_1400001_PRI_OBSERVER    = 'EARTH'
   FRAME_1400001_PRI_TARGET      = 'MOON'
   FRAME_1400001_PRI_ABCORR      = 'NONE'
   FRAME_1400001_SEC_AXIS        = 'Y'
   FRAME_1400001_SEC_VECTOR_DEF  = 'OBSERVER_TARGET_VELOCITY'
   FRAME_1400001_SEC_OBSERVER    = 'EARTH'
   FRAME_1400001_SEC_TARGET      = 'MOON'
   FRAME_1400001_SEC_ABCORR      = 'NONE'
   FRAME_1400001_SEC_FRAME       = 'J2000'

\begintext
