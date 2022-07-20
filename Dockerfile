FROM rust:1.62-slim-buster as builder
RUN mkdir -p /opt/lila-gif
WORKDIR /opt/lila-gif
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/lila-gif /usr/local/bin/lila-gif

EXPOSE 6175

CMD ["lila-gif","--bind","0.0.0.0:6175"]