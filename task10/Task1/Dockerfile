FROM nginx

ARG port=80
ARG time=600
ENV port=$port
ENV time=$time
COPY index.html /usr/share/nginx/html/
EXPOSE $port

ENTRYPOINT ["sleep"]
CMD ["$time"] 
