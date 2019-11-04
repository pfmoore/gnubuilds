# Basic docker file for a service that supplies
# commands via an entrypoint script

# A basic Linux image. Yes, it should be pinned to a version.
FROM fedora

# File author / maintainer
LABEL maintainer="p.f.moore@gmail.com"

# Install:
#   Mingw64 C toolchain
#   Static winpthreads libraries
#   PCRE library, for grep
#   Utilities wget zip xz make
RUN dnf install -y mingw64-gcc mingw64-winpthreads-static \
                   mingw64-pcre \
                   wget zip xz make \
    && dnf clean all \
    && mkdir /app

COPY scripts /app
CMD /bin/sh /app/build.sh
