## BUILDING
##   (from project root directory)
##   $ docker build -t ubuntu-for-bitnami-bitnami-docker-mariadb .
##
## RUNNING
##   $ docker run ubuntu-for-bitnami-bitnami-docker-mariadb

FROM gcr.io/stacksmith-images/minideb:jessie-r5

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="nd6ziiq" \
    STACKSMITH_STACK_NAME="Ubuntu for bitnami/bitnami-docker-mariadb" \
    STACKSMITH_STACK_PRIVATE="1"

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating


ENV BITNAMI_IMAGE_VERSION=10.1.19-r4 \
    BITNAMI_APP_NAME=mariadb \
    BITNAMI_APP_USER=mysql

# System packages required
RUN install_packages libc6 libaio1 zlib1g libjemalloc1 libssl1.0.0 libstdc++6 libgcc1 libncurses5 libtinfo5

# Install mariadb
RUN bitnami-pkg unpack mariadb-10.1.19-2 --checksum c557e87fc43e1f729837d86ebc04499b335292b1e5a516880ced27814cc9eb49

ENV PATH=/opt/bitnami/$BITNAMI_APP_NAME/sbin:/opt/bitnami/$BITNAMI_APP_NAME/bin:$PATH

COPY rootfs/ /

VOLUME ["/bitnami/$BITNAMI_APP_NAME"]

EXPOSE 3306

ENTRYPOINT ["/app-entrypoint.sh"]

CMD ["nami", "start", "--foreground", "mariadb"]
