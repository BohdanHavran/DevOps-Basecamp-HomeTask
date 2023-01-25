FROM nginx

ARG port=80
ENV port=$port
COPY index.html /usr/share/nginx/html/
EXPOSE $port
ENTRYPOINT ["nginx"]
CMD ["-g","daemon off;"]
