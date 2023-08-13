pushd "ansible"
ansible-playbook inventories/home_lemonade/playbook.yml -i inventories/home_lemonade/inventory
popd
