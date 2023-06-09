extends KinematicBody2D

export var speed: int
export var HP: int
export var dano: int
export var knockback : int

export var vel_normal: int
export var vel_corrida : int

var direcao = Vector2(0,0)
var frente
  
func _physics_process(delta):
	definir_movimento()
	definir_animacao()
	move_and_slide(direcao * speed)
	
func recebeu_ataque(dano, dir):

	HP -= dano
	if HP <= 0:
		$AnimationPlayer.play("morrer")
		set_physics_process(false)
		#print("morreu")
	empurar_tras(dir)
	pos_ataque()
	
func empurar_tras(dir):
	$AudioStreamPlayer.stream = load("res://Assets/SFX/Socapex - new_hits_2.wav")
	$AudioStreamPlayer.play()
	
	if dir == "_cima":
		position.y -= knockback
	elif  dir == "_baixo":
		position.y += knockback
	elif  dir == "_direita":
		position.x += knockback
	else:
		position.x -= knockback
		
func definir_movimento():
	pass
	
func definir_animacao():
	pass
	
func pos_ataque():
	pass
	
func definir_direcao():
	if direcao.x > 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_direita"
	elif direcao.x < 0 and abs(direcao.x) > abs(direcao.y):
		frente = "_esquerda"
	elif direcao.y > 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_baixo"
	elif direcao.y < 0 and abs(direcao.x) < abs(direcao.y):
		frente = "_cima"
