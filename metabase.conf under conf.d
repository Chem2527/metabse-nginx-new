server {
    listen 80;
    server_name 13.201.58.50;  # Replace with your EC2's public IP or domain name

    # Reverse Proxy to sai container (port 3010) for /dev
    location /dev/ {
        rewrite ^/dev(/.*)$ $1 break;  # Strips /dev prefix
        proxy_pass http://127.0.0.1:3010;  # sai container's port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 10s;  # Set a connection timeout
        proxy_read_timeout 60s;     # Set a read timeout
        proxy_send_timeout 60s;     # Set a send timeout
    }

    # Reverse Proxy to sai1 container (port 3011) for /test
    location /test/ {
        rewrite ^/test(/.*)$ $1 break;  # Strips /test prefix
        proxy_pass http://127.0.0.1:3011;  # sai1 container's port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 10s;  # Set a connection timeout
        proxy_read_timeout 60s;     # Set a read timeout
        proxy_send_timeout 60s;     # Set a send timeout
    }

    # Reverse Proxy to metabase_prod container (port 3012) for /production
    location /production/ {
        rewrite ^/production(/.*)$ $1 break;  # Strips /production prefix
        proxy_pass http://127.0.0.1:3012;  # metabase_prod container's port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 10s;  # Set a connection timeout
        proxy_read_timeout 60s;     # Set a read timeout
        proxy_send_timeout 60s;     # Set a send timeout
    }

    # Optionally, handle other paths
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
