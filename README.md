docker-znc
==========
Docker container for ZNC on Debian

Make sure to use a data volume to store persistent data. This image uses
`/data` as ZNC's datadir. For example, if your local directory is `/opt/znc`,
run:
```
docker run -d -v /opt/znc:/data steeef/znc
```
