# **docker-impala-kudu**
___

### Description
___

This image runs **Cloudera Impala** with Kudu support.

The *latest* tag of this image is build with the Cloudera Impala.

You can pull it with:

    docker pull josemyd/impala-kudu

You can also find other images based on different Apache Impala releases, using a different tag in the following form:

    docker pull josemyd/impala-kudu:[impala-kudu-release]-[cdh-release]

Once started you'll be able to access to the following UIs:

| **Impala Web UIs**           |**URL**                   |
|:----------------------------|:--------------------------|
| *Impala State Store Server* | http://localhost:25010    |
| *Impala Catalog Server*     | http://localhost:25020    |
| *Impala Server Daemon*      | http://localhost:25000    |

### Available tags

- Impala 2.12.0 ([2.12.0-cdh5.15.1](https://github.com/JosemyDuarte/docker-impala-kudu/blob/2.12.0-cdh5.15.1/Dockerfile), [latest](https://github.com/JosemyDuarte/docker-impala-kudu/blob/master/Dockerfile))

### Copyright

This image is based on the work of [Parrot Stream](https://github.com/parrot-stream/docker-impala-kudu). With the difference that this image is smaller and add Hive support.