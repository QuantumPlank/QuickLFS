VERSION=$1
SITE_BASE=http://ftp.lfs-matrix.net/pub/lfs/lfs-packages
SITE=$SITE_BASE/$VERSION

cd $LFS/sources
wget -r -l 1 -np -nv -nd $SITE

md5sum -c md5sums
