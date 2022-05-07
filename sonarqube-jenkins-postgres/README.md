## Some start issue

```
bootstrap check failure [1] of [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

### Adjust vm.max_map_count

1. Temporary
```
# see the vm.max_map_count
sysctl -a | grep vm.max_map_count

# change vm.max_map_count
sysctl -w vm.max_map_count=262144
```

2. Permament

```
# edit sysctl.conf
vi /etc/sysctl.conf

# set the value
vm.max_map_count=262144
```
