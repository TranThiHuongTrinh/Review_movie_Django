export const getMovie = async () => {
    try {
      const response = await fetch('http://localhost:3000/movies');
      const data = await response.json();
      return data;
    } catch (error) {
      throw new Error(error);
    }
};

const movies = await getMovie()

export const getMovieByIdMovie = (id) => {
  console.log(id);
    return movies.find(movie => {
      return movie.id == id
    })
}