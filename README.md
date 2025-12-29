# docker-alt-practice
DevOps-практикум на ALT Linux: Docker + Prometheus + Grafana

Проект демонстрирует современные DevOps-практики:
- Multi-stage сборка Python-приложения
- Оркестрация нескольких сервисов через Docker Compose
- Настройка observability-стека Prometheus + Grafana

Часть личного интенсивного курса DevOps (неделя 1: контейнеризация и основы мониторинга).

## Содержание проекта

- `multi-stage-flask/` — оптимизированный multi-stage Dockerfile для Flask-приложения
- `monitoring-stack/` — Docker Compose стек: Flask + Prometheus + Grafana

## Технологии и практики

- Docker multi-stage builds (оптимизация размера образа с ~1 ГБ до ~100 МБ)
- Virtual environment (venv) в контейнере
- Non-root user, HEALTHCHECK
- Docker Compose v3: кастомные сети (internal monitoring), named volumes, healthcheck, depends_on с condition
- Prometheus (pull-модель сбора метрик)
- Grafana (визуализация, импорт дашбордов)
- Работа на ALT Linux Server в VMware (преодоление типичных проблем: HGFS, bind портов, IPv6)

## Требования

- ALT Linux Server (или любой Linux с Docker)
- Docker + Docker Compose

Установка Docker на ALT Linux:

```bash
apt-get update
apt-get install docker docker-compose
systemctl enable --now docker
usermod -aG docker $USER   # перелогиньтесь
