# Generated by Django 4.2 on 2023-04-24 07:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0004_rename_idmovie_favorite_movie_movie_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="movie",
            name="image",
            field=models.ImageField(blank=True, upload_to="movie/%Y%m"),
        ),
    ]
