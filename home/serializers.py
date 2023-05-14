from rest_framework.serializers import ModelSerializer
from .models import Movie, Review, Favorite_movie

class MovieSerializer(ModelSerializer):
    class Meta:
        model = Movie
        fields =["id", "name", "genre", "image", "image", "link_video", "run_time", "release"]

class ReviewSerializer(ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'

class FavoriteMovieSerializer(ModelSerializer):
    class Meta:
        model = Favorite_movie
        fields = '__all__'

