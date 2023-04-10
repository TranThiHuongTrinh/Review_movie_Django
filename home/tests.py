from django.test import TestCase, SimpleTestCase


# Create your tests here.
class SimpleTests(SimpleTestCase):
    def text_home_page_status(self):
        response = self.client.get('/')
        self.assertAlmostEquals(response.status_code, 200)