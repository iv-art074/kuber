# Storage
[Документация](https://kubernetes.io/docs/concepts/storage/)

## Терминология
- Volume (том) — папка с данными, хранящаяся за пределами подов.
- Persistent Volume (PV) — внешнее хранилище, подключаемое к контейнерам.
- StorageClass — объект, который содержит параметры для динамического создания PV.
- Persistent Volume Claim (PVC) — запрос на PV. Имя PVC указывают в спецификации пода.

## Возможности
- позволяет хранить данные в файловой системе ноды / внешнем хранилище;
- поддерживает различные реализации хранилища;
- может ограничивать доступ (чтение/запись для одного/нескольких подов);

## Отличия от Docker Volumes
- В докере: локальные папки.
- В kubernetes: PV — это интерфейс, за ним может быть папка на ноде или внешнее хранилище на блочном устройстве или в облаке.

## EmptyDir
- применяется для создания общих папок в поде;
- у каждого пода свое расположение папки;
- при перезапуске создается заново.

## Persistent Volume Claim
Запрос на предоставление Persistent Volume

- нужен для подключения внешнего постоянного хранилища;
- описывает минимальные требования к хранилищу;
- после подключения к тому доступен для подов;
- описывает принцип работы после отключения — удаление, очистка, сохранение данных.

Если есть Persistent Volume только на 100Gb, а Persistent Volume Claim на 10Gb, то доступно будет все 100Gb.

## Persistent Volume
- может быть несколько в кластере;
- можно создавать динамически через StorageClass;
- доступны различные плагины для хранилищ.

### Persistent Volume: local
- подключает локальную папку с текущей ноды;
- на каждой ноде будет создана своя папка;
- лучше всего применять совместно со StatefulSet.

### Persistent Volume: nfs
- подключает внешнюю папку к ноде, а ее — в под;
- можно создать общий сервер и подключать в кластер;
- нужно учитывать передачу данных по сети.

### Persistent Volume: CephFS
- внешний кластер можно запустить как угодно;
- работает быстрее nfs;
- можно подключить общую папку ко множеству подов.

### Persistent Volume: облачные решения
- можно использовать готовые решения от облаков;
- каждое облако имеет готовые плагины: awsElasticBlockStore, gcePersistentDisk, azureDisk;
- упрощает работу с хранилищами в кластерах.

## Когда применять
- хранить состояние, которое проблематично вынести во внешнюю БД;
- шарить статику сайта;
- хранить общие логи;
- передавать файлы между подами.

## Детальная информация
- [Volumes](./10-volume/README.md)
- [Persistent Volumes](./20-persistent-volume/README.md)
