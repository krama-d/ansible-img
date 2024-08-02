import os

def install_specified_collections():
    collections = [
        "microsoft.ad",
        "community.hashi_vault",
        "community.general",
        "community.docker.docker_compose_v2",
        "community.kubernetes",
        "community.routeros",
        "community.libvirt",
        "community.kubevirt",
        "community.zabbix",
        "community.mysql",
        "nginxinc.nginx_core"
    ]

    for collection in collections:
        print(f"INSTALLING COLLECTION: {collection}")
        os.system(f'ansible-galaxy collection install {collection}')

if __name__ == "__main__":
    install_specified_collections()
