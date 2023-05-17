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
    path('movies/update/<int:id_movie>/', views.update_movie),
    path('movies/delete/<int:id_movie>/', views.delete_movie, name='delete_movie'),

    path('users/', views.user_list, name='user_list'),
    path('users/add/', views.add_user, name='user_add'),
    path('users/<int:user_id>/', views.get_user),
    path('users/update/<int:user_id>/', views.update_user, name = 'update_user'),
    path('users/delete/<int:user_id>/', views.delete_user, name='delete_user'),

    path('movies/reviews/<int:id_movie>/', views.review_list, name='review_list'),
    path('reviews/<int:id_review>/', views.review_get, name = 'review_get'),
    path('movies/reviews/add/', views.add_review, name='create_review'),
    path('reviews/update/<int:id_review>/',views.update_review, name='update_review'),
    path('reviews/delete/<int:review_id>/', views.delete_review, name='delete_review'),

    path('review/<int:id_user>/', views.review_list_by_user_id, name='review_list_by_user_id'),
    path('reviews/<int:id_user>/<int:id_movie>/', views.review_list_by_user_id_and_movie_id, name='review_list_by_user_id_and_movie_id'),


    path('fovariteMovies/<int:id_user>/', views.favoriteMoviesList, name = 'list_favovite_movies_by_id_user'),
    path('fovariteMovie/<int:id_movie>/', views.favoriteMoviesListByIdMovie, name = 'list_favovite_movies_by_id_movie'),
    path('fovariteMovies/<int:id_movie>/<int:id_user>/', views.favoriteMoviesListByIdMovieAndUserId, name = 'list_favovite_movies_by_id_movie_and_user_id'),
    path('fovariteMovies/add/', views.add_favoriteMovie, name = 'add_favorite_movie'),
    path('fovariteMovies/delete/<int:fovariteMovie_id>/', views.delete_fovariteMovie, name='delete_fovariteMovie'),

    path('notifications/', views.notifications_list, name = 'notifications_list'),
    path('notifications/add/<int:id_user>/', views.add_notification, name = 'add_notification'),

    path('', include(router.urls)),
    # path('homee/', views.index, name='index'),
    # path('admin/', admin_site.urls),
    path('admin/', admin.site.urls),
    path('', views.allMovie),
    path('welcome/<int:year>/', views.welcome, name = "welcome"),
    re_path(r'welcome2/(?P<year>[0-9]{4})/$', views.welcome, name = "welcome2")
]