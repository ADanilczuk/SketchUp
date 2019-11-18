# Bars plugin
# Initialization

require 'sketchup.rb'
require 'extensions.rb'

module Brighter3DSoftwareDevelopmentLtd
module BarsPlugin

automdimensionsTExtension = SketchupExtension.new "AutoMagicDimensions", "barsPlugin/barsPlugin"
automdimensionsTExtension.description = "Bars plugin"
automdimensionsTExtension.version     = "1.0.0"
automdimensionsTExtension.creator     = "Brighter3D Software Development Ltd."
automdimensionsTExtension.copyright   = "2019"

Sketchup.register_extension automdimensionsTExtension, true

end # module BarsPlugin
end # module Brighter3DSoftwareDevelopmentLtd