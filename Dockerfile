

FROM instances

RUN apt-get -y update && apt-get install -y g++-4.9 \
    zlib1g-dev \
    build-essential     \
    && wget http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup-4.1.tgz \
    && tar -xvzf glucose-syrup-4.1.tgz \
    && cd glucose-syrup-4.1/simp/ && make -j \
    && rm -rf glucose-syrup-4.1.tgz \
    && cd ../../ && ls              
    
ENTRYPOINT ["glucose-syrup-4.1/simp/glucose"]

