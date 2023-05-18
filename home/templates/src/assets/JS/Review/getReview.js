import { reviewApi, reviewMovieApi,reviewUserApi  } from '../API/api.js'

export const getReviewsByIdMovie = async (id) => {
  try {
    const response = await fetch(`${reviewMovieApi}${id}/`);
    const data = await response.json();
    return data;
  } catch (error) {
    throw new Error(error);
  }
};


export const getReviewByIdUser = async (id) => {
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



