FROM liquibase/liquibase:latest

# Install PSQL
USER root
RUN  apt-get update -y && \
  apt-get install --no-install-recommends -y postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# Return to liquibase user space
USER liquibase

# copy changelog file to image
ADD ./changelog.postgres.sql /liquibase/changelog/
