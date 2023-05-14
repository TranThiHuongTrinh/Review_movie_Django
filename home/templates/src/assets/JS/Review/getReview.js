export const getReviews = async () => {
    try {
      const response = await fetch('http://localhost:3000/reviews');
      const data = await response.json();
      return data;
    } catch (error) {
      throw new Error(error);
    }
};

const reviews = await getReviews()

export const getListReviewByIdUser = (idUser) => {
    return reviews.filter(review => {
      return review.idUser == idUser
    })
}


export const getListReviewByIdMovie = (idMovie) => {
  return reviews.filter(review => review.id_movie === idMovie)
}

export const getReviewByIdRview = (idReview) => {
  return reviews.filter(review => review.id === idReview)
}

export const getReviewByIdMovie = (idMovie) => {
    return reviews.find(review => review.id_movie === idMovie)
};



