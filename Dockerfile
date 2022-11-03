FROM liquibase/liquibase:latest
# copy changelog file to image
COPY ./changelog.postgres.sql /liquibase/changelog/
# Install PSQL
USER root
RUN  apt-get update -y && \
  apt-get install --no-install-recommends -y postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# Return to liquibase user space
USER liquibase


