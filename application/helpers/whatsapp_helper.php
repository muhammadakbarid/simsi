<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
function whatsapp($kepada, $dari, $perihal, $link)
{


	// Get a reference to the controller object
	$CI = get_instance();

	// You may need to load the model if it hasn't been pre-loaded
	$CI->load->model('MSurat');

	$say_first = $CI->MSurat->whatsapp_notif_template_first();
	$say_first = $say_first['say_first'];
	$say_end = $CI->MSurat->whatsapp_notif_template_end();
	$say_end = $say_end['say_end'];



	$pesan = $say_first . "\n\n" . "Ada Surat dari " . $dari . ", \nPerihal " . $perihal . " \nBuka link url ini " . $link . " \n\n" . $say_end;


	$base_url = 'https://api.zuwinda.com/v1/message/send-whatsapp';
	$zuwinda_token = '5b7db80056694e21aeaeb46502573797';
	$ch = curl_init($base_url);
	$payload = json_encode(
		array(
			"instances_id" => "a3dd140b-fcf8-4597-b7e3-afe9779023b4",
			"to" => $kepada,
			"content" => $pesan
		)
	);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json', 'x-access-key:' . $zuwinda_token));
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	$result = curl_exec($ch);
	curl_close($ch);
}
