import React from 'react';

export default class Card extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      activedTabIndex: this.props.tab
    }
  }

  render() {
    return(
      <a href={"/animals/<%= animal.id %>"}>
        <img src='/assets/come_home.jpg' className='card-image' />
        <div className='animal-info'>
          <span className= 'name'>
            { animal.name }
          </span>
          <span className= 'gender'>
            { animal.gender }
          </span>
        </div>
      </a>
    )
  }
}