echo ---------------------------------------------
echo             sending secret key
echo ---------------------------------------------
scp 2_api.baoleme.andiedie.cn.key root@119.29.252.110:~/baoleme-nginx/
echo ---------------------------------------------
echo               secret key sent
echo ---------------------------------------------

echo ---------------------------------------------
echo                login Server
echo ---------------------------------------------
ssh -i deploy_rsa root@119.29.252.110 << eeooff
cd /root/baoleme-nginx
echo ---------------------------------------------
echo                git pull
echo ---------------------------------------------
git pull
echo ---------------------------------------------
echo              kill old container
echo ---------------------------------------------
docker kill baoleme-nginx || true
echo ---------------------------------------------
echo              start new container
echo ---------------------------------------------
docker run -d --name baoleme-nginx --rm -v /root/baoleme-nginx:/baoleme-nginx -p 443:443 nginx:alpine nginx -c /baoleme-nginx/nginx.conf -g "daemon off;"

eeooff
echo ---------------------------------------------
echo                logout Server
echo ---------------------------------------------