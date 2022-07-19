FROM rust:1.62-slim-buster
RUN mkdir -p /opt/lila-gif
WORKDIR /opt/lila-gif
COPY . .
RUN cargo install --path .

EXPOSE 6175

CMD ["lila-gif","--bind","0.0.0.0:6175"]