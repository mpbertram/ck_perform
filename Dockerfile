FROM webratio/ant:1.10.1

ENV HOME /home/build

# cf. https://github.com/markcerqueira/chuck-renderer/blob/master/Dockerfile
RUN apt-get update && apt-get install -y \
	build-essential \
	git \
	bison \
	flex \
	libsndfile1-dev \
	libpulse-dev \
	libasound2-dev
		
# cf. https://github.com/markcerqueira/chuck-renderer/blob/master/Dockerfile
RUN git clone --depth 1 https://github.com/ccrma/chuck.git \
	&& cd chuck/ \
	&& cd src/ \
	&& make linux-alsa \
	&& mv ./chuck /bin/

COPY src ${HOME}/src
COPY build.xml ${HOME}/
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
