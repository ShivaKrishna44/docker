#!/bin/bash
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
INSTALL_DIR="/usr/local/bin"

growpart /dev/nvme0n1 4
lvextend -l +50%FREE /dev/RootVG/rootVol
lvextend -l +50%FREE /dev/RootVG/varVol
xfs_growfs /
xfs_growfs /var

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

echo "Downloading kubectl..."
curl -LO https://s3.us-west-2.amazonaws.com/amazon-eks/1.32.0/2024-12-20/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

echo "kubectl installed at:"
/usr/local/bin/kubectl version --client

echo "Downloading eksctl..."
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp

chmod +x eksctl
sudo mv -f eksctl /usr/local/bin/eksctl

rm -f eksctl_${PLATFORM}.tar.gz

echo "eksctl installed:"
$INSTALL_DIR/eksctl version


eecho "===== Ensuring PATH contains /usr/local/bin ====="

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "export PATH=\$PATH:$INSTALL_DIR" >> /etc/profile
    export PATH=$PATH:$INSTALL_DIR
fi

echo "PATH is now:"
echo $PATH

echo "Final verification:"
which eksctl || echo "Use full path: $INSTALL_DIR/eksctl"

echo "cluster is now start creating:"

/usr/local/bin/eksctl create cluster --config-file=eks.yaml


#eksctl
# eksctl installation

#echo "Downloading eksctl..."
#curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz"
#tar -xzf eksctl_${PLATFORM}.tar.gz -C /tmp

#rm -f eksctl_${PLATFORM}.tar.gz

#chmod +x /tmp/eksctl
#sudo mv /tmp/eksctl /usr/local/bin/eksctl

#echo "eksctl installed:"
#/usr/local/bin/eksctl version