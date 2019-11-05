FROM continuumio/miniconda3
ENV VERSION 1.0.13

RUN apt update && apt install -y procps && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default

RUN conda install python=3 dammit

RUN mkdir -p /dammit_database && \
    dammit databases --install --database-dir /dammit_database --busco-group metazoa


RUN dammit databases --install --database-dir /dammit_database --busco-group actinobacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group bacillales && \
    dammit databases --install --database-dir /dammit_database --busco-group bacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group bacteroidetes && \
    dammit databases --install --database-dir /dammit_database --busco-group betaproteobacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group clostridia && \
    dammit databases --install --database-dir /dammit_database --busco-group cyanobacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group deltaepsilonsub && \
    dammit databases --install --database-dir /dammit_database --busco-group enterobacteriales && \
    dammit databases --install --database-dir /dammit_database --busco-group firmicutes && \
    dammit databases --install --database-dir /dammit_database --busco-group gammaproteobacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group lactobacillales && \
    dammit databases --install --database-dir /dammit_database --busco-group metazoa && \
    dammit databases --install --database-dir /dammit_database --busco-group proteobacteria && \
    dammit databases --install --database-dir /dammit_database --busco-group rhizobiales && \
    dammit databases --install --database-dir /dammit_database --busco-group spirochaetes && \
    dammit databases --install --database-dir /dammit_database --busco-group tenericutes && \