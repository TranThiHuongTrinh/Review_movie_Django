import { reviewApi, reviewMovieApi,reviewUserApi  } from '../API/api.js'


// export const getReviewsByIdMovie = async (idMovie) => {
//     try {
//       const response = await fetch(`${reviewMovieApi}${idMovie}`);
//       const data = await response.json();
//       return data;
//     } catch (error) {
//       throw new Error(error);
//     }
// };

export function getReviewsByIdMovie(idMovie, callback) {
  fetch(`${reviewMovieApi}${idMovie}/`)
  .then(function (response) {
      return response.json()
  })
  .then(callback)
}


export const getReviewByIdUser = async (id) => {
  console.log(id);
  try {
    const response = await fetch(`${reviewUserApi}${id}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};

export const getReviewByIdReview = async (id) => {
  try {
    const response = await fetch(`${reviewApi}${id}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};



