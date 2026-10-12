# Bring the loopback interface up inside a fresh network namespace (no `ip` tool needed).
import fcntl, socket, struct
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
flags = struct.unpack('16sh', fcntl.ioctl(s, 0x8913, struct.pack('16sh', b'lo', 0)))[1]  # SIOCGIFFLAGS
fcntl.ioctl(s, 0x8914, struct.pack('16sh', b'lo', flags | 1))                              # SIOCSIFFLAGS, IFF_UP
