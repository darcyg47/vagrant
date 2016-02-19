<?php
	ini_set('session.cookie_domain', ''); 
	session_unset();

	header("Location: /");
?>