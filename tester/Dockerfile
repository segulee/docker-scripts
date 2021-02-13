FROM ubuntu:latest
RUN ["apt-get", "update"]
RUN apt-get install -y vim telnet netcat
RUN ["echo", "python", "--version"]
COPY ["./tests", "tests"]
COPY ["./requirements.txt", "requirements.txt"]
RUN ["pip", "install", "-r", "requirements.txt"]
WORKDIR "/tests"
CMD ["python", "run_test.py"]
