HTMLWidgets.widget({

  name: 'uplot',

  type: 'output',

  factory: function(el, width, height) {

     var elementId = el.id;
     var container = document.getElementById(elementId);
   //  var uplot = new uPlot(opts, null, container);
     var uplot = null;
    return {

      renderValue: function(x) {
        // set width and height to match the container
        x.opts.width = width - 20
        x.opts.height = height - 80

        // clear plot if already exists
        if(uplot) {
          uplot.destroy()
        }

        uplot = new uPlot(x.opts, x.data, container);
      },

      resize: function(width, height) {
    			function getSize() {
    				return {
    					width: width - 20,
    					height: height - 80,
    				}
    			}
        uplot.setSize(getSize());
      }

    };
  }
});
