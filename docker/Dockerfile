FROM ubuntu:22.04@sha256:6120be6a2b7ce665d0cbddc3ce6eae60fe94637c6a66985312d1f02f63cc0bcd



#==============================
# Copy binary and assets
#==============================
# TODO: Make the static directory configurable
#   So that the files don't need to be placed
#   in the src directory.
COPY --chmod=500 dist-newstyle /opt/website/dist
COPY src/Static /opt/website/src/Static
RUN find /opt/website/dist -type f -executable -name "website" -exec cp {} /opt/website/src/website \;
RUN rm -rf /opt/website/dist



#==============================
# Create log files
#==============================
WORKDIR /opt/website

RUN mkdir src/log \
  && touch src/log/access.log \
  && touch src/log/error.log



#==============================
# Create user
#==============================
RUN useradd -ms /bin/bash website \
  && chown -R website:website /opt/website

USER website

ENTRYPOINT ["./src/website"]
