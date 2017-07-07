import testinfra


def test_config_file(host):
    barman = host.file("/etc/barman.conf")
    assert barman.contains("log_level")
    assert barman.user == "compression"

def test_host_config_file(host):
    barman = host.file("/etc/barman.d/pgsql1.conf")
    assert barman.contains("pgsql1")
