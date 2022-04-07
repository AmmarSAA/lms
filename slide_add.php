<?php

/****************************
* File Name: slide_add.php 	*
* Author: Ammar S.A.A 		*
* Output: Adding Slide 		*
****************************/

require('config.php');
require(WEBSITE_PATH.'./includes/db_connection.php');
require(WEBSITE_PATH.'./includes/session.php');
include(WEBSITE_PATH.'./includes/header.php');
include(WEBSITE_PATH.'./includes/logo.php');
include(WEBSITE_PATH.'./includes/menu.php');

// perform slide addition
if (isset($_POST['slide-add']))
{
	
	$slide_no 			= 100;
	$title 				= trim($_POST['title']);
	$content 			= trim($_POST['content']);
	$slider_img_checker = trim($_POST['slider_img_checker']);
	$slider_img 		= $_FILES['slider_img']['name'];
	$slider_img_temp 	= $_FILES['slider_img']['tmp_name'];

	//Moves uploaded SLider Image to a permenent location
	move_uploaded_file($slider_img_temp,"./images/slider/$slider_img");
	
	if (!empty($slider_img_checker) ){
		if (isset($_GET['id']))
		{
			if(empty($slider_img)) 
			{    
				$sql_slider_img = "SELECT * FROM `tblslider` WHERE id = '{$_GET['id']}' ";

				$sql = $conn->query($sql_slider_img);

				while($row = mysqli_fetch_array($sql)) {
				    $slider_img   = $row['slider_img'];
				}

			}
			$sql = "UPDATE tblslider SET 
        	`title` 		= '{$title}',
        	`content` 		= '{$content}',
			`slider_img` 	= '{$slider_img}'
        	WHERE id = {$_POST['id']}";
		}
		else{
			$sql = "INSERT INTO `tblslider`(`title`, `content`, `slider_img`) 
				VALUES ('{$title}', '{$content}', '{$slider_img}')";
		}
		if ($slide_no < 0) {
			$msg = "<div class='alert alert-info text-capitalize'><strong>slide no.</strong> can never be <strong>0 or lower</strong>.</div>";
		}elseif (IfExist(TBLSLIDER, 'slide_no', $slide_no)) {
			$msg = "<div class='alert alert-warning text-capitalize'><strong>slide no. ".$slide_no."</strong> already exists, To View the list Click/Tap <a href='".WEBSITE_URL."/slide_list.php'>HERE</a>.</div>";
		}else{
			$result = $conn->query($sql);
			if ($result)
			{
				$msg = "<div class='alert alert-success text-capitalize'>entry successful! to view total slides click/tap <a href='".WEBSITE_URL."./slide_list.php'>HERE</a>.</div>";
			}else{
				$msg = "<div class='alert alert-danger text-capitalize'>Errors occured!</div>"; 
			}
		}
	}else{
		$msg = "<div class='alert alert-danger text-capitalize'>slide picture can never be empty.</div>";
	}
}

$title 			= '';
$content 		= '';
$slider_img 	= '';

if (isset($_GET['id']))
{
$select = "SELECT * FROM `tblslider` where id={$_GET['id']}";
$result = $conn->query($select);
	if ($result && $result->num_rows > 0){
		$row = $result->fetch_assoc();
		$id 			= $row['id'];
		$title 			= $row['title'];
		$content 		= $row['content'];
		$slider_img 	= $row['slider_img'];
	};		
}

if (isset($msg))
{
	echo $msg;
}
?> 							
		<section id="content">
			<div class="page-wrapper">
				<div class="container-fluid">
					<div class="row">
						<div class="col">
							<!--SlideAdd Form-->
							<form class="" name="slide-add" method="post" action="#" enctype="multipart/form-data">
								<br />
								<input type="hidden" name="slide-add" value="slide-add" />
								<input type="hidden" name="id" value="<?php echo $id;?>" />
								<span class="f-img fa fa-slideshare fa-4x"></span>
								<h2>Slide</h2>
								<p>Add Slide Form</p>
								<p class="labelenglish"><b>Picture:</b></p>
								<input type="file" accept="img/*" value="<?php echo $slider_img ?>" name="slider_img" class="labelenglish text-uppercase"/>
								<input type="hidden" name="slider_img_checker" value="<?php echo $slider_img;?>" />
								<p class="labelenglish"><small><b>Note:</b><br /> Your <b class="text-uppercase text-right"><?php if(empty($slider_img)){ echo 'Picture'; }else{ echo $slider_img; } ?></b> must not be more than <b>11 MB</b>.</small></p>
								<!--<p class="labelenglish"><b>Slide No.:</b></p>
								<input type="number" value="<?php //echo $slide_no ?>" name="slide_no" class="blank" required hidden/>-->
								<p class="labelenglish"><b>Topic:</b></p>
								<input type="text" value="<?php echo $title ?>" name="title" class="blank" />
								<p class="labelenglish"><b>Content:</b></p>
								<textarea  class="blank" name="content"><?php echo $content ?></textarea>
								<div>
									<input type="reset" name="reset" value="Reset"  class="btn btn-success"/>
									<?php 

									if (isset($_GET['id'])) {
										echo "<input type='submit' name='submit' value='Update'  class='btn btn-success' />";
									}
									else{
										echo "<input type='submit' name='submit' value='Add'  class='btn btn-success' />";
									}

									?>
								</div>
								<br />
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
<?php
include(WEBSITE_PATH.'./includes/footer.php');
?>