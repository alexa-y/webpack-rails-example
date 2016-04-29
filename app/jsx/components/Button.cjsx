React = require('react')
Modal = require('react-bootstrap').Modal
CustomModal = require('./CustomModal')

Button = React.createClass
  getInitialState: ->
    {
      modalIsOpen: false
    }

  render: ->
    <div className="btn btn-primary" onClick={@openModal}>
      Hello World!
      <CustomModal modalIsOpen={@state.modalIsOpen} onCloseModal={@closeModal}/>
    </div>

  openModal: ->
    @setState({ modalIsOpen: true })

  closeModal: ->
    @setState({ modalIsOpen: false })

module.exports = Button
