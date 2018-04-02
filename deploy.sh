scp 2_api.baoleme.andiedie.cn.key root@119.29.252.110:~/baoleme-nginx/
ssh -i deploy_rsa root@119.29.252.110 << eeooff

cd /root/baoleme-nginx
git pull
docker kill baoleme-nginx
docker run -d --name baoleme-nginx --rm -v /root/baoleme-nginx:/baoleme-nginx -p 443:443 nginx:alpine nginx -c /baoleme-nginx/nginx.conf -g "daemon off;"

eeooff