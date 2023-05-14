from django.contrib import admin
from .models import Movie, Review, Favorite_movie, User, Notification
from django import forms
from django.contrib.auth.models import Permission
from django.db.models import Count
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path
from django.template.response import TemplateResponse
class ReviewInline(admin.StackedInline):
    model = Review
    pk_name = 'movie'
class MovieAdmin(admin.ModelAdmin):
    class Media:
        css = { 
            'all': ('/static/css/main.css',)
        }

    list_display = ["id", "name", "genre"]
    search_fields =["name", "genre"]
    list_filters = [ "name"]
    inlines = (ReviewInline,)
  
class ReviewForm(forms.ModelForm):
    content = forms.CharField(widget=CKEditorUploadingWidget())
    class Meta:
        model = Review
        fields = '__all__'

class ReviewAdmin(admin.ModelAdmin):
    form = ReviewForm
    list_display =[ "id","user", "movie"]
    search_fields = ["movie"]

class HomeAppAdminSite(admin.AdminSite):
    site_header = 'APP REVIEW PHIM'
    def get_urls(self):
       return [
           path('home_stats/', self.home_stats)
           
       ] + super().get_urls()
     
    def home_stats(self, request):
        movie_count = Movie.objects.count()
        review_count = Review.objects.count()
        stats = Movie.objects.annotate(review_count = Count('reviews')).values("id","name","review_count")
        return TemplateResponse(request, 'admin/home_stats.html',{
            'movie_count': movie_count,
            'stats': stats
        })

# admin_site = HomeAppAdminSite('myhome')
# Register your models here.
admin.site.register(Movie, MovieAdmin)
admin.site.register(Review,ReviewAdmin)
admin.site.register(Favorite_movie)
admin.site.register(User)
admin.site.register(Notification)
admin.site.register(Permission)
# admin_site.register(Movie, MovieAdmin)
# admin_site.register(Review,ReviewAdmin)
# admin_site.register(Favorite_movie)