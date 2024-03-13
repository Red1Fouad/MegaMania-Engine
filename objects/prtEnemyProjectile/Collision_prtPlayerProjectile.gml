if canHitByProjectiles
{
	with other instance_destroy();
	_health--
	
	if _health = 0 {instance_destroy()}
}