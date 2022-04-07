<?php 

/**************************
* File Name: slider.php   *
* Author: Ammar S.A.A     *
* Output: Carousel        *
**************************/

//selecting all files from tblslider
$sql= "SELECT * FROM tblslider";
$result = $conn->query($sql);

?>                  
<!--Carousel Start-->
<div id="myCarousel" class="carousel slide" data-ride="carousel"  data-bs-interval="500">
  	<!-- Indicators -->
    <ol class="carousel-indicators">
    	<?php $x = 0;
    	foreach ($result as $row) {
    	 	$is_active = "";
    	 	if ($x == 0){
    	 		$is_active = "active";
    	 	} ?>
    		<li data-target="#myCarousel" data-slide-to="<?php echo $x ?>" class="<?php echo $is_active ?>"></li>
		<?php $x++; } ?>
	</ol>
	<!-- Wrapper for slides -->
	<div class="carousel-inner">
    <?php $x =0;
	foreach ($result as $row) {
	 	$is_active = "";
	 	if ($x == 0){
	 		$is_active = "active";
	 	} ?>
    	<div class="item <?php echo $is_active ?>">
      		<img src="<?php echo WEBSITE_URL; ?>/images/slider/<?php echo $row['slider_img'] ?>" width="1000px" height="500px">
    	</div>
		<!--<div class="carousel-caption">
			<p hidden><?php //echo $row['id']; ?></p>
			<h3><?php //echo $row['title']; ?></h3>
			<p><?php //echo $row['content']; ?></p>
		</div>-->
    <?php $x++; } ?>
  	<!-- Left and right controls -->
  	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	    <span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	    <span class="sr-only">Next</span>
	</a>
	</div>
</div>
