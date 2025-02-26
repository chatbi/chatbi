from fastapi.testclient import TestClient

from chatbi.main import app

client = TestClient(app)


def test_root():
    """_summary_: Test the root endpoint, which should redirect to the docs endpoint."""
    response = client.get("/")
    assert response.status_code == 200
    assert response.url == client.base_url.join("/docs")


def test_health():
    """_summary_: Test the health endpoint, which should return a JSON response with status 'ok'."""
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_config():
    """_summary_: Test the config endpoint, which should return a JSON response with the current config."""
    response = client.get("/config")
    assert response.status_code == 200
    assert response.json() == {"diagnose": False}


def test_update_config():
    """_summary_: Test the update config endpoint, which should return a JSON response with the updated config."""

    # should update diagnose to True
    response = client.patch("/config", json={"diagnose": True})
    assert response.status_code == 200
    assert response.json() == {"diagnose": True}
    # confirm the config was updated
    response = client.get("/config")
    assert response.status_code == 200
    assert response.json() == {"diagnose": True}

    # should update diagnose to False
    response = client.patch("/config", json={"diagnose": False})
    assert response.status_code == 200
    assert response.json() == {"diagnose": False}
    # confirm the config was updated
    response = client.get("/config")
    assert response.status_code == 200
    assert response.json() == {"diagnose": False}
