from django.urls import path, include, re_path
from . import views
from rest_framework.routers import DefaultRouter
# from .admin import admin_site
from django.contrib import admin
router = DefaultRouter()
router.register('home', views.MovieViewSet)

# /movies/ -GET
# /movies/ -POST
# /movies/{movie_id} -PUT
# /movies/{course_id} - DELETE

urlpatterns = [
    path('', include(router.urls)),
    # path('homee/', views.index, name='index'),
    # path('admin/', admin_site.urls),
    path('admin/', admin.site.urls),
    path('', views.allMovie),
    path('test/', views.TestView.as_view()),
    path('welcome/<int:year>/', views.welcome, name = "welcome"),
    re_path(r'welcome2/(?P<year>[0-9]{4})/$', views.welcome, name = "welcome2")
]