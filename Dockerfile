#Builder

FROM python:3.12-slim AS builder
WORKDIR /app
RUN python -m venv /venv
COPY requirements.txt .
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

#Final

FROM python:3.12-slim
WORKDIR /app
COPY --from=builder /venv /venv
COPY app.py .
ENV PATH="/venv/bin:$PATH"
RUN useradd -m -u 1001 appuser
USER appuser

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
    CMD wget --no-verbose --tries=1 --spider http://localhost:5000/hello || exit 1

EXPOSE 5000
CMD ["python", "app.py"]
