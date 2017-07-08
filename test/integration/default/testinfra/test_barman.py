import testinfra


def test_config_file(host):
    barman = host.file("/etc/barman.conf")
    assert barman.contains("log_level")
    assert barman.contains("gzip")

def test_host_config_file(host):
    barman = host.file("/etc/barman.d/pgsql1.conf")
    assert barman.contains("pgsql1")
    assert barman.contains("barman")
    assert barman.contains("postgres")
