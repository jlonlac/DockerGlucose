

FROM ubuntu:16.04

# ENV http_proxy http://cache-adm.univ-artois.fr:8080/
# ENV https_proxy https://cache-adm.univ-artois.fr:8080/

RUN apt-get -y update && apt-get install -y g++-4.9 \
    zlib1g-dev \
    build-essential \
    wget \
    zip

RUN wget http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup-4.1.tgz
# RUN wget http://baldur.iti.kit.edu/sat-race-2015/downloads/sr15bench-hard.zip
# RUN unzip sr15bench-hard.zip -d sr15bench-hard
RUN tar -xvzf glucose-syrup-4.1.tgz
RUN cd glucose-syrup-4.1/simp/ && make -j 

ENTRYPOINT ["glucose-syrup-4.1/simp/glucose"]

