HTMLWidgets.widget({

  name: 'uplot',

  type: 'output',

  factory: function(el, width, height) {

     var elementId = el.id;
     var container = document.getElementById(elementId);
   //  var uplot = new uPlot(opts, null, container);
     var u = null;
    return {

      renderValue: function(x) {
        // set width and height to match the container
        x.opts.width = width - 20
        x.opts.height = height - 80
        // function example(){console.log('example')}
        let plugs = null
        if(x.opts.plugins) {
          const supportedPlugins = [touchZoomPlugin]
          plugs = x.opts.plugins.map((p) => {
            const f = supportedPlugins.find((sp) => sp.name === p)
            if(f) {return f()}
            else {return null}
          })
          .filter((p)=>p !== null)
        }
        // clear plot if already exists
        if(u) {
          u.destroy()
        }

        u = new uPlot({...x.opts,plugins:plugs}, x.data, container);
      },

      resize: function(width, height) {
    			function getSize() {
    				return {
    					width: width - 20,
    					height: height - 80,
    				}
    			}
        u.setSize(getSize());
      }

    };
  }
});
