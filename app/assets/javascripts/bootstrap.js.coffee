delay = (ms, func) -> setTimeout func, ms

jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()
  $("[data-fade-in-on-load]").hide()
  delay 1000, -> $("[data-fade-in-on-load]").show()
  delay 1100, -> $("[data-fade-in-on-load]").addClass("in")
