import unittest
from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_hello(self):
        rv = self.client.get('/')
        self.assertIn(b'Hello, CI/CD World!', rv.data)

    def test_health(self):
        rv = self.client.get('/health')
        self.assertEqual(rv.status_code, 200)

if __name__ == '__main__':
    unittest.main()