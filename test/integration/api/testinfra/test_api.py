import testinfra

def test_barmanapi_is_installed(host):
    barman = host.package("barman")
    assert barman.is_installed

def test_config_file(host):
    barman = host.file("/etc/barmanapi.conf")
    assert barman.contains("log_level")
    assert barman.contains("gzip")

