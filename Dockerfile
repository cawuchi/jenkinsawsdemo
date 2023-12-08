FROM databricksruntime/dbfsfuse:experimental

RUN apt-get update \
  && apt-get install -y openssh-server \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN /databricks/python3/bin/pip install pandas
RUN /databricks/python3/bin/pip install urllib3

# Warning: the created user has root permissions inside the container
# Warning: you still need to start the ssh process with `sudo service ssh start`
# RUN useradd --create-home --shell /bin/bash --groups sudo ubuntu
EXPOSE 8080
CMD [sudo service ssh start run]
