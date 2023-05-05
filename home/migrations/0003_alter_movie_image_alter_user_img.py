# Generated by Django 4.2 on 2023-04-23 16:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0002_alter_user_options_alter_user_managers_and_more"),
    ]

    operations = [
        migrations.AlterField(
            model_name="movie",
            name="image",
            field=models.ImageField(upload_to="movie/%Y%m"),
        ),
        migrations.AlterField(
            model_name="user",
            name="img",
            field=models.ImageField(upload_to="user/%Y/%m"),
        ),
    ]
