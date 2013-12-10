<?php

$admin_option_defs=array();
$admin_option_defs['Administration']['securitygroup_management']= array('SecurityGroups','LBL_MANAGE_SECURITYGROUPS_TITLE','LBL_MANAGE_SECURITYGROUPS','./index.php?module=SecurityGroups&action=index');
$admin_option_defs['Administration']['securitygroup_config']= array('SecurityGroups','LBL_CONFIG_SECURITYGROUPS_TITLE','LBL_CONFIG_SECURITYGROUPS','./index.php?module=SecurityGroups&action=config');

  

$admin_option_defs['Administration']['securitygroup_upgrade_info']= array('Upgrade','LBL_SECURITYGROUPS_UPGRADE_INFO_TITLE','LBL_SECURITYGROUPS_INFO','./index.php?module=SecurityGroups&action=info');




$admin_option_defs['Administration']['securitygroup_sugaroutfitters']= array('helpInline','LBL_SECURITYGROUPS_SUGAROUTFITTERS_TITLE','LBL_SECURITYGROUPS_SUGAROUTFITTERS','https://www.sugaroutfitters.com');
  

$admin_group_header[]= array('LBL_SECURITYGROUPS','',false,$admin_option_defs, '');


?>