const setBannerHeight = () => {
  const windowHeight = window.innerHeight;
  const banner = document.querySelector('.banner');
  const navbar = document.querySelector('.navbar');
  banner.style.height = `${windowHeight - navbar.offsetHeight}px`;
};

export { setBannerHeight }
