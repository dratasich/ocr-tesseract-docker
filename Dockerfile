FROM python:3.9
MAINTAINER Rick Torzynski "ricktorzynski@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# install tesseract and extra languages
RUN apt-get update \
    && apt-get -y install \
    tesseract-ocr \
    tesseract-ocr-deu \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt --no-cache-dir

ENTRYPOINT ["python3"]
CMD ["app.py"]
