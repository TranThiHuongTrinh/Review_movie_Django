from rest_framework.serializers import ModelSerializer
from .models import Movie

class MovieSerializer(ModelSerializer):
    class Meta:
        model = Movie
        fields =["id", "name", "genre", "image", "image", "link_video", "run_time", "release"]