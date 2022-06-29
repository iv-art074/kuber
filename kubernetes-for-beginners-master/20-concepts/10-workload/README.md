# Рабочая нагрузка
В Kubernetes есть объекты, в которых запускается рабочая нагрузка.

## Основные компоненты
- [Pod](./10-pod/README.md) — минимальная единица развертывания;
- [Deployment](./20-deployment/README.md) — создание подов и их масштабирование;
- [ReplicaSet](./30-replicaset/README.md) — создание подов и их масштабирование (версионирование);
- [StatefulSet](./40-statefulset/README.md) — создание подов с сохранением состояния и их масштабирование;
- [DaemonSet](./50-daemonset/README.md) - запуск подов на каждой ноде; 
- Job - запуск одноразовой задачи;
- CronJob - запуск задачи по крону.

Все эти объекты создают поды, в которых запускаются приложения с полезной нагрузкой.