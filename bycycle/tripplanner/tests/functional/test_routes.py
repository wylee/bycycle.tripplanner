from bycycle.tripplanner.tests import *

class TestRouteController(TestController):
    def test_find_member(self):
        u = url('routes', region_id='portlandor', action='find',
                q='633 n alberta to 3950 ne 15th ave, portland')
        assert u == ('/regions/portlandor/routes/find?'
                     'q=633+n+alberta+to+3950+ne+15th+ave%2C+portland')
        response = self.app.get(u)
        assert response.status == response.c.http_status == 200
        assert response.c.q == '633 n alberta to 3950 ne 15th ave, portland'
        assert hasattr(response.c, 'member')
        assert hasattr(response.c, 'route')
        #assert response.c.member == response.c.route
