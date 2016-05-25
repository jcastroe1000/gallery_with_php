<?php
    include "config.php";
    error_reporting(E_ALL);
    session_start();
    if (!isset($_SESSION['user_name'])) {
        header("Location: admin.php");
    }       
    $mail = $_SESSION['user_name'];
    $query2 = "SELECT nombre FROM Users WHERE user='$mail'";
    $res = mysqli_query($mysqli, $query2);
    $mysqli->close(); //cerramos la conexió
    $num_row = mysqli_num_rows($res);
    $row = mysqli_fetch_array($res);
?>

<!DOCTYPE html>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>Añadir Nueva Imagen</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" sizes="32x32" href="images/logo_gris.png">
	<!-- end: Mobile Specific -->
	   
        
	<!-- start: CSS -->
	<link id="bootstrap-style" href="css_template/bootstrap.min.css" rel="stylesheet">
	<link href="css_template/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css_template/admin.css" rel="stylesheet">
	<link id="base-style-responsive" href="css_template/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<script src="js/jquery.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/upload.js"></script>
        <script src="js/bootbox.js"></script>
        <script src="js/bootbox.min.js"></script>
        <link rel="shortcut icon" href="images/logo_gris.png">
	<!-- end: Favicon -->
	
		
		
		
</head>

<body>
		<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
                            <a class="brand" href="index.html"><span><h2><img src="images/logo_blanco.png" style="height: 60px"></h2></span></a>
								
				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">


						
						
						<!-- start: User Dropdown -->
						<li class="dropdown">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="halflings-icon white user"></i> 
                                                                <?php echo $row['nombre'] ?>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title">
                                                                    <span>Opciones</span>   
								</li>
								
                                                                <li><a href="logout.php?logout">
                                                                        <i class="halflings-icon off">
                                                                            </i> Cerrar Sesión
                                                                    </a>  </li>
							</ul>
						</li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
                            <div class="nav-collapse sidebar-nav">
                                    <ul class="nav nav-tabs nav-stacked main-menu">
                                        <li><a href="images.php"><i class="icon-upload-alt"></i><span class="hidden-tablet">&nbsp;Subir Imagenes</span></a></li>
                                        <li><a href="drones_gallery.php"><i class="icon-upload-alt"></i><span class="hidden-tablet">&nbsp;Galería Por Drones</span></a></li>
                                        <li><a href="categories_gallery.php"><i class="icon-upload-alt"></i><span class="hidden-tablet">&nbsp;Galería Por Categorías</span></a></li>
                                    </ul>
				</div>   
			    </div>
			</div>
			<!-- end: Main Menu -->
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
                            <ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.php">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
                                <li><a href="images.php">Añadir Nueva Imagen</a></li>
			</ul>

<h1 style="text-align: center">LLENA LOS SIGUIENTES CAMPOS</h1>
<p><br/></p>

<div class="panel panel-default">
    
    <div class="panel-body">
        
        <form  id="subida" class="form-horizontal">
            
             <div class="control-group col-sm-5 mar-top40">
		<label class="control-label" for="focusedInput">Titulo De la Imagen: </label>
		    <div class="controls">
                        <input class="input-xlarge focused" type="text" id="title" name="title" pattern="[^'\x22]+"
                               title="este campo no acepta caracteres especiales, solo letras" >
		    </div>
	    </div>
            
            <div class="control-group col-sm-5 mar-top41">
                <label class="control-label">Seleccionar Archivo:</label>
                <div class="controls">
                    <input type="file" id="foto" name="foto">
                </div>
            </div>
            
            <div class="control-group  col-sm-5 mar-top41" >
		<label class="control-label" for="selectError">Tipo De Drone:</label>
                <div class="controls" >
                    <select class="selectpicker" id="drone" name="drone" >
                        <optgroup label="Drones"  >
                            <option value="0">Ninguno</option>
                            <option value="1">Phantom 2</option>
                            <option value="2">Inspire 1</option>
                            <option value="3">Osmo</option>
                            <option value="4">Hexacoptero</option>
                        </optgroup>
                    </select>
                </div>
            </div>
                   <div class="control-group  col-sm-5 mar-top41" >
		<label class="control-label" for="selectError">Categoría:</label>
                <div class="controls" >
                    <select class="selectpicker" id="category" name="category" >
                        <optgroup label="Categorias" >
                            <option value="0">Ninguno</option>
                            <option value="1">Productoras</option>
                            <option value="2">Constructoras</option>
                            <option value="3">Eventos</option>
                            <option value="4">Hoteles</option>
                            <option value="5">Gobierno</option>
                            <option value="6">Privado</option>
                        </optgroup>
                    </select>
		</div>
            </div>
           
            
            <div class="form-group">
                <input type="hidden" type="text" class="form-control" name="creation_date" id="creation_date" value="<?php echo date("Y/m/d") ?>">
            </div>
            <center>
                <a href="images.php" class="btn btn-primary btn-md mar-right"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span><i class="icon-arrow-left"></i>&nbsp; Regresar</a>
                <button type="submit"  class="btn btn-success "><i class="icon-save"></i>&nbsp; Guardar</button>
            </center>
                
            
            
        </form>
    </div>
</div>

                        </div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2016 <a >Blick</a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="js_template/jquery-1.9.1.min.js"></script>
	<script src="js_template/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js_template/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js_template/jquery.ui.touch-punch.js"></script>
	
		<script src="js_template/modernizr.js"></script>
	
		<script src="js_template/bootstrap.min.js"></script>
	
		<script src="js_template/jquery.cookie.js"></script>
	
		<script src='js_template/fullcalendar.min.js'></script>
	
		<script src='js_template/jquery.dataTables.min.js'></script>

		<script src="js_template/excanvas.js"></script>
	<script src="js_template/jquery.flot.js"></script>
	<script src="js_template/jquery.flot.pie.js"></script>
	<script src="js_template/jquery.flot.stack.js"></script>
	<script src="js_template/jquery.flot.resize.min.js"></script>
	
		<script src="js_template/jquery.chosen.min.js"></script>
	
		<script src="js_template/jquery.uniform.min.js"></script>
		
		<script src="js_template/jquery.cleditor.min.js"></script>
	
		<script src="js_template/jquery.noty.js"></script>
	
		<script src="js_template/jquery.elfinder.min.js"></script>
	
		<script src="js_template/jquery.raty.min.js"></script>
	
		<script src="js_template/jquery.iphone.toggle.js"></script>
	
		<script src="js_template/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js_template/jquery.gritter.min.js"></script>
	
		<script src="js_template/jquery.imagesloaded.js"></script>
	
		<script src="js_template/jquery.masonry.min.js"></script>
	
		<script src="js_template/jquery.knob.modified.js"></script>
	
		<script src="js_template/jquery.sparkline.min.js"></script>
	
		<script src="js_template/counter.js"></script>
	
		<script src="js_template/retina.js"></script>

		<script src="js_template/custom.js"></script>
                <script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
                <script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
