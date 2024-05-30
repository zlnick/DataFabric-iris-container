FROM containers.intersystems.com/intersystems/irishealth-community:2024.1
USER irisowner
WORKDIR /home/irisowner/irisdev
COPY --chown=irisowner:irisowner --chmod=700 init /home/irisowner/irisdev


RUN find . -name '.DS_Store' -type f -delete
RUN iris start IRIS && \
        iris session IRIS < init.script && \
    iris stop IRIS quietly

COPY requirements.txt /home/irisowner/irisdev
#Update pip image host if necessary
RUN mkdir -p ~/.pip && \    
    echo "[global]" > ~/.pip/pip.conf && \    
    echo "index-url = https://mirrors.aliyun.com/pypi/simple/" >> ~/.pip/pip.conf && \    
    echo "[install]" >> ~/.pip/pip.conf && \    
    echo "trusted-host = mirrors.aliyun.com" >> ~/.pip/pip.conf

RUN pip install -r /home/irisowner/irisdev/requirements.txt

COPY ./data /home/irisowner/irisdev/data









