module Brighter3DSoftwareDevelopmentLtd
module BarsPlugin

def BarsPlugin.GO(rad,width,height,amount)
	
	SKETCHUP_CONSOLE.show
	
	mod = Sketchup.active_model
	 mod.start_operation("Plugin worked")
	  
		g_bar = mod.active_entities.add_group
		
		ent_g = g_bar.entities
		circle = ent_g.add_circle [0.5, 0.5, 1], [0, 0, 1], rad
		cb = ent_g.add_face circle
		#cb =  ent_g.add_face [1,1,0],[-1,1,0],[-1,-1,0],[1,-1,0]
		cb.reverse!
		cb.pushpull -height
		
		
		group1 = ent_g.add_group cb.all_connected
		
		
		distance = width/amount        
        group = group1
        
        for i in 0..amount-1
			group2 = group1.copy
            if (i==0) group_f=group1
			tran = Geom::Transformation.translation [distance, 0, 0]
			group2.transform! tran
			group1=group2
        end
		
		tran = Geom::Transformation.new [0, height/2 , 0], [0, 1, 0], 90.degrees
		
		group_f.transform! tran
		
		h=height-0.3.m
		tran = Geom::Transformation.translation [0, 0, h]
		group_f.transform! tran
		
		x= width.to_f/height
		t = Geom::Transformation.scaling x, 1, 1
		group_f.transform! t
		
		x = (height-0.3.m)
		x= x.to_m
		x= x/0.5
		x=x.to_i


		for i in 0..(x-1)
			group3 = group_f.copy
			tn = Geom::Transformation.translation [0, 0, -0.5.m]
			group3.transform! tn
			group_f = group3
		end
      

  mod.commit_operation
end


def BarsPlugin.InitMenus
  main_menuBR = UI.menu("Plugins").add_submenu("Bars plugin")    
  main_menuBR.add_item("Create Bars") {      
        
        prompts  = ["Radius of single bar","Width","Height","Amount of bars" ]
        defaults = [0.03.m,5.m,2.m,14]
        list     = ["","",""]
        input = UI.inputbox(prompts, defaults, list, "Bars settings")
        
        posX = 0.0
        posY = 0.0
        posZ = 0.0
        rad = input[0]
        width = input[1]
        height = input[2]
		amount = input[3]
		
		BarsPlugin.GO(rad,width,height,amount)
        }  
  main_menuBR.add_item("About") {
   UI.messagebox("Tararara about! Test plugin SketchUp Plugin \nversion 1.1.1 \n\n Brighter3D Software Development Ltd.\n All rights reserved (2016-2017)")
 }
end

def BarsPlugin.InitToolbar(path)
  ic1  = File.join(path,"icons/icon1.png")
  ic1b = File.join(path,"icons/icon1b.png")  

  toolb = UI::Toolbar.new("Bars plugin")

  tbutton1 = UI::Command.new("Go"){ BarsPlugin.GO() }
  tbutton1.tooltip = tbutton1.status_bar_text = "go plugin go"
  tbutton1.small_icon = ic1
  tbutton1.large_icon = ic1b
  toolb.add_item(tbutton1)
  toolb.show    
end

#init toolbar

def self.execute
  # Implement the command here
  BarsPlugin.InitMenus
  BarsPlugin.InitToolbar(Sketchup.find_support_file("Plugins/barsPlugin"))
end

self.execute()

end # module BarsPlugin
end # module Brighter3DSoftwareDevelopmentLtd
