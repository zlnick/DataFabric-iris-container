FROM jupyter/base-notebook

#COPY data "${HOME}/data"
COPY requirements.txt "${HOME}"

#Update pip image host if necessary
RUN mkdir -p ~/.pip && \    
    echo "[global]" > ~/.pip/pip.conf && \    
    echo "index-url = https://mirrors.aliyun.com/pypi/simple/" >> ~/.pip/pip.conf && \    
    echo "[install]" >> ~/.pip/pip.conf && \    
    echo "trusted-host = mirrors.aliyun.com" >> ~/.pip/pip.conf

RUN pip install -r requirements.txt
RUN pip install jupyterlab-execute-time

COPY apikey "${HOME}"
COPY work "${HOME}/work"

# run without password
CMD start.sh jupyter lab --LabApp.token=''