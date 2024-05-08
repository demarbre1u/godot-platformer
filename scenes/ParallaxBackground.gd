extends ParallaxBackground

@export var parallaxSpeedX: float = 50.0
@export var parallaxSpeedY: float = 30.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= delta * parallaxSpeedX
	scroll_offset.y -= delta * parallaxSpeedY
	
