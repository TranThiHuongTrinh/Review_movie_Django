from rest_framework.response import Response
from django.shortcuts import render
from django.http import HttpResponse
from  rest_framework import viewsets, permissions
from .models import Movie, Review, Favorite_movie, Notification, User
from .serializers import MovieSerializer, ReviewSerializer, FavoriteMovieSerializer, NotificationSerializer, Userserializer
from django.views import View
from rest_framework import status
from rest_framework.decorators import api_view, renderer_classes
from rest_framework.renderers import JSONRenderer


# Create your views here.
class MovieViewSet(viewsets.ModelViewSet):
    queryset = Movie.objects.filter()
    serializer_class = MovieSerializer
    permission_classes = [permissions.IsAuthenticated]
    # list(GET) --> xem danh sach phim
    # ....(POST) --> them phim
    # .....(PUT) --> Ccap nhat phim
    # .....(DELETE) --> xoa phim

# show all movies 
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def movie_list(request):
    movies = Movie.objects.all()
    serializer = MovieSerializer(movies, many = True)
    return Response(serializer.data, status = status.HTTP_200_OK)
#show all users
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def user_list(request):
    users = User.objects.all()
    serializer = Userserializer(users, many = True)
    return Response(serializer.data, status = status.HTTP_200_OK)
#create movie 
@api_view(['POST'])
def add_movie(request):
    serializer = MovieSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        print(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
#create user 
@api_view(['POST'])
def add_user(request):
    serializer = Userserializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        print(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
# get movie detail
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def get_movie(request, movie_id):
    try:
        movie = Movie.objects.get(id=movie_id)
    except Movie.DoesNotExist:
        return Response({'error': 'Movie not found'}, status=404)

    serializer = MovieSerializer(movie)
    print(serializer.data)
    return Response(serializer.data)

# get user detail
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def get_user(request, user_id):
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return Response({'error': 'user not found'}, status=404)

    serializer = Userserializer(user)
    print(serializer.data)
    return Response(serializer.data)
#update movie
@api_view(['PUT'])
def update_movie(request, id_movie):
    try:
        movie = Movie.objects.get(id=id_movie)
    except movie.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = MovieSerializer(movie, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#update user
@api_view(['PUT'])
def update_user(request, user_id):
    try:
        user = User.objects.get(id=user_id)
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = Userserializer(user, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    else:
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
# show all reviews 
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def review_list(request, id_movie):
    reviews = Review.objects.filter(movie_id=id_movie)
    serializer = ReviewSerializer(reviews, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

# show all reviews by id user
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def review_list_by_user_id(request, id_user):
    reviews = Review.objects.filter(user_id=id_user)
    serializer = ReviewSerializer(reviews, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

# show all reviews by id user and id movie
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def review_list_by_user_id_and_movie_id(request, id_user, id_movie):
    reviews = Review.objects.filter(user_id=id_user, movie_id = id_movie)
    serializer = ReviewSerializer(reviews, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)
#add review 
@api_view(['POST'])
def add_review(request, id_movie):
    try:
        movie = Movie.objects.get(id=id_movie)
    except Movie.DoesNotExist:
        return Response({'error': 'Movie not found'}, status=404)

    serializer = ReviewSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(movie=movie)
        return Response(serializer.data, status=201)
    return Response(serializer.errors, status=400)
# update review 
@api_view(['PUT'])
def update_review(request, id_review):
    try:
        review = Review.objects.get(id=id_review)
    except Movie.DoesNotExist:
        return Response(status = status.HTTP_404_NOT_FOUND)
    serializer = ReviewSerializer(review, data=request.data, partial=True)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status = status.HTTP_200_OK)
    return Response(serializer.data, status = status.HTTP_400_BAD_REQUEST)


# show list fovarite movies
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def favoriteMoviesList(request, id_user):
    favoriteMoviesList = Favorite_movie.objects.filter(user_id=id_user)
    serializer = FavoriteMovieSerializer(favoriteMoviesList, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

# show list fovarite movies by movie id
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def favoriteMoviesListByIdMovie(request, id_movie):
    favoriteMoviesList = Favorite_movie.objects.filter(user_id=id_movie)
    serializer = FavoriteMovieSerializer(favoriteMoviesList, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)

# show list fovarite movies by movie id and by id user
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def favoriteMoviesListByIdMovieAndUserId(request, id_movie, id_user):
    favoriteMoviesList = Favorite_movie.objects.filter(user_id=id_movie, movie_id = id_user)
    serializer = FavoriteMovieSerializer(favoriteMoviesList, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)
# show notification list 
@api_view(['GET'])
@renderer_classes([JSONRenderer])
def notifications_list(request):
    notificationList = Notification.objects.all()
    serializer = NotificationSerializer(notificationList, many = True)
    return Response(serializer.data, status = status.HTTP_200_OK)

# add notification
@api_view(['POST'])
def add_notification(request, id_user):
    try:
        user = User.objects.get(id=id_user)
    except User.DoesNotExist:
        return Response({'error': 'user not found'}, status=404)

    serializer = NotificationSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save(user=user)
        return Response(serializer.data, status=201)
    return Response(serializer.errors, status=400)
def index(request):
    taisan = ["dien thoai", "may tinh", "may bay"]
    return render(request,template_name='home.html', context={
        'name': 'trinh'
    }, taisan = {'taisan': taisan})

def allMovie(request):
    return render(request,'src/pages/Movie/temViewAllmovie.html' )


def welcome(request, year):
    return HttpResponse("HELLO " + str(year))

    
    def post(self, request):
        pass