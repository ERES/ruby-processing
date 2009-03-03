require 'ruby-processing'

# Move and click the mouse to generate signals. 
# The top row is the signal from "mouseX", 
# the middle row is the signal from "mouseY",
# and the bottom row is the signal from "mousePressed". 

class MouseSignals < Processing::App

  def setup
    @xvals = Array.new width, 0
    @yvals = Array.new width, 0
    @bvals = Array.new width, 0
  end
  
  def draw
  	background 102
  	
  	(1...width).each do |i|
  		@xvals[i-1] = @xvals[i]
  		@yvals[i-1] = @yvals[i]
  		@bvals[i-1] = @bvals[i]
  	end
  	
  	@xvals[width-1] = mouse_x
  	@yvals[width-1] = mouse_y
  	if mouse_pressed?
	  	@bvals[width-1] = 0
	else
	  	@bvals[width-1] = 200
	end
	
	fill 255
	no_stroke
	rect 0, height/3, width, height/3+1
	
	(1...width).each do |i|
		stroke 255
		point i, @xvals[i]/3
		stroke 0
		point i, height/3+@yvals[i]/3
		stroke 255
		line i, 2*height/3+@bvals[i]/3, i, 2*height/3+@bvals[i-1]/3
	end
  end
  
end

MouseSignals.new :title => "Mouse Signals", :width => 200, :height => 200