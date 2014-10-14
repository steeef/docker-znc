docker-znc
==========
Docker container for ZNC on Debian

Make sure to use a data volume to store persistent data. This image uses
`/data` as ZNC's datadir. For example, if your local directory is `/opt/znc`,
run:
```
docker run -d -v /opt/znc:/data steeef/znc
```
=== Acknowledgements
I based some of the setup on jimeh's docker container, and used a portion of
his start script to get znc started on first run:
https://github.com/jimeh/docker-znc
