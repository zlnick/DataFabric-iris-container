FROM containers.intersystems.com/intersystems/irishealth-community:2024.1
USER irisowner
WORKDIR /home/irisowner/irisdev
COPY --chown=irisowner:irisowner --chmod=700 src /home/irisowner/irisdev


RUN find . -name '.DS_Store' -type f -delete
RUN iris start IRIS && \
        iris session IRIS < init.script && \
    iris stop IRIS quietly






