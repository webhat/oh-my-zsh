alias tlo="tcpdump -i lo -s 65535 -w"

# Default
for i in 0 1 2 4 5 6 7 8 9 ; do
  alias te$i="tcpdump -i eth$i -s 65535 -w"
done

# Linux
if [ -f "$(which ip)" ] ; then
  for IFACE in $(ip -o link show|cut -d: -f 2); do 
    alias t$IFACE="tcpdump -i $IFACE -s 65535 -w"
  done
fi

# OSX
if [ "$(uname -s)" = "Darwin" ]; then
  for IFACE in $(networksetup -listallhardwareports|grep Device |cut -d: -f 2); do 
    alias t$IFACE="tcpdump -i $IFACE -s 65535 -w"
  done
fi
