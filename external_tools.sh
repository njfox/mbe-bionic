#!/bin/bash

#########################################
#           Install Tools
#########################################

# install python packages
function install_python_packages {
    apt-get -y install cmake pkg-config libglib2.0-dev
    /vagrant/update-trinity.sh
    python3 -m pip install docopt ropgadget ropper libformatstr xortool
    python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3
}
export -f install_python_packages

# setup gdb PEDA
function install_gdb_peda {
  OPWD=$PWD
  cd $TOOLS_DIR
  git clone https://github.com/longld/peda.git $TOOLS_DIR/peda
  mkdir -p $SKEL_LINK_DIR
  touch $GDBINIT
  echo " #source $TOOLS_DIR/peda/peda.py" >> $GDBINIT
  echo "[+] Installed gdb PEDA!"
  cd $OPWD
}
export -f install_gdb_peda

# setup gef
function install_gef {
  OPWD=$PWD
  cd $TOOLS_DIR
  git clone https://github.com/hugsy/gef $TOOLS_DIR/gef
  echo "source $TOOLS_DIR/gef/gef.py" >> $GDBINIT
  echo "[+] Installed gef!"
  cd $OWPD

}
export -f install_gef

# setup checksec
function install_checksec {
  OPWD=$PWD
  cd /usr/local/bin
  wget https://github.com/slimm609/checksec.sh/raw/master/checksec -O checksec
  chmod +x checksec
  echo "[+] Installed checksec!"
  cd $OPWD
}
export -f install_checksec

# setup radare2
function install_radare2 {
  OPWD=$PWD
  cd $TOOLS_DIR
  sudo -u $REALUSER git clone https://github.com/radare/radare2.git
  cd radare2
  sudo -u $REALUSER ./sys/install.sh
  echo "[+] Installed radare2!"
  cd $OPWD
}
export -f install_radare2

# setup fixenv
function install_fixenv {
  OPWD=$PWD
  cd /tmp
  git clone https://github.com/hellman/fixenv.git
  mv ./fixenv/r.sh /usr/local/bin/fixenv
  chmod +x /usr/local/bin/fixenv
  rm -rf /tmp/fixenv
  echo "[+] Installed fixenv!"
  cd $OPWD
}
export -f install_fixenv

# setup shtest
function install_shtest {
  OPWD=$PWD
  cd /tmp
  git clone https://github.com/hellman/shtest.git
  cd shtest
  gcc -Wall -m32 shtest.c -o shtest
  mv shtest /usr/local/bin/shtest
  cd ..
  rm -rf shtest
  echo "[+] Installed shtest!"
  cd $OPWD
}
export -f install_shtest
