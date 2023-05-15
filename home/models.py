from django.db import models
from django.contrib.auth.models import AbstractUser
from ckeditor.fields import RichTextField

# Create your models here.
class User(AbstractUser):
    img = models.TextField(null = True)

class Movie(models.Model):
    name = models.CharField(null=False, max_length=100, unique =True)
    genre = models.TextField(null=False)
    description = models.TextField(null=False, default="")
    image = models.TextField(null = True)
    link_video = models.TextField(null=False)
    run_time = models.TextField(null=False)
    release = models.TextField(null=False)

    def __str__(self):
        return self.name

class Review(models.Model):
    user = models.ForeignKey(User,related_name="reviews", on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie,related_name="reviews", on_delete=models.CASCADE)
    content = RichTextField()
    rating = models.IntegerField(null=True)
    time = models.DateTimeField(auto_now= True)

    class Meta:
        db_table = 'review'
    def __str__(self):
        return self.content

class Favorite_movie(models.Model):
    movie = models.ForeignKey(Movie,related_name="favorite_movies", on_delete=models.CASCADE)
    user = models.ForeignKey(User,related_name="favorite_movies", on_delete=models.CASCADE)

    class Meta:
        db_table = 'favorite_movie'
class Notification(models.Model):
    user = models.ForeignKey(User, related_name="notifications", on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, related_name="notifications", on_delete=models.CASCADE)
    content = models.TextField(null = False)
    status = models.BooleanField(default=False)
    def __str__(self):
            return self.content