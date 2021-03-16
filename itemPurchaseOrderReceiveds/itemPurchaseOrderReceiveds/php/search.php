<?php 

	if(isset($_POST['search'])){
		$text = $_POST['input'];
		$sql = "SELECT *FROM `itempurchaseorderreceiveds`  join `itempurchaseorderdetails` ON itempurchaseorderreceiveds.poLineId= itempurchaseorderdetails.poLineId WHERE lotId=$text";
	}
?>