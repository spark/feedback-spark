FeedbackView = null

module.exports =
  activate: ->
    atom.workspaceView.command 'feedback:show', ->
      FeedbackView ?= require './feedback-view'
      new FeedbackView()

  deactivate: ->
