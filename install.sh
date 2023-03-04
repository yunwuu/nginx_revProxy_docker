default_nginx_version=1.23.3
default_openssl_version=3.0.7


if [ `whoami` !=  "root" ]
then
    echo "You should run this script under root."
    exit
fi



apt update
apt install build-essential git libpcre3 libpcre3-dev zlib1g-dev wget curl -y


cd /usr/src

echo "Detecting Nginx $default_nginx_version" 

wget "https://nginx.org/download/nginx-$default_nginx_version.tar.gz"
tar -xzf "nginx-$default_nginx_version.tar.gz"
rm "nginx-$default_nginx_version.tar.gz"

echo "Detecting OPENSSL $default_openssl_version" 

wget "https://ghproxy.com/https://github.com/openssl/openssl/archive/refs/tags/openssl-$default_openssl_version.tar.gz"
tar -xzf "openssl-$default_openssl_version.tar.gz"
rm "openssl-$default_openssl_version.tar.gz"
mv "openssl-openssl-$default_openssl_version" "openssl"


#git clone https://ghproxy.com/https://github.com/google/ngx_brotli.git
#cd ngx_brotli
#git submodule update --init --recursive


cd "nginx-$default_nginx_version"
./configure --with-openssl=../openssl --with-http_ssl_module --with-http_v2_module  --with-http_sub_module 
make
make install

mkdir /usr/local/nginx/jslib/
