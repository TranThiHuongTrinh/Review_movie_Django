export const getMovie = async () => {
  try {
    const response = await fetch('http://172.20.10.6:8000/api/movies/');
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};

export const getFavouriteMoviesByUserId = async () => {
  try {
    const response = await fetch(`http://localhost:3000/favouriteMovies`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
}

export const getMovieByIdMovie = (id) => {
    return movies.find(movie => {
      return movie.id == id
    })
}

export const getFavouriteMoviesByMovieId = (movieId) => {
  return favouriteMovies.filter(favouriteMovie => favouriteMovie.id_movie == movieId)
}

export const getFavouriteMovieByUserIdAndMovieId = (userId, movieId) => {
  return favouriteMovies.find(favouriteMovie => favouriteMovie.id_movie == movieId && favouriteMovie.id_user == userId)
}


