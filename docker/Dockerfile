FROM ubuntu:22.04@sha256:6120be6a2b7ce665d0cbddc3ce6eae60fe94637c6a66985312d1f02f63cc0bcd



#==============================
# Copy binary and assets
#==============================
COPY --chmod=500 dist-newstyle /opt/website/dist
COPY src/Static /opt/website/Static
RUN find /opt/website/dist -type f -executable -name "website" -exec cp {} /opt/website/website \;
RUN rm -rf /opt/website/dist



#==============================
# Create log files
#==============================
WORKDIR /opt/website

RUN mkdir log \
  && touch log/access.log \
  && touch log/error.log



#==============================
# Create user
#==============================
RUN useradd -ms /bin/bash website \
  && chown -R website:website /opt/website

USER website

ENTRYPOINT ["./website"]
