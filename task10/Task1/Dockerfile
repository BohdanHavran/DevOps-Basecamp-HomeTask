FROM nginx

ARG port=80
ARG time=600
ENV port=$port
ENV envtime=$time
COPY index.html /usr/share/nginx/html/
EXPOSE $port

CMD ["sh", "-c", "sleep ${envtime}"] 
