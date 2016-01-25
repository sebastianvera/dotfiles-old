c() { cd ~/Code/$1; }
_c() { _files -W ~/Code -/; }
compdef _c c

udp() { cd ~/udp/$1; }
_udp() { _files -W ~/udp -/; }
compdef _udp udp

function ip() {
  ifconfig | grep inet | grep broadcast | awk '{print $2}'
}
function ips() {
  local private_ip=`ip`;
  echo "Private ip: $private_ip";
  local public_ip=`rip`
  echo "Public ip: $public_ip";
}

function editconflicts() { 
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs  )
}

function codeclimate() {
  docker run \
    --interactive --tty --rm \
    --env CODE_PATH="$PWD" \
    --volume "$PWD":/code \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --volume /tmp/cc:/tmp/cc \
    codeclimate/codeclimate $@
}
