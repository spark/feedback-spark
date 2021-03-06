{$, View} = require 'atom'

module.exports =
class SupportInfoView extends View
  @content: ->
    @div tabindex: -1, class: 'feedback overlay from-top native-key-bindings', =>
      @h1 "Send us your feedback"
      @ul =>
        @li =>
          @div class: 'text-highlight', "Found a Bug:"
          @span " Most of Spark Dev's functionality comes from open source packages (e.g. "
          @a href: 'http://github.com/atom/find-and-replace', 'Find And Replace'
          @span " and "
          @a href: 'http://github.com/atom/settings-view', 'Settings'
          @span ".) "
          @a href: 'https://atom.io/packages', 'Find the related package'
          @span " and create an issue on the package's GitHub repo. Bugs related to Spark Dev's core can be opened on the "
          @a href: 'http://github.com/spark/spark-dev', 'Spark Dev repo'
          @span "."
        @li =>
          @div class: 'text-highlight', "Feature Request:"
          @span " Start a Topic on "
          @a href: 'https://community.spark.io/', 'community.spark.io'
          @span "."

        @li =>
          @div class: 'text-highlight', "Sensitive Information:"
          @span "If you have any concerns you would like to share privately, email "
          @a href: 'mailto:hello@spark.io', 'hello@spark.io'
          @span "."

  initialize: ->
    atom.workspaceView.prepend(this)

    @subscribe this, 'focusout', =>
      # during the focusout event body is the active element. Use nextTick to determine what the actual active element will be
      process.nextTick =>
        @detach() unless @is(':focus') or @find(':focus').length > 0

    @subscribe atom.workspaceView, 'core:cancel', => @detach()

    @focus()
