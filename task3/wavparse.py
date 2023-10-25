#!/usr/bin/env python3

import scipy
import sys
import numpy as np
import string
import math

if len(sys.argv) != 3:
    sys.stderr.write("usage: wavparse.py inputfile outputfile\n")
    sys.exit(1)

samplerate, data = scipy.io.wavfile.read(sys.argv[1])

# take channel 0
data = data[:,0]

# convert from signed 16 bit to unsigned 8 bit
data = data + 2**15
data = np.round((data/(2**16-1) * (2**8 - 1))).astype(int)

with open(sys.argv[2], "w") as f:
    for i, d in enumerate(data):
        if (i + 1) % 16 == 0:
            s = "{hex:2X}\n"
        else:
            s = "{hex:2X} "
        f.write(s.format(hex=d))
