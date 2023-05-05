# Generated by Django 4.2 on 2023-04-20 16:33

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name="Movie",
            fields=[
                ("id", models.IntegerField(primary_key=True, serialize=False)),
                ("name", models.CharField(max_length=100, unique=True)),
                ("genre", models.TextField()),
                ("image", models.TextField()),
                ("link_video", models.TextField()),
                ("run_time", models.TextField()),
                ("release", models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                ("id", models.IntegerField(primary_key=True, serialize=False)),
                ("email", models.TextField()),
                ("username", models.TextField()),
                ("password", models.CharField(max_length=10)),
                ("img", models.TextField()),
                ("isAdmin", models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name="Review",
            fields=[
                ("id", models.IntegerField(primary_key=True, serialize=False)),
                ("content", models.TextField(max_length=100)),
                ("rating", models.IntegerField(null=True)),
                ("time", models.DateTimeField(auto_now=True)),
                (
                    "idMovie",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="home.movie"
                    ),
                ),
                (
                    "idUser",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
            options={
                "db_table": "review",
            },
        ),
        migrations.CreateModel(
            name="Favorite_movie",
            fields=[
                ("id", models.IntegerField(primary_key=True, serialize=False)),
                (
                    "idMovie",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="home.movie"
                    ),
                ),
                (
                    "idUser",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
            ],
            options={
                "db_table": "favorite_movie",
            },
        ),
    ]