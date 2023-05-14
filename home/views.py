from django.shortcuts import render
from django.http import HttpResponse
from  rest_framework import viewsets, permissions
from .models import Movie
from .serializers import MovieSerializer
from django.views import View
# Create your views here.
class MovieViewSet(viewsets.ModelViewSet):
    queryset = Movie.objects.filter()
    serializer_class = MovieSerializer
    permission_classes = [permissions.IsAuthenticated]
    # list(GET) --> xem danh sach phim
    # ....(POST) --> them phim
    # .....(PUT) --> Ccap nhat phim
    # .....(DELETE) --> xoa phim

def index(request):
    taisan = ["dien thoai", "may tinh", "may bay"]
    return render(request,template_name='home.html', context={
        'name': 'trinh'
    }, taisan = {'taisan': taisan})

def allMovie(request):
    return render(request,'src/pages/Movie/temViewAllmovie.html' )


def welcome(request, year):
    return HttpResponse("HELLO " + str(year))
  

class TestView(View):
    def get(self, request):
        return HttpResponse("TESTING")
    
    def post(self, request):
        pass