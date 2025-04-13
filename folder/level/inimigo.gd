extends CharacterBody2D

const SPEED = 1300.0
const JUMP_VELOCITY = -400.0

@onready var identificador_de_parede:= $identificador_de_parede as RayCast2D
@onready var animacao := $animacao as AnimatedSprite2D 

#inimigo anda da direita para a esquerda
var direction := -1

func _physics_process(delta: float) -> void:
	# Adiciona gravidade.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# inverte a direção ao colidir com a parede. - corrigir
	if identificador_de_parede.is_colliding():
		direction *= -1
		identificador_de_parede.scale.x *= -1
		
	if direction == 1:
		animacao.flip_h = false
	else: 
		animacao.flip_h = true

	velocity.x = direction * SPEED * delta

	move_and_slide()

func _on_animacao_animation_finished(animacao_name: StringName) -> void:
	if animacao_name == "hurt":
		queue_free()
