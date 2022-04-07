<?php 

/****************************
* File Name: feedback.php 	*
* Author: Ammar S.A.A 		*
* Output: Feedback Page 	*
****************************/

require('config.php');
require(WEBSITE_PATH.'./includes/db_connection.php');
require(WEBSITE_PATH.'./includes/session.php');
include(WEBSITE_PATH.'./includes/header.php');
include(WEBSITE_PATH.'./includes/logo.php');
include(WEBSITE_PATH.'./includes/menu.php');

$id             = '';
$feedback       = '';
$feedback_urdu  = '';
$rating         = '';
$reply          = '';
$user_name      = '';
$user_email     = '';
$creation_date  = '';

if(isset($_GET['action']) && isset($_GET['id']))
{
    $edit_id    = $_GET['id'];
    $action     = $_GET['action'];
}else{
    $edit_id    = '';
    $action     = '';
}


if (IfIsUser($conn)) {
    $sql_user = "SELECT * FROM tblusers WHERE user_name = '{$_SESSION['user_name']}' ";
    $sql = $conn->query($sql_user);

    while($row = mysqli_fetch_array($sql)) {

        $id                 = $row['id'];
        $full_name          = $row['full_name'];
        $email_id           = $row['email_id'];
        $user_name          = $row['user_name'];
        $status             = $row['status'];
        $profile_picture    = $row['profile_picture'];
    }
} elseif (!IfIsUser($conn)) {
    $sql_admin = "SELECT * FROM admin WHERE user_name = '{$_SESSION['user_name']}' ";
    $sql = $conn->query($sql_admin);

   if ($sql && $sql->num_rows > 0) {

        $row = $sql->fetch_assoc();
        $id 				= $row['id'];
        $full_name 			= $row['full_name'];
        $email_id 			= $row['admin_email'];
        $user_name 			= $row['user_name'];
        $status 			= $row['status'];
        $profile_picture 	= $row['profile_picture'];
    }
}


if(isset($_POST['feedback_form'])) {

    $user_id 		= $id;
    $email 			= trim($email_id);
    $feedback 		= trim($_POST['feedback']);
    $feedback_urdu 	= trim($_POST['feedback_urdu']);
    if (!IfIsUser($conn)) {
        $reply          = trim($_POST['reply']);
        }    
    //$creation_date 	= now();

    if (empty($reply) && (!empty($feedback) || !empty($feedback_urdu))) {

        $sql = "INSERT INTO 
        		tblfeedback 
        			(user_id, 
        			email_id, 
        			feedback, 
        			feedback_urdu,
        			rating,
                    creation_date) 
        		VALUES 
        		({$user_id},
        		'{$email}', 
        		'{$feedback}', 
        		'{$feedback_urdu}',
                '{$rating}',
        		now())";

        $result = $conn->query($sql);

        if ($result) {
        	$msg = "<div class='alert alert-success text-capitalize'>thanks for feedback. If needed we'll reach you.</div>";
        }else{
        	$msg = "<div class='alert alert-danger text-capitalize'>Opss! Errors occured, please try again.</div>";
        }
    }elseif (!empty($reply) || !empty($reply_urdu)) {

        $sql = "UPDATE 
                tblfeedback 
                SET
                reply_id        = {$user_id}, 
                feedback_reply  = '{$reply}',
                reply_date      = now()  
                WHERE 
                id={$_POST['id']}";

        $result = $conn->query($sql);

        if ($result) {
            $msg = "<div class='alert alert-success text-capitalize'>Hurray! Delivered.</div>";
        }else{
            $msg = "<div class='alert alert-danger text-capitalize'>Opss! Errors occured, please try again.</div>";
        }
    }else{
    	$msg = "<div class='alert alert-danger'>Opss! You have to fill atleast ONE FIELD.</div>";
    }
}

if (isset($_GET['action']) && isset($_GET['id']))
{
$select= "SELECT
            tblfeedback.id,
            tblfeedback.feedback,
            tblfeedback.feedback_urdu,
            tblfeedback.feedback_reply,
            tblfeedback.rating,
            admin.user_name,
            tblusers.full_name,
            tblusers.email_id,
            tblfeedback.creation_date,
            tblfeedback.reply_date
        FROM
            tblfeedback
        INNER JOIN tblusers ON tblfeedback.user_id = tblusers.id
        INNER JOIN admin ON tblfeedback.reply_id = admin.id
        #ORDER BY id DESC
        WHERE tblfeedback.id={$_GET['id'] }";
    $result = $conn->query($select);
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $id             = $row['id'];
        $feedback       = $row['feedback'];
        $feedback_urdu  = $row['feedback_urdu'];
        $rating         = $row['rating'];
        $replied_by     = $row['user_name'];
        $reply          = $row['feedback_reply'];
        $admin_name     = $row['user_name'];
        $user_name      = $row['full_name'];
        $user_email     = $row['email_id'];
        $creation_date  = $row['creation_date'];
        $reply_date     = $row['reply_date'];
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
	                	<!--Feedback Form-->
							<form action="#" method="post" role="feedbac_form">
							<br/>
                				<input type="hidden" name="feedback_form" value="feedback_form" />
                				<input type="hidden" name="id" value="<?php echo $id; ?>" />
                				<img class="f-img img-circle" src="<?php echo WEBSITE_URL; ?>/images/profile_pictures/<?php if(empty($profile_picture)){ echo '../monitor_mlms.png'; }else{ echo $profile_picture; } ?>" />
                				<h2>Your Feedback</h2>
								<p class="labelenglish"><b>Feedback:</b></p>
								<textarea name="feedback" class="blank" rows="3"><?php echo $feedback ?></textarea>
								<p class="labelurdu"><b>:رائے</b></p>
								<textarea name="feedback_urdu" class="urdu blank" rows="3"><?php echo $feedback_urdu ?></textarea>
								<div>
                                    <!--Rating from 1-5 stars-->
                                    <p class="labelenglish" hidden><b>Rating:</b></p><br />
                                    <div class="form-check">
                                        <div class="form-check-inline" name="rating">
                                            <input class="form-check-input" type="radio" name="rating" value="1" 
                                            <?php if ($rating == 1) { echo "Checked"; } else { echo " "; } ?>
                                            />
                                            <label class="form-check-label" for="rating">
                                                ⭐
                                            </label>
                                        </div>
                                        <div class="form-check-inline" name="rating">
                                            <input class="form-check-input" type="radio" name="rating" value="2" 
                                            <?php if ($rating == 2) { echo "Checked"; } else { echo " "; } ?>
                                            />
                                            <label class="form-check-label" for="rating"> 
                                                ⭐⭐
                                            </label>
                                        </div>
                                        <div class="form-check-inline" name="rating">
                                            <input class="form-check-input" type="radio" name="rating" value="3" 
                                            <?php if ($rating == 3) { echo "Checked"; } else { echo " ";}?>
                                            />
                                            <label class="form-check-label" for="rating">
                                                ⭐⭐⭐
                                            </label>
                                        </div>
                                        <div class="form-check-inline" name="rating">
                                            <input class="form-check-input" type="radio" name="rating" value="4" 
                                            <?php if ($rating == 4) { echo "Checked"; } else { echo " ";}?>
                                            />
                                            <label class="form-check-label" for="rating"> 
                                                ⭐⭐⭐⭐
                                            </label>
                                        </div>
                                        <div class="form-check-inline" name="rating">
                                            <input class="form-check-input" type="radio" name="rating" value="5" 
                                            <?php if ($rating == 5) { echo "Checked"; } else { echo " ";}?>
                                            />
                                            <label class="form-check-label" for="rating"> 
                                                ⭐⭐⭐⭐⭐
                                            </label>
                                        </div>
                                        <!--If Admin edits,Reply-->
                                        <?php if(!IfIsUser($conn) && isset($_GET['id'])){ ?>
                                        <p class="labelenglish"><b>Reply:</b></p>
                                        <textarea name="reply" class="blank" rows="3"><?php echo $reply ?></textarea>
                                        <?php }?>
                                        <!--Buttons-->
                                        <div>
                                            <!--Reset Everything-->
        									<input type="reset" value="Reset" name="reset" class="btn btn-success" />
        								    <!--If User-->
                                            <?php if(IfIsUser($conn)){?>
                                                <!-- If User edits, Update -->
                                                <?php if(!empty($action) && !empty($edit_id)){ ?>
                                                <input type="submit" value="Update" name="submit" class="btn btn-success" />
                                                <!--If User not edits, Submit-->
            								    <?php }else{ ?>
                                                <input type="submit" value="Submit" name="submit" class="btn btn-success" />
                                            <!--If Admin-->
                                            <?php }}else{ ?>
                                                <!--If Admin edits,Reply-->
                                                <?php if(!empty($action) && !empty($edit_id)){ ?>
                                                <input type="submit" value="Reply" name="submit" class="btn btn-success" />
                                                <!--If Admin not edits, Submit-->
                                                <?php }else{ ?>
                                                <input type="submit" value="Submit" name="submit" class="btn btn-success" />
                                            <?php }} ?>
                                            <!--ENDIF-->
                                        </div>
                                    </div>
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