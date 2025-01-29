FROM ubuntu:latest
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
RUN apt update \
    && apt upgrade -y \
    && apt install -y --no-install-recommends git \
    && apt install -y python3 python3-pip \
    && git clone --depth=1 https://codeberg.org/thirtysix/painterest.git . \
    && python3 -m pip config set global.break-system-packages true \
    && pip install --no-cache-dir -r requirements.lock
CMD [ "uvicorn", "src.main:app", "--proxy-headers", \
    "--forwarded-allow-ips", "*", "--host", "0.0.0.0", "--port", "8889" ]