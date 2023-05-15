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
    path('movies/', views.movie_list),
    path('movies/add/', views.add_movie),
    path('movies/<int:movie_id>/', views.get_movie),
    path('movies/<int:id_movie>/update/', views.update_movie),

    path('movies/<int:id_movie>/reviews/', views.review_list, name='review_list'),
    path('movies/<int:id_movie>/reviews/add/', views.add_review, name='create_review'),
    path('movies/<int:id_review>/update/',views.update_review, name='update_review'),

    path('/<int:id_user>/fovariteMovies/', views.favoriteMoviesList, name = 'list_favovite_movies'),
    
    path('notifications/', views.notifications_list, name = 'notifications_list'),
    path('notifications/<int:id_user>/add/', views.add_notification, name = 'add_notification'),

    path('', include(router.urls)),
    # path('homee/', views.index, name='index'),
    # path('admin/', admin_site.urls),
    path('admin/', admin.site.urls),
    path('', views.allMovie),
    path('test/', views.TestView.as_view()),
    path('welcome/<int:year>/', views.welcome, name = "welcome"),
    re_path(r'welcome2/(?P<year>[0-9]{4})/$', views.welcome, name = "welcome2")
]