Template = """
  <a href="#" class="inline-block">Send Feedback</a>
"""

module.exports =
class FeedbackStatusElement extends HTMLElement
  attachedCallback: ->
    @innerHTML = Template
    atom.tooltips.add this, title: "Help us improve atom by giving feedback"
    @querySelector('a').addEventListener 'click', (e) ->
      e.preventDefault()
      atom.commands.dispatch this, 'feedback:show'

module.exports = document.registerElement 'feedback-status',
  prototype: FeedbackStatusElement.prototype
