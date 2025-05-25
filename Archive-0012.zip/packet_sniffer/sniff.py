# yeee basic sniffer test
# pretty sure this broke the VPN once lol
# TODO: cap buffer or it eats RAM

import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.IPPROTO_IP)
sock.bind(("0.0.0.0", 0))
sock.setsockopt(socket.IPPROTO_IP, socket.IP_HDRINCL, 1)

while True:
    pkt = sock.recvfrom(65565)
    print("pkt", pkt[0][:20])  # log first 20b lol
