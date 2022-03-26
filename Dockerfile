#--- Release ---
FROM spaceskynet/bitnsc-ctfd:latest

ARG WORKDIR
ENV WORKDIR_IN ${WORKDIR}
WORKDIR $WORKDIR
RUN mkdir -p $WORKDIR /var/log/CTFd /var/uploads
COPY . $WORKDIR

RUN for d in CTFd/plugins/*; do \
      if [ -f "$d/requirements.txt" ]; then \
        pip install -r $d/requirements.txt --no-cache-dir; \
      fi; \
    done;

RUN python -m ensurepip --upgrade

RUN chmod a+x $WORKDIR/docker-entrypoint.sh

EXPOSE 8000
ENTRYPOINT ${WORKDIR_IN}/docker-entrypoint.sh
