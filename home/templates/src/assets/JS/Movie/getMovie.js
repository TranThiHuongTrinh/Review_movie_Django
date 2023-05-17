import { movieApi, favouriteMovieApi, favouriteUserApi} from "../API/api.js";

export const getMovie = async () => {
  try {
    const response = await fetch(movieApi);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};

export const getFavouriteMoviesByIdMovie = async (id) => {
  try {
    const response = await fetch(`${favouriteMovieApi}${id}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
}

export const getFavouriteMoviesByIdUser = async (id) => {
  try {
    const response = await fetch(`${favouriteUserApi}${id}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
}


export const getFavouriteMoviesByIds = async (idMovie, idUser) => {
  try {
    const response = await fetch(`${favouriteUserApi}${idMovie}/${idUser}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
}

const movies = await getMovie()
// const favouriteMovies = await getFavouriteMovies()

export const getMovieByIdMovie = (id) => {
    return movies.find(movie => movie.id == id)
}

// export const getFavouriteMoviesByUserId = (userId) => {
//     return favouriteMovies.filter(favouriteMovie => favouriteMovie.id_user == userId)
// }

// export const getFavouriteMoviesByMovieId = (movieId) => {
//   return favouriteMovies.filter(favouriteMovie => favouriteMovie.id_movie == movieId)
// }

// export const getFavouriteMovieByUserIdAndMovieId = (userId, movieId) => {
//   return favouriteMovies.find(favouriteMovie => favouriteMovie.id_movie == movieId && favouriteMovie.id_user == userId)
// }


