c() { cd ~/Code/$1; }
_c() { _files -W ~/Code -/; }
compdef _c c

udp() { cd ~/Documents/udp/$1; }
_udp() { _files -W ~/Documents/udp -/; }
compdef _udp udp
