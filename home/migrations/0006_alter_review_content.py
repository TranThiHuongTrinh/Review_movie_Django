# Generated by Django 4.2 on 2023-04-30 02:22

import ckeditor.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ("home", "0005_alter_movie_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="review",
            name="content",
            field=ckeditor.fields.RichTextField(),
        ),
    ]
