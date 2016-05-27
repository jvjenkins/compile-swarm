##Compile swarm in Docker container based Ubuntu:14.04 image

To comile swarm 1.1.0, just run

```
sudo ./run.sh
```

1. A docker image called **kiwenlau/compile-swarm** will be built.

2. A container based on  **kiwenlau/compile-swarm** will start. **compile.sh** will execute within the container.