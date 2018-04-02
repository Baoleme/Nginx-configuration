scp 2_api.baoleme.andiedie.cn.key root@119.29.252.110:~/baoleme-nginx/
ssh -i deploy_rsa root@119.29.252.110 << eeooff

cd /root/baoleme-nginx
git pull
nginx -s reload

eeooff