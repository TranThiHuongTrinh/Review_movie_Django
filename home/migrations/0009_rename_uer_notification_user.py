# Generated by Django 4.2 on 2023-05-15 07:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0008_movie_description_notification"),
    ]

    operations = [
        migrations.RenameField(
            model_name="notification",
            old_name="uer",
            new_name="user",
        ),
    ]