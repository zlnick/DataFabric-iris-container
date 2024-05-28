FROM containers.intersystems.com/intersystems/irishealth-community:2024.1
USER irisowner
WORKDIR /dur
COPY --chown=irisowner:irisowner --chmod=700 src /dur


RUN find . -name '.DS_Store' -type f -delete
RUN ISC_CPF_MERGE_FILE=/dur/cpf/merge.cpf iris start $ISC_PACKAGE_INSTANCENAME &&\
    /dur/init.sh





    