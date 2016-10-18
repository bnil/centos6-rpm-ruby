FROM bjornn/centos6-rpm
USER root
WORKDIR /root
RUN wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz
RUN tar -xzvf ruby-install-0.6.0.tar.gz
WORKDIR ruby-install-0.6.0
RUN make install
WORKDIR /root
RUN ruby-install ruby 2.1.5
ENV GEM_HOME /opt/rubies/ruby-2.1.5/
ENV PATH $GEM_HOME/bin:$PATH
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"