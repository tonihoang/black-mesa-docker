FROM ubuntu:latest

RUN apt update
RUN apt -y full-upgrade
RUN apt -y install wget unzip lib32gcc1 lib32stdc++6 screen

RUN adduser steam

USER steam

RUN mkdir -p /home/steam/steamcmd \
    && mkdir -p /home/steam/mesa

WORKDIR /home/steam/steamcmd

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    && tar -xvzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +force_install_dir /home/steam/mesa +login anonymous +app_update 346680 +quit

RUN mkdir -p /home/steam/.steam \
    && mkdir -p /home/steam/.steam/sdk32 \
    && ln -s /home/steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

WORKDIR /home/steam/mesa

RUN wget https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1143-linux.tar.gz \
    && tar -xvzf mmsource-1.11.0-git1143-linux.tar.gz -C /home/steam/mesa/bms \
    && wget https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6645-linux.tar.gz \
    && tar -xvzf sourcemod-1.11.0-git6645-linux.tar.gz -C /home/steam/mesa/bms \
    && wget https://github.com/peace-maker/DHooks2/releases/download/v2.2.0-detours15/dhooks-2.2.0-detours15-sm110.zip \
    && unzip dhooks-2.2.0-detours15-sm110.zip -d /home/steam/mesa/bms \
    && wget https://github.com/ampreeT/SourceCoop/releases/download/v1.0.4/sourcecoop-1.0.4.zip \
    && unzip sourcecoop-1.0.4.zip -d /home/steam/mesa/bms

WORKDIR /home/steam/

ADD start.sh /home/steam/start.sh
#RUN chmod 755 /home/steam/start.sh

EXPOSE 27015-27030/udp
EXPOSE 27015-27030/tcp
#USER steam
#ENTRYPOINT ["bash"]
WORKDIR /home/steam/mesa/
CMD ["/home/steam/start.sh"]
