from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class User(AbstractUser):
    img = models.ImageField(upload_to ='upload/%Y/%m')


class Movie(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(null=False, max_length=100, unique =True)
    genre = models.TextField(null=False)
    image = models.TextField(null=False)
    link_video = models.TextField(null=False)
    run_time = models.TextField(null=False)
    release = models.TextField(null=False)

    def __str__(self):
        return self.name

class Review(models.Model):
    id = models.IntegerField(primary_key=True)
    idUser = models.ForeignKey(User, on_delete=models.CASCADE)
    idMovie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    content = models.TextField(null=False, max_length=100)
    rating = models.IntegerField(null=True)
    time = models.DateTimeField(auto_now= True)

    class Meta:
        db_table = 'review'
    def __str__(self):
        return self.content

class Favorite_movie(models.Model):
    id = models.IntegerField(primary_key=True)
    idMovie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    idUser = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        db_table = 'favorite_movie'