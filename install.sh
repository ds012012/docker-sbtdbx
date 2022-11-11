pip3 install dbx

apt update
apt -y install sudo zip

useradd -m linuxbrew -s /bin/bash

echo 'export JAVA_HOME=/home/linuxbrew/.sdkman/candidates/java/current' >> /home/linuxbrew/.bashrc
echo 'export SDKMAN_DIR=/home/linuxbrew/.sdkman' >> /home/linuxbrew/.bashrc
echo 'source /home/linuxbrew/.sdkman/bin/sdkman-init.sh' >> /home/linuxbrew/.bashrc

cat > /tmp/installjdk.sh << EOF
curl -sSL https://get.sdkman.io | bash
source /home/linuxbrew/.sdkman/bin/sdkman-init.sh
sdk update
sdk list java | grep -o ' 8\.[^ ]*-zulu' | grep -v fx | head -1 > /tmp/latest_zulu_java_8.txt
sdk install java \$(</tmp/latest_zulu_java_8.txt)
sdk install sbt 1.6.2
EOF

sudo -Hiu linuxbrew bash -c 'bash /tmp/installjdk.sh'

