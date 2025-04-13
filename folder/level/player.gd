extends CharacterBody2D
class_name player
const SPEED = 100.0
const JUMP_VELOCITY = -350.0

#cifrão chama um nó.
@onready var animation:= $"animacoes" as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# adiciona gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# player pula ao apertar a tecla espaço
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# movimentação do player
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction # inverte o player quando ele anda para trás
		animation.play("animacao-correndo") # animação ativada ao andar
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("animacao-padrao") # animação volta ao padrão quando player para

	move_and_slide()
