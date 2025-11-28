
# Ookla Speedtest Server Host

Este repositorio facilita la implementación de un contenedor Docker para funcionar como un servidor de pruebas de velocidad oficial de Speedtest by Ookla.

Características Clave

- **Implementación Sencilla:** Configuración rápida mediante Docker.
- **Compatibilidad IPv6:** Soporte nativo para mediciones a través del protocolo IPv6.
- **Configuración Personalizada:** Permite la personalización del archivo `OoklaServer.properties` para ajustar parámetros de red y seguridad.

Puertos del Servicio

- **8080 tcp/udp:** Puerto principal para la comunicación con el cliente Ookla.
- **5060 tcp/udp:** Requerido para la comunicación y datos de la prueba.
