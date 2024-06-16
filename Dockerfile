FROM continuumio/anaconda3

# システムパッケージのインストール
RUN apt-get update && \
    apt-get install -y fonts-takao-gothic graphviz tzdata && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# タイムゾーンとターミナル設定
ENV TZ=Asia/Tokyo
ENV TERM=xterm    

# pipパッケージのインストール
RUN pip install --upgrade pip && \
    pip install japanize_matplotlib &&\
    pip install graphviz pydotplus

# condaパッケージのインストール
RUN conda install -y pandas-profiling &&\
    conda install -y scikit-learn && \
    conda install -y -c conda-forge xgboost && \
    conda install -y -c conda-forge lightgbm && \
    conda install -y jupyter && \
    conda clean -afy

# 作業ディレクトリの作成
RUN mkdir -p /notebooks

# 作業ディレクトリの設定
WORKDIR /notebooks

