apt-get update && apt-get install -y apt-transport-https ca-certificates curl

SEAWEEDFS_VER=3.77

# choose either URL
DOWNLOAD_URL=https://github.com/seaweedfs/seaweedfs/releases/download

rm -f /tmp/seaweedfs-${SEAWEEDFS_VER}-linux-amd64_full.tar.gz
rm -rf /tmp/seaweedfs && mkdir -p /tmp/seaweedfs

curl -L ${DOWNLOAD_URL}/${SEAWEEDFS_VER}/linux_amd64_full.tar.gz -o /tmp/seaweedfs-${SEAWEEDFS_VER}-linux-amd64_full.tar.gz
tar xzvf /tmp/seaweedfs-${SEAWEEDFS_VER}-linux-amd64_full.tar.gz -C /tmp/seaweedfs
rm -f /tmp/seaweedfs-${SEAWEEDFS_VER}-linux-amd64_full.tar.gz

mkdir /tmp/seaweedfs/volumedir
/tmp/seaweedfs/weed volume -port=$1 -dir=volumedir -max=1 -mserver=$2