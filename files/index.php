<?php
	$directories = array();
	$contents = scandir(getcwd());
	foreach($contents as $content)
		if(is_dir($content) && !in_array($content, array(".", "..")))
			$directories[] = $content;
?>
<!doctype html>

<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--><html class="no-js" lang="en"><!--<![endif]-->
<!-- the "no-js" class is for Modernizr. -->

<head id="www-sitename-com" data-template-set="html5-reset">

	<meta charset="utf-8">
	
	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>My Sites</title>
	
	<!--  Mobile Viewport Fix
	j.mp/mobileviewport & davidbcalhoun.com/2010/viewport-metatag 
	device-width : Occupy full width of the screen in its current orientation
	initial-scale = 1.0 retains dimensions instead of zooming out if page height > device height
	maximum-scale = 1.0 retains dimensions instead of zooming in if page width < device width
	-->
	<!-- Uncomment to use; use thoughtfully!
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	-->
	<meta name="viewport" content="width=1024">

	<link rel="canonical" href="http://www.hinzie.com/writer/articleCreate.php">

	<link rel="shortcut icon" href="http://www.mypassionmedia.com/images/favicon.ico">
	<!-- This is the traditional favicon. http://mky.be/favicon/ -->		 
	<link rel="apple-touch-icon" href="http://www.hinzie.com/images/apple-touch-icon-precomposed.png">
	<!-- The is the icon for iOS's Web Clip. 114x114, name: apple-touch-icon-precomposed.png, no transparency -->
		 
	<!-- CSS: screen, mobile & print are all in the same file -->
	<link rel="stylesheet" href="/writer/css/style.css">
	
	<!-- all our JS is at the bottom of the page, except for Modernizr. -->
	<script src="/writer/js/modernizr-2.5.3.min.js"></script>

	<style>
		*, *:before, *:after { -moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box; }

		html { height: 100%; font: 16px/1.5 Helvetica, Arial, sans-serif; font-weight: 400; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; }
		/* 100% = 16px */

		body { position: relative; min-height: 100%; background-color: #eee; color: #222; overflow-y: scroll; z-index: 0; }

		img { max-width: 100%; }

		section { position: relative; display: block; max-width: 972px; margin: 0 auto; padding: 10px; background: #fff; border-width: 1px; border-style: solid; border-color: #e5e6e9 #dfe0e4 #d0d1d5; }
	</style>
</head>

<body style="color: #eee;">

	<section>
		<?php foreach($directories as $directory) { ?>
		<a href="/<?= $directory; ?>"><?= $directory; ?></a><br>
		<?php } ?>
		<hr>
		<a href="/logout.php">Log out</a>
	</section>
</body>
</html>
