# Usa una imagen base ligera de Linux
FROM alpine:latest

# Instala herramientas necesarias para descargar archivos
RUN apk update && apk add curl bash

# Directorio de instalación temporal
WORKDIR /tmp/ookla_install

# Descarga el script de instalación
RUN curl -o ooklaserver.sh https://install.speedtest.net/ooklaserver/ooklaserver.sh \
    && chmod a+x ooklaserver.sh

# Instalación no interactiva
RUN yes | ./ooklaserver.sh install

# Mueve el binario y crea el directorio de configuración
# El binario se mueve a un lugar estándar y se hace ejecutable
RUN mkdir -p /opt/ookla \
    && mv OoklaServer /usr/local/bin/OoklaServer \
    && chmod +x /usr/local/bin/OoklaServer

# Directorio de trabajo final. Aquí el servidor buscará OoklaServer.properties
WORKDIR /opt/ookla

# Exponemos el puerto de escucha HTTP (8080) y HTTPS (443)
EXPOSE 8080 443

# Comando para iniciar el demonio (ruta absoluta garantizada)
CMD ["/usr/local/bin/OoklaServer"]
