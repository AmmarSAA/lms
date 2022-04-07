<?php 

/********************************************
* File Name: fine_calculator.php 			*
* Author: Ammar S.A.A 						*
* Output: Calculator for calculating fine 	*
********************************************/

?>
<div>
	<p class="labelenglish"><b>Total Damaged Pages:</b></p>
	<input class="blank" type="number" name="damagedpage" required value="<?php echo $damagedpage; ?>" />
	<p class="labelenglish">
		<b>Note: Fine Per Damaged Page is 10 Rs.</b><br />
	<p class="labelenglish">
		<b>Extra Fine:</b>
	</p>
	<input class="blank" type="number" name="extra" required value="<?php echo $extra; ?>" />
	<p class="labelenglish">
		<b>Fine Per Extra:</b>
	</p>
	<input class="blank" type="number" name="fine_per_extra" required value="<?php echo $fine_per_extra; ?>" />
	<p class="labelenglish">
		<b>Total Fine:</b>
	</p>
	<input class="blank" readonly name="fine" value="<?php echo $fine; ?>">
</div>