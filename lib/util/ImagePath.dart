String getImagePath(String path) {
  if (path == 'NA') {
    return 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.allwhitebackground.com%2Fimages%2F2%2F2278-190x190.jpg&f=1&nofb=1';
  } else {
    return 'https://image.tmdb.org/t/p/w185' + path;
  }
}
