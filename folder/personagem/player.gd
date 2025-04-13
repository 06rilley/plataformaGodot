extends CharacterBody2D
const SPEED = 200.0
const JUMP_VELOCITY = -350.0

@onready var animacao := $animacoes as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# adiciona gravidade
	if not is_on_floor():
		velocity += get_gravity() * delta

	# se apertar barra espaço e estiver no chão, o player pula
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# movimentação do player, setas esquerda e direta
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animacao.scale.x = direction
		# animação ao andar
		animacao.play("animacao-correndo")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		#animação volta ao padrão quando o player para
		animacao.play("animacao-padrao")

	move_and_slide()
