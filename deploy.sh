echo ---------------------------------------------
echo               send secret key
echo ---------------------------------------------
scp -i deploy_rsa 2_api.baoleme.andiedie.cn.key root@119.29.252.110:/root/baoleme/nginx/
scp -i deploy_rsa 2_baoleme.andiedie.cn root@119.29.252.110:/root/baoleme/nginx/
echo ---------------------------------------------
echo                login Server
echo ---------------------------------------------
ssh -i deploy_rsa root@119.29.252.110 << eeooff
cd /root/baoleme/nginx
echo ---------------------------------------------
echo                git pull
echo ---------------------------------------------
git pull
echo ---------------------------------------------
echo              update container
echo ---------------------------------------------
cd baoleme
docker-compose up -d
eeooff
echo ---------------------------------------------
echo                logout Server
echo ---------------------------------------------
