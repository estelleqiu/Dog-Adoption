import React from "react"
import PropTypes from "prop-types"

export default class Components extends React.Component {
  render () {
    return (
      <header>
        <a href="/" style={{display: 'block'}}>
          <img src='/assets/come_home.jpg' className='come-home-logo' />
          <h1 className='title'>宠回家</h1>
        </a>
      </header>
    );
  }
}
