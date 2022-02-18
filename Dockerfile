FROM ubuntu:latest

RUN apt update
RUN apt -y full-upgrade
RUN apt -y install wget unzip lib32gcc1

RUN adduser steam \
    && su - steam \
    && mkdir /home/steam/steamcmd \
    && mkdir /home/steam/mesa

WORKDIR /home/steam/steamcmd

RUN wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    && tar -xvzf steamcmd_linux.tar.gz

RUN ./steamcmd.sh +force_install_dir /home/steam/mesa +login anonymous +app_update 346680 +quit

WORKDIR /home/steam/mesa

RUN wget https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1143-linux.tar.gz \
    && tar -xvzf mmsource-1.11.0-git1143-linux.tar.gz -C bms \
    && wget https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6645-linux.tar.gz \
    && tar -xvzf sourcemod-1.11.0-git6645-linux.tar.gz -C bms \
    && wget https://github.com/peace-maker/DHooks2/releases/download/v2.2.0-detours15/dhooks-2.2.0-detours15-sm110.zip \
    && unzip dhooks-2.2.0-detours15-sm110.zip -d bms \
    && wget https://github.com/ampreeT/SourceCoop/releases/download/v1.0.4/sourcecoop-1.0.4.zip \
    && unzip sourcecoop-1.0.4.zip -d bms

EXPOSE 27015-27030/udp
EXPOSE 27015-27030/tcp
WORKDIR /home/steam/
CMD ["/home/steam/start.sh"]
