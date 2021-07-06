<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//$time_elapsed = timeAgo($time_ago); //The argument $time_ago is in timestamp (Y-m-d H:i:s)format.

//Function definition

function timeAgo($time_ago)
{
	date_default_timezone_set("Asia/Jakarta");
    $time_ago = strtotime($time_ago);
    $cur_time   = time();
    $time_elapsed   = $cur_time - $time_ago;
    $seconds    = $time_elapsed ;
    $minutes    = round($time_elapsed / 60 );
    $hours      = round($time_elapsed / 3600);
    $days       = round($time_elapsed / 86400 );
    $weeks      = round($time_elapsed / 604800);
    $months     = round($time_elapsed / 2600640 );
    $years      = round($time_elapsed / 31207680 );
    // Seconds
    if($seconds <= 60){
        return "Baru saja ";
    }
    //Minutes
    else if($minutes <=60){
        if($minutes==1){
            return "Satu menit yang lalu";
        }
        else{
            return "$minutes menit yang lalu";
        }
    }
    //Hours
    else if($hours <=24){
        if($hours==1){
            return "Satu jam yang lalu";
        }else{
            return "$hours jam yang lalu";
        }
    }
    //Days
    else if($days <= 7){
        if($days==1){
            return "Kemarin";
        }else{
            return "$days hari yang lalu";
        }
    }
    //Weeks
    else if($weeks <= 4.3){
        if($weeks==1){
            return "Seminggu yang lalu";
        }else{
            return "$weeks minggu yang lalu";
        }
    }
    //Months
    else if($months <=12){
        if($months==1){
            return "Sebulan yang lalu";
        }else{
            return "$months bulan yang lalu";
        }
    }
    //Years
    else{
        if($years==1){
            return "Setahun yang lalu";
        }else{
            return "$years tahun yang lalu";
        }
    }
}