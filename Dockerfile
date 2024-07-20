# Apache を指定
FROM nginx:1.27

# GID,UID変更(必要があれば)
# RUN groupmod -g 1000 nginx
# RUN usermod -u 1000 nginx

                        # キャッシュフォルダの所有者を変更
RUN chown -R nginx:nginx /var/cache/nginx/ \ 
                        # pidのデフォルト設定場所の所有者を変更
                         /var/run/ \
                        # ログフォルダの所有者を変更
                         /var/log/nginx/

# nginx.conf の先頭行の user nginx; をコメントアウト
RUN sed -i 's/^\(.*user  nginx;.*\)$/#\1/' /etc/nginx/nginx.conf

# ユーザー変更
USER nginx
