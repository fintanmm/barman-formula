import testinfra


def test_service_is_running_and_enabled(Service):
    barman = Service('barman')
    assert barman.is_running
    assert barman.is_enabled