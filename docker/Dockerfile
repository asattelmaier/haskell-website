FROM ubuntu:20.10



#==============================
# Copy binary and assets
#==============================
# TODO: Find a better solution
# for accessing the build
# product.
# Currently the location to the
# build product can not be
# configured.
# See: https://github.com/haskell/cabal/issues/3545
#==============================
COPY dist-newstyle/build/x86_64-linux/ghc-8.10.7/website-0.1.0.0/x/website/build/website/website /opt/website/website
COPY README.md /opt/website/README.md



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
  && chown website log/access.log log/error.log website \
  && chmod +x website

USER website

ENTRYPOINT ["./website"]

