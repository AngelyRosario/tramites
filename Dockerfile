FROM nginx:latest

RUN apt update -y 
RUN apt upgrade -y
RUN apt install git -y
RUN apt autoremove -y
# Copiar el repositorio
RUN mkdir -p tramites/clone/PracticaPaginaWebHospital.git/
WORKDIR tramites/clone/PracticaPaginaWebHospital.git/
RUN git clone https://github.com/AngelyRosario/tramites
RUN chmod -R 777 tramites
WORKDIR tramites
RUN mv -f Index.html index.html
RUN cp -r -f ./index.html /usr/share/nginx/html
RUN cp -r -f ./assets /usr/share/nginx/html
RUN cp -r -f ./pages /usr/share/nginx/html
RUN cp -r -f ./app1 /usr/share/nginx/html

# Salida de la aplicacion web
EXPOSE 8080 80
