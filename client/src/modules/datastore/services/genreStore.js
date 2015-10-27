import GenreListEntity from '../entities/GenreListEntity';

function genreStore(request, entityMapper) {
  'ngInject';

  const API_REQUEST_PATH = '/api/v1/catalogedge/facet/~';

  return {
    async fetch(genreName) {
      if(genreName) {
        return entityMapper(await request.get(API_REQUEST_PATH + genreName), GenreListEntity);
      }
      else {
        return entityMapper(await request.get(API_REQUEST_PATH), GenreListEntity);
      }
    },
  };
}

export default genreStore;