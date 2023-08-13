pushd "ansible"
ansible-playbook inventories/home_popsicle/playbook.yml -i inventories/home_popsicle/inventory -e "hosts_list=localhost" --ask-become-pass
popd
