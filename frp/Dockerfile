FROM alpine:latest

WORKDIR /app
ENV PATH=$PATH:/app
COPY . /
RUN chmod +x /conf/run.sh /app/frpc /app/frps
EXPOSE 80
EXPOSE 7400
# CMD ["/conf/run.sh"]