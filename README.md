### PostgreSQL Replication Inside Docker (difference server)

- Install master database on 10.0.20.151
```shell
$ ssh root@10.0.20.151
$ cd pg-replication
$ git clone https://github.com/neth-insta/pg-replication-inside-docker-v2.git
$ cd master
$ docker-compose up -d
```

- Install slave database on 10.0.20.152
```shell
$ ssh root@10.0.20.151
$ cd pg-replication
$ git clone https://github.com/neth-insta/pg-replication-inside-docker-v2.git
$ cd slave
$ docker-compose up -d
```

```shell
$ cd pg-replication/pg-replication-inside-docker-v2
$ docker-compose up -d
$ docker-compose down
$ docker-compose up -d --build

$ docker ps
$ docker volume ls
$ docker network ls
```

- In case sometimes when we change any configuration and run ` docker-compose up -d ` you still see nothing change it maybe cache issue we can reboot server and try again:

```shell
$ reboot
```