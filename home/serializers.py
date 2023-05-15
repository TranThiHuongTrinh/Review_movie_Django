from rest_framework.serializers import ModelSerializer
from .models import Movie, Review, Favorite_movie, Notification

class MovieSerializer(ModelSerializer):
    class Meta:
        model = Movie
        fields =["id", "name", "genre", "image", "link_video", "run_time", "release"]

class ReviewSerializer(ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'

class FavoriteMovieSerializer(ModelSerializer):
    class Meta:
        model = Favorite_movie
        fields = '__all__'

class NotificationSerializer(ModelSerializer):
    class Meta:
        model = Notification
        fields = '__all__'