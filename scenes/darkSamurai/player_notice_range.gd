extends Area2D


func _on_body_entered(body: Node2D) -> void:
		$"..".playerEnteredNoticeArea(body)

func _on_body_exited(body: Node2D) -> void:
	$"..".playerExitedNoticeArea(body)
