extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# quando o player colidir com o inimigo, uma animação vai ser executada.
	if body.name == "player":
		body.velocity.y = body.JUMP_VELOCITY
		owner.get_node("animacao").play("hurt")
