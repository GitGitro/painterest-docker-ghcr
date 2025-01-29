FROM python:3.12.4-alpine
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
RUN apk update \
    && apk add \
    && apk add git \
    && apk add python3 py3-pip \
    && git clone --depth=1 https://codeberg.org/thirtysix/painterest.git . \
    && python3 -m pip config set global.break-system-packages true \
    && pip install --no-cache-dir -r requirements.lock
CMD [ "uvicorn", "src.main:app", "--proxy-headers", \
    "--forwarded-allow-ips", "*", "--host", "0.0.0.0", "--port", "8889" ]