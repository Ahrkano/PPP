extends CanvasLayer


func atualiza_health(valor):
	#$Control/ProgressBar.value = valor
	$Control/TextureProgress.value = valor

	#$Control/ItemList.clear()
	#for i in range(valor/2):
	#	$Control/ItemList.add_icon_item(load("res://Assets/Props/heart.png"), false)
