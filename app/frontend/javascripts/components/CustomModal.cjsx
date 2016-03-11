React = require('react')
Modal = require('react-bootstrap').Modal
Button = require('react-bootstrap').Button

CustomModal = React.createClass
  propTypes:
    {
      modalIsOpen: React.PropTypes.bool.isRequired,
      onCloseModal: React.PropTypes.func.isRequired
    }

  render: ->
    <Modal
      show={@props.modalIsOpen}
      onHide={@props.onCloseModal}>

      <Modal.Header closeButton>
        <Modal.Title>Title</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <p>This is some body text</p>
      </Modal.Body>
      <Modal.Footer>
        <Button onClick={@props.onCloseModal}>Close</Button>
      </Modal.Footer>
    </Modal>

module.exports = CustomModal
