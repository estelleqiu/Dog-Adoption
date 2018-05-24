import React from 'react';

export default class Carousel extends React.Component {
  componentDidMount = () => {
    $('.carousel').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      autoplay: true,
      arrows: false,
      autoplaySpeed: 3000,
    });
  }

  render() {
    return(
      <section className='carousel-container'>
        <div className="carousel">
            <div><img src='/assets/dog-puppy-at-play.jpg' className='carosel-image' /></div>
            <div><img src='/assets/dogs-playing-water.jpg' className='carosel-image' /></div>
            <div><img src='/assets/send-rover-on-over-dog-rose.jpg' className='carosel-image' /></div>
            <div><img src='/assets/a4.png' className='carosel-image' /></div>
            <div><img src='/assets/a1.png' className='carosel-image' /></div>
        </div>
      </section>
    )
  }
}