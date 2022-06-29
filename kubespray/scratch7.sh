declare -a IPS=(51.250.40.3 51.250.41.179 51.250.39.118)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}