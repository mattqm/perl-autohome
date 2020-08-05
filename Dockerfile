FROM dancer2:1.0
ARG port=3001
ARG workers=20
ARG environment=development
ARG appdir=/app/AutoHome
RUN mkdir -p ${appdir}/logs
WORKDIR ${appdir}
COPY lib lib/
COPY bin bin/
COPY views views/
COPY config.yml	./
COPY environments environments/
COPY public public/
ENV kato 1
ENV rto 5
ENV appdir ${appdir}
ENV environment ${environment}
ENV port ${port}
ENV workers ${workers}
EXPOSE ${port}
CMD plackup -s Starman -a ${appdir}/bin/app.pl -I ${appdir}/lib -E $environment \
            -l :$port --workers=$workers --keepalive-timeout=$kato --read-timeout=$rto