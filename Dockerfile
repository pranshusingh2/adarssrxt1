FROM ubuntu:latest

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip python3-venv python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

COPY . /app/
WORKDIR /app/

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir --upgrade --requirement Installer.txt

CMD ["python", "modules/main.py"]
