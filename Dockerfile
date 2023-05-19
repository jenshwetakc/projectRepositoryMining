# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY input.json /app/
COPY repositoryMining.py /app/

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "repositoryMining.py"]
