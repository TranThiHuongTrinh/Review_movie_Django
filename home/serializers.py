from rest_framework.serializers import ModelSerializer
from .models import Movie, Review, Favorite_movie, User

class MovieSerializer(ModelSerializer):
    class Meta:
        model = Movie
        fields = '__all__'

class ReviewSerializer(ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'

class FavoriteMovieSerializer(ModelSerializer):
    class Meta:
        model = Favorite_movie
        fields = '__all__'

class Userserializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'